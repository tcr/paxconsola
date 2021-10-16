use crate::program::optimize;
use crate::targets::c64::*;
use crate::targets::dos::*;
use crate::targets::gb::*;
use crate::*;
use include_dir::*;
use maplit::*;
use regex::Regex;
use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::path::PathBuf;
use wasm_bindgen::prelude::*;
use wasm_bindgen::JsCast;
use yew::worker::*;

// Relative to /
static GB_DIR: Dir = include_dir!("../consoles/gb");
static C64_DIR: Dir = include_dir!("../consoles/c64");
static DOS_DIR: Dir = include_dir!("../consoles/dos");

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
    fn ld65(this: &JsValue) -> js_sys::Promise;
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
    engine: Engine,
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
            format!("-D"),
            format!("ENGINE_{}=1", self.engine.0.to_uppercase()),
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
            Response::RgbasmCompilerResult(
                if code != 0 {
                    Err(code)
                } else {
                    Ok(hashmap![
                        "build/paxconsola.obj".to_string() => fs.readFile("build/paxconsola.obj"),
                    ])
                },
                self.engine.clone(),
            ),
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
    engine: Engine,
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
        recursive_setup_filesystem(fs, &C64_DIR);
        for (path, file) in &self.initial_files {
            fs.writeFile(path, file);
        }
    }

    fn exit(&self, fs: &FS, code: usize) {
        self.link.respond(
            self.who,
            Response::RgblinkCompilerResult(
                if code != 0 {
                    Err(code)
                } else {
                    Ok(hashmap![
                        "build/paxconsola.gb".to_string() => fs.readFile("build/paxconsola.gb"),
                    ])
                },
                self.engine.clone(),
            ),
        )
    }
}

/**
 * `nasm` binary.
 */
#[derive(Clone)]
struct NasmCompiler {
    link: AgentLink<workers::CompilationWorker>,
    who: HandlerId,
    initial_files: HashMap<String, Vec<u8>>,
    engine: Engine,
}

impl EmscriptenBinary for NasmCompiler {
    fn import() {
        import_crossconsola("nasm.js");
    }

    fn locate_file(&self, filename: &str) -> String {
        format!("{}/crossconsola/{}", get_origin(), filename)
    }

    fn invoke(&self, settings: &JsValue) {
        let _ = nasm(settings);
    }

    fn args(&self) -> Vec<String> {
        // nasm -f bin -D $(ENGINE_FLAG)=1 -o $(OUT) $(INPUT) -l build/paxconsola.lst
        vec![
            format!("-f"),
            format!("bin"),
            format!("-D"),
            format!("ENGINE_{}=1", self.engine.0.to_uppercase()),
            format!("-o"),
            format!("build/PAXCNSLA.COM"),
            format!("src/paxconsola.asm"),
            format!("-l"),
            format!("build/paxconsola.lst"),
        ]
    }

    fn setup_filesystem(&self, fs: &FS) {
        recursive_setup_filesystem(fs, &DOS_DIR);
        for (path, file) in &self.initial_files {
            fs.writeFile(path, file);
        }
    }

    fn exit(&self, fs: &FS, code: usize) {
        self.link.respond(
            self.who,
            Response::NasmCompilerResult(
                if code != 0 {
                    Err(code)
                } else {
                    Ok(hashmap![
                        "build/PAXCNSLA.COM".to_string() => fs.readFile("build/PAXCNSLA.COM"),
                    ])
                },
                self.engine.clone(),
            ),
        )
    }
}

/**
 * `ca65` binary.
 */
#[derive(Clone)]
struct Ca65Compiler {
    link: AgentLink<workers::CompilationWorker>,
    who: HandlerId,
    initial_files: HashMap<String, Vec<u8>>,
    engine: Engine,
}

impl EmscriptenBinary for Ca65Compiler {
    fn import() {
        import_crossconsola("ca65.js");
    }

    fn locate_file(&self, filename: &str) -> String {
        format!("{}/crossconsola/{}", get_origin(), filename)
    }

    fn invoke(&self, settings: &JsValue) {
        let _ = ca65(settings);
    }

    fn args(&self) -> Vec<String> {
        // $(AS) -t c64 -D $(ENGINE_FLAG)=1 -g src/paxconsola.asm -l build/paxconsola.lst -o $@
        vec![
            format!("-t"),
            format!("c64"),
            format!("-D"),
            format!("ENGINE_{}=1", self.engine.0.to_uppercase()),
            format!("-g"),
            format!("src/paxconsola.asm"),
            format!("-l"),
            format!("build/paxconsola.lst"),
            format!("-o"),
            format!("build/paxconsola.o"),
        ]
    }

    fn setup_filesystem(&self, fs: &FS) {
        recursive_setup_filesystem(fs, &C64_DIR);
        for (path, file) in &self.initial_files {
            fs.writeFile(path, file);
        }
    }

    fn exit(&self, fs: &FS, code: usize) {
        self.link.respond(
            self.who,
            Response::Ca65CompilerResult(
                if code != 0 {
                    Err(code)
                } else {
                    Ok(hashmap![
                        "build/paxconsola.o".to_string() => fs.readFile("build/paxconsola.o"),
                    ])
                },
                self.engine.clone(),
            ),
        )
    }
}

/**
 * `ld65` binary.
 */
#[derive(Clone)]
struct Ld65Compiler {
    link: AgentLink<workers::CompilationWorker>,
    who: HandlerId,
    initial_files: HashMap<String, Vec<u8>>,
    engine: Engine,
}

impl EmscriptenBinary for Ld65Compiler {
    fn import() {
        import_crossconsola("ld65.js");
    }

