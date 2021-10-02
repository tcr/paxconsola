use crate::*;
use gloo_console::log;
use include_dir::*;
use serde::{Deserialize, Serialize};
use wasm_bindgen::prelude::*;
use wasm_bindgen::JsCast;
use yew::worker::*;

// Relative to /
static GB_DIR: Dir = include_dir!("./template/gb");

#[derive(Serialize, Deserialize)]
pub struct NasmSettings {
    pub arguments: Vec<String>,
}

#[wasm_bindgen]
extern "C" {
    fn nasm(this: &JsValue) -> js_sys::Promise;
    fn rgbasm(this: &JsValue) -> js_sys::Promise;
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

#[derive(Clone)]
struct NasmCompiler {
    link: AgentLink<workers::CompilationWorker>,
    who: HandlerId,
}

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
        let settings = NasmSettings {
            // arguments: vec!["--version".to_string()],
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

        // let callback = Closure::wrap(Box::new(move |settings: JsValue| {
        //     link.respond(who, Response::CompilationError(format!("hey good job")));
        // }) as Box<dyn FnMut(JsValue)>);

        self.invoke(&obj_settings);
        // nasm_future.then(&callback);
        // callback.forget();
    }
}

impl EmscriptenBinary for NasmCompiler {
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
            "-E".to_string(),
            "-o".to_string(),
            "build/paxconsola.obj".to_string(),
            "src/paxconsola.asm".to_string(),
        ]
    }

    fn setup_filesystem(&self, fs: &FS) {
        recursive_setup_filesystem(fs, &GB_DIR);
    }

    fn exit(&self, fs: &FS, code: usize) {
        log!("status code:", fs);
        if code == 0 {
            let file = fs.readFile("build/paxconsola.gb");
            log!("file = ", file.len());
            self.link
                .respond(self.who, Response::GameboyBinary(file.clone()));
        }
    }
}

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

pub struct CompilationWorker {
    link: AgentLink<CompilationWorker>,
}

impl Agent for CompilationWorker {
    // Available:
    // - `Job` (one per bridge on the main thread)
    // - `Context` (shared in the main thread)
    // - `Private` (one per bridge in a separate thread)
    // - `Public` (shared in a separate thread)
    type Reach = Public<Self>; // Spawn only one instance on the main thread (all components can share this agent)
    type Message = Msg;
    type Input = Request;
    type Output = Response;

    // Create an instance with a link to the agent.
    fn create(link: AgentLink<Self>) -> Self {
        NasmCompiler::import();

        CompilationWorker { link }
    }

    // Handle inner messages (from callbacks)
    fn update(&mut self, _msg: Self::Message) {
        /* ... */
    }

    // Handle incoming messages from components of other agents.
    fn handle_input(&mut self, msg: Self::Input, who: HandlerId) {
        let nasm = NasmCompiler {
            link: self.link.clone(),
            who,
        };
        nasm.run();

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
