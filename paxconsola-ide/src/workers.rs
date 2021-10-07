use crate::program::optimize;
use crate::targets::c64::*;
use crate::targets::dos::*;
use crate::targets::gb::*;
use crate::*;
use gloo_console::log;
use include_dir::*;
use maplit::*;
use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::path::PathBuf;
use wasm_bindgen::prelude::*;
use wasm_bindgen::JsCast;
use yew::worker::*;

// Relative to /
static GB_DIR: Dir = include_dir!("./template/gb");

fn recursive_setup_filesystem(fs: &FS, root_dir: &Dir) {
    // Setup template
    for file in root_dir.files {
        let file_path = file.path().to_string_lossy().to_string();
        fs.writeFile(&file_path, file.contents);
    }
    for dir in root_dir.dirs {
        let dir_path = dir.path().to_string_lossy().to_string();
        fs.mkdirTree(&dir_path);
        recursive_setup_filesystem(fs, &dir);
    }
}

/**
 * Common binary settings.
 */
#[derive(Serialize, Deserialize)]
pub struct EmscriptenSettings {
    pub arguments: Vec<String>,
}

#[wasm_bindgen]
extern "C" {
    fn nasm(this: &JsValue) -> js_sys::Promise;
    fn rgbasm(this: &JsValue) -> js_sys::Promise;
    fn rgblink(this: &JsValue) -> js_sys::Promise;
    fn ca65(this: &JsValue) -> js_sys::Promise;
}

#[wasm_bindgen]
extern "C" {
    type FS;

    #[wasm_bindgen(method)]
    fn writeFile(this: &FS, name: &str, contents: &[u8]);

    #[wasm_bindgen(method)]
    fn mkdir(this: &FS, name: &str);

    #[wasm_bindgen(method)]
    fn mkdirTree(this: &FS, path: &str);

    #[wasm_bindgen(method)]
    fn readFile(this: &FS, path: &str) -> Vec<u8>;
}

fn get_origin() -> String {
    let worker = js_sys::global()
        .dyn_into::<web_sys::WorkerGlobalScope>()
        .unwrap();
    worker.location().origin()
}

fn import_crossconsola(path: &str) {
    let worker = js_sys::global()
        .dyn_into::<web_sys::WorkerGlobalScope>()
        .unwrap();
    worker
        .import_scripts_1(&format!("{}/crossconsola/{}", get_origin(), path))
        .unwrap();
}

/**
 * Implements a generic trait for Emscripten-compiled binaries to simplify running them in a worker
 * thread.
 */
trait EmscriptenBinary: Clone
where
    Self: 'static,
{
    fn import();

    fn args(&self) -> Vec<String>;
    fn setup_filesystem(&self, fs: &FS);
    fn invoke(&self, settings: &JsValue);
    fn locate_file(&self, filename: &str) -> String;
    fn exit(&self, fs: &FS, code: usize);

    fn run(&self) {
        let settings = EmscriptenSettings {
            arguments: self.args(),
        };
        let obj_settings = JsValue::from_serde(&settings).unwrap();

        let compiler: Self = self.clone();
        let locate_file = Closure::wrap(Box::new({
            move |path: JsValue| {
                let new_path = compiler.locate_file(&path.as_string().unwrap());
                return JsValue::from_str(&new_path);
            }
        }) as Box<dyn FnMut(JsValue) -> JsValue>);
        js_sys::Reflect::set(
            &obj_settings,
            &JsValue::from_str("locateFile"),
            locate_file.as_ref().unchecked_ref(),
        )
        .unwrap();

        let s = obj_settings.clone();
        let pre_init = Closure::wrap(Box::new({
            let compiler: Self = self.clone();
            move || {
                let fs = js_sys::Reflect::get(&s, &JsValue::from_str("FS"))
                    .unwrap()
                    .unchecked_into::<FS>();
                compiler.setup_filesystem(&fs);
            }
        }) as Box<dyn FnMut()>);
        js_sys::Reflect::set(
            &obj_settings,
            &JsValue::from_str("preInit"),
            pre_init.as_ref().unchecked_ref(),
        )
        .unwrap();

        let s = obj_settings.clone();
        let on_exit = Closure::wrap(Box::new({
            let compiler: Self = self.clone();
            move |code: JsValue| {
                let fs = js_sys::Reflect::get(&s, &JsValue::from_str("FS"))
                    .unwrap()
                    .unchecked_into::<FS>();
                compiler.exit(&fs, code.as_f64().unwrap() as usize);
            }
        }) as Box<dyn FnMut(JsValue)>);
        js_sys::Reflect::set(
            &obj_settings,
            &JsValue::from_str("onExit"),
            on_exit.as_ref().unchecked_ref(),
        )
        .unwrap();
        on_exit.forget();

        self.invoke(&obj_settings);
    }
}

/**
 * `rgbasm` binary.
 */
#[derive(Clone)]
struct RgbasmCompiler {
    link: AgentLink<workers::CompilationWorker>,
    who: HandlerId,
    initial_files: HashMap<String, Vec<u8>>,
}

impl EmscriptenBinary for RgbasmCompiler {
    fn import() {
        import_crossconsola("rgbasm.js");
    }

    fn locate_file(&self, filename: &str) -> String {
        format!("{}/crossconsola/{}", get_origin(), filename)
    }

    fn invoke(&self, settings: &JsValue) {
        let _ = rgbasm(settings);
    }

    fn args(&self) -> Vec<String> {
        vec![
            format!("-E"),
            format!("-o"),
            format!("build/paxconsola.obj"),
            format!("src/paxconsola.asm"),
        ]
    }

    fn setup_filesystem(&self, fs: &FS) {
        recursive_setup_filesystem(fs, &GB_DIR);
        for (path, file) in &self.initial_files {
            fs.writeFile(path, file);
        }
    }