    fn locate_file(&self, filename: &str) -> String {
        format!("{}/crossconsola/{}", get_origin(), filename)
    }

    fn invoke(&self, settings: &JsValue) {
        let _ = ld65(settings);
    }

    fn args(&self) -> Vec<String> {
        // $(LD) --lib c64.lib -C c64-asm.cfg -u __EXEHDR__ build/paxconsola.o -o $@ -Ln build/paxconsola.lbl -m build/paxconsola.map
        vec![
            format!("--lib"),
            format!("c64.lib"),
            format!("-C"),
            format!("c64-asm.cfg"),
            format!("-u"),
            format!("__EXEHDR__"),
            format!("build/paxconsola.o"),
            format!("-o"),
            format!("build/paxconsola.prg"),
            format!("-Ln"),
            format!("build/paxconsola.lbl"),
            format!("-m"),
            format!("build/paxconsola.map"),
        ]
    }

    fn setup_filesystem(&self, fs: &FS) {
        recursive_setup_filesystem(fs, &C64_DIR);
        for (path, file) in &self.initial_files {
            fs.writeFile(path, file);
        }
    }

    fn exit(&self, fs: &FS, code: usize) {
        self.link.respond(
            self.who,
            Response::Ld65CompilerResult(
                if code != 0 {
                    Err(code)
                } else {
                    Ok(hashmap![
                        "build/paxconsola.prg".to_string() => fs.readFile("build/paxconsola.prg"),
                    ])
                },
                self.engine.clone(),
            ),
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
        // Import WASM dependencies.
        RgbasmCompiler::import();
        RgblinkCompiler::import();
        NasmCompiler::import();
        Ca65Compiler::import();
        Ld65Compiler::import();

        CompilationWorker { link }
    }

    // Handle inner messages (from callbacks)
    fn update(&mut self, _msg: Self::Message) {
        /* ... */
    }

    // Handle incoming messages from components of other agents.
    fn handle_input(&mut self, msg: Self::Input, who: HandlerId) {
        match msg {
            Request::RgbasmCompile(initial_files, engine) => {
                let binary = RgbasmCompiler {
                    link: self.link.clone(),
                    who,
                    initial_files,
                    engine,
                };
                binary.run();
            }
            Request::RgblinkCompile(initial_files, engine) => {
                let binary = RgblinkCompiler {
                    link: self.link.clone(),
                    who,
                    initial_files,
                    engine,
                };
                binary.run();
            }
            Request::NasmCompile(initial_files, engine) => {
                let binary = NasmCompiler {
                    link: self.link.clone(),
                    who,
                    initial_files,
                    engine,
                };
                binary.run();
            }
            Request::Ca65Compile(initial_files, engine) => {
                let binary = Ca65Compiler {
                    link: self.link.clone(),
                    who,
                    initial_files,
                    engine,
                };
                binary.run();
            }
            Request::Ld65Compile(initial_files, engine) => {
                let binary = Ld65Compiler {
                    link: self.link.clone(),
                    who,
                    initial_files,
                    engine,
                };
                binary.run();
            }

            Request::PaxForthCompile(code, target) => {
                let arg_inline = false;
                let arg_optimize = false;

                let file = PathBuf::from("main.fth");

                // Lookup engine from the code sample.
                let engine = get_engine_from_code(&code).expect(
                    "Expected a comment in your source code matching ( @engine <taurus|libra> )",
                );
                // Prepend to existing source code.
                let engine_prefix = match target {
                    CurrentTarget::None => unreachable!(),
                    CurrentTarget::Commodore64 => "c64",
                    CurrentTarget::Gameboy => "gb",
                    CurrentTarget::Dos => "dos",
                };
                let engine_dir = match target {
                    CurrentTarget::None => unreachable!(),
                    CurrentTarget::Commodore64 => C64_DIR,
                    CurrentTarget::Gameboy => GB_DIR,
                    CurrentTarget::Dos => DOS_DIR,
                };
                let engine_and_code = [
                    engine_dir
                        .get_file(&PathBuf::from(&format!(
                            "src/engines/{}-{}.fth",
                            engine_prefix, engine
                        )))
                        .expect(&format!(
                            "Could not find {:?} engine {:?}",
                            engine_prefix, engine
                        ))
                        .contents_utf8()
                        .unwrap(),
                    &code,
                ]
                .join("\n\n");

                let result = ForthParser::parse(&engine_and_code, Some(&file)).map(|program| {
                    let optprogram =
                        optimize::optimize_main(program.clone(), arg_inline, arg_optimize);
                    match target {
                        CurrentTarget::None => unreachable!(),
                        CurrentTarget::Commodore64 => C64ForthCompiler::compile(&optprogram),
                        CurrentTarget::Gameboy => GameboyForthCompiler::compile(&optprogram),
                        CurrentTarget::Dos => DosForthCompiler::compile(&optprogram),
                    }
                });
                if let Ok(res) = &result {
                    println!("{}", res);
                }
                self.link.respond(
                    who,
                    Response::PaxForthCompilerResult(
                        result.map_err(|x| format!("{:?}", x)),
                        target,
                        Engine(engine),
                    ),
                );
            }
        }
    }

    fn name_of_resource() -> &'static str {
        "workers/compilation_worker.js"
    }
}

// This uses a different mechanism than `paxforth metadata` so maybe they should be unified.
fn get_engine_from_code(code: &str) -> Option<String> {
    let re_engine = Regex::new(r"\(\s*@engine\s+(\w+)\s*\)").unwrap();
    re_engine
        .captures(code)
        .map(|x| x.get(1).unwrap().as_str().to_string())
}
