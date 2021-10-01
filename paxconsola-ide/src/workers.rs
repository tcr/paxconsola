use crate::*;
use serde::{Deserialize, Serialize};
use wasm_bindgen::prelude::*;
use wasm_bindgen::JsCast;
use yew::worker::*;

#[derive(Serialize, Deserialize)]
pub struct NasmSettings {
    pub arguments: Vec<String>,
}

#[wasm_bindgen]
extern "C" {
    fn nasm(this: JsValue) -> js_sys::Promise;
    fn rgbasm(this: JsValue) -> js_sys::Promise;
    fn ca65(this: JsValue) -> js_sys::Promise;
}

pub struct CompilationWorker {
    link: AgentLink<CompilationWorker>,
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

struct NasmCompiler {}

trait Binary {
    fn setup();
    fn run(link: AgentLink<workers::CompilationWorker>, who: HandlerId);
}

impl Binary for NasmCompiler {
    fn setup() {
        import_crossconsola("rgbasm.js");
    }

    fn run(link: AgentLink<workers::CompilationWorker>, who: HandlerId) {
        let locate_file = Closure::wrap(Box::new(move |path: JsValue| {
            let new_path = format!(
                "{}/crossconsola/{}",
                get_origin(),
                path.as_string().unwrap()
            );
            return JsValue::from_str(&new_path);
        }) as Box<dyn FnMut(JsValue) -> JsValue>);

        let settings = NasmSettings {
            arguments: vec!["--version".to_string()],
        };
        let obj_settings = JsValue::from_serde(&settings).unwrap();
        js_sys::Reflect::set(
            &obj_settings,
            &JsValue::from_str("locateFile"),
            locate_file.as_ref().unchecked_ref(),
        )
        .unwrap();

        let callback = Closure::wrap(Box::new(move |settings: JsValue| {
            link.respond(who, Response::CompilationError(format!("hey good job")));
        }) as Box<dyn FnMut(JsValue)>);

        let nasm_future = rgbasm(obj_settings);
        nasm_future.then(&callback);
        callback.forget();
    }
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
        NasmCompiler::setup();

        CompilationWorker { link }
    }

    // Handle inner messages (from callbacks)
    fn update(&mut self, _msg: Self::Message) {
        /* ... */
    }

    // Handle incoming messages from components of other agents.
    fn handle_input(&mut self, msg: Self::Input, who: HandlerId) {
        NasmCompiler::run(self.link.clone(), who);

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