    fn exit(&self, fs: &FS, code: usize) {
        self.link.respond(
            self.who,
            Response::RgbasmCompilerResult(if code != 0 {
                Err(code)
            } else {
                Ok(hashmap![
                    "build/paxconsola.obj".to_string() => fs.readFile("build/paxconsola.obj"),
                ])
            }),
        )
    }
}

/**
 * `rgblink` binary.
 */
#[derive(Clone)]
struct RgblinkCompiler {
    link: AgentLink<workers::CompilationWorker>,
    who: HandlerId,
    initial_files: HashMap<String, Vec<u8>>,
}

impl EmscriptenBinary for RgblinkCompiler {
    fn import() {
        import_crossconsola("rgblink.js");
    }

    fn locate_file(&self, filename: &str) -> String {
        format!("{}/crossconsola/{}", get_origin(), filename)
    }

    fn invoke(&self, settings: &JsValue) {
        let _ = rgblink(settings);
    }

    fn args(&self) -> Vec<String> {
        vec![
            format!("-mbuild/paxconsola.map"),
            format!("-nbuild/paxconsola.sym"),
            format!("-obuild/paxconsola.gb"),
            format!("build/paxconsola.obj"),
        ]
    }

    fn setup_filesystem(&self, fs: &FS) {
        recursive_setup_filesystem(fs, &GB_DIR);
        for (path, file) in &self.initial_files {
            fs.writeFile(path, file);
        }
    }

    fn exit(&self, fs: &FS, code: usize) {
        self.link.respond(
            self.who,
            Response::RgblinkCompilerResult(if code != 0 {
                Err(code)
            } else {
                Ok(hashmap![
                    "build/paxconsola.gb".to_string() => fs.readFile("build/paxconsola.gb"),
                ])
            }),
        )
    }
}

/**
 * Worker agent that handles all background compilation.
 */
pub struct CompilationWorker {
    link: AgentLink<CompilationWorker>,
}

pub enum CompilationMsg {}

impl Agent for CompilationWorker {
    // Reach:
    // - `Job` (one per bridge on the main thread)
    // - `Context` (shared in the main thread)
    // - `Private` (one per bridge in a separate thread)
    // - `Public` (one instance shared in a separate thread)
    type Reach = Public<Self>;
    type Message = CompilationMsg;
    type Input = Request;
    type Output = Response;

    // Create an instance with a link to the agent.
    fn create(link: AgentLink<Self>) -> Self {
        RgbasmCompiler::import();
        RgblinkCompiler::import();

        CompilationWorker { link }
    }

    // Handle inner messages (from callbacks)
    fn update(&mut self, _msg: Self::Message) {
        /* ... */
    }

    // Handle incoming messages from components of other agents.
    fn handle_input(&mut self, msg: Self::Input, who: HandlerId) {
        match msg {
            Request::RgbasmCompile(initial_files) => {
                let binary = RgbasmCompiler {
                    link: self.link.clone(),
                    who,
                    initial_files,
                };
                binary.run();
            }
            Request::RgblinkCompile(initial_files) => {
                let binary = RgblinkCompiler {
                    link: self.link.clone(),
                    who,
                    initial_files,
                };
                binary.run();
            }

            Request::PaxForthCompile(code, target) => {
                let arg_inline = false;
                let arg_optimize = false;

                let file = PathBuf::from("main.fth");

                let result = std::panic::catch_unwind(move || match target {
                    CurrentTarget::None => unreachable!(),
                    CurrentTarget::Commodore64 => {
                        let mut program = C64ForthCompiler::parse(&code, Some(&file));
                        program =
                            optimize::optimize_main(program.clone(), arg_inline, arg_optimize);
                        let result = C64ForthCompiler::compile(&program);
                        println!("{}", &result);
                        result
                    }
                    CurrentTarget::Gameboy => {
                        let mut program = GameboyForthCompiler::parse(&code, Some(&file));
                        program =
                            optimize::optimize_main(program.clone(), arg_inline, arg_optimize);
                        let result = GameboyForthCompiler::compile(&program);
                        println!("{}", &result);
                        result
                    }
                    CurrentTarget::Dos => {
                        let mut program = DosForthCompiler::parse(&code, Some(&file));
                        program =
                            optimize::optimize_main(program.clone(), arg_inline, arg_optimize);
                        let result = DosForthCompiler::compile(&program);
                        println!("{}", &result);
                        result
                    }
                });
                self.link.respond(
                    who,
                    Response::PaxForthCompilerResult(
                        result.map_err(|x| format!("{:?}", x)),
                        target,
                    ),
                );
            }

            e => {
                unimplemented!("{:?}", e);
            }
        }

        // let mut res = format!("LOL lol");
        // res = format!("{:?}", js_sys::Reflect::get(&out, &JsValue::from_str("arguments")));

        // match msg {
        //     Request::Question(input, execute) => {
        // let program = std::panic::catch_unwind(move || {
        //     let code = inject_prelude(&input);
        //     let program = parse_to_superpax(code);
        // let path = PathBuf::from("main.fth");
        // let mut program = WasmForthCompiler::parse(&self.program, Some(&path));
        //     program
        // });
        // match program {
        //     Ok(mut program) => {
        //         match execute {
        //             ExecutionTarget::Wasm => {
        //                 inline_into_function(&mut program, "main");
        //             }
        //             _ => {}
        //         }
        //         self.link.respond(who, Response::Answer(program, execute));
        //     }
        //     Err(err) => {
        // self.link
        //     .respond(who, Response::CompilationError(res));
        //     }
        // }
        // }
        // }
    }

    fn name_of_resource() -> &'static str {
        "workers/compilation_worker.js"
    }
}
