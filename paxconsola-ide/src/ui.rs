use crate::*;
use gloo_console::log;
use indexmap::IndexMap;
use js_sys::{Uint16Array, Uint8Array};
use maplit::*;
use paxforth::runner::wasm::*;
use paxforth::targets::wasm::*;
use paxforth::*;
use wasm_bindgen::prelude::*;
use yew::worker::*;
use yew::{html, Component, ComponentLink, Html, InputData, MouseEvent, ShouldRender};

// Relative to src/
const START_CODE: &str = include_str!("../../games/snake_world.fth");

#[wasm_bindgen(inline_js = r##"

export function wasmboy_setup(binary) {
    document.querySelector('#console-target').innerHTML = '\
        <iframe src="/static/emulators/gameboy/" id="window-gameboy" width="700" height="444"></iframe>\
    ';
    document.querySelector('#window-gameboy').onload = (e) => {
        let dos = document.querySelector('#window-gameboy').contentWindow;
        dos.postMessage(binary);
    };
}

export function wasmboy_play() {
    // WasmBoy.WasmBoy.play();
}

export function wasmboy_pause() {
    // WasmBoy.WasmBoy.pause();
}

export function alert(value) {
    window.alert(value);
}

// export function play_gameboy() {
//     window.PlayGameboyFixed();
// }

export function play_dos() {
    console.info('Playing DOS!');
    document.querySelector('#console-target').innerHTML = '\
        <iframe src="/static/emulators/dos/" id="window-dos" width="700" height="444" style="background: transparent; border: 0px none"></iframe>\
    ';
    document.querySelector('#window-dos').onload = (e) => {
        fetch('/static/emulators/dos/paxconsola.zip').then(res => res.arrayBuffer()).then(arr => {
            let dos = document.querySelector('#window-dos').contentWindow;
            dos.postMessage(new Uint8Array(arr));
        });
    };
}

export function play_gameboy() {
    console.info('Playing Game Boy!');
    document.querySelector('#console-target').innerHTML = '\
        <iframe src="/static/emulators/gameboy/" id="window-gameboy" width="700" height="444" style="background: transparent; border: 0px none"></iframe>\
    ';
    document.querySelector('#window-gameboy').onload = (e) => {
        fetch('/static/emulators/gameboy/paxconsola.gb').then(res => res.arrayBuffer()).then(arr => {
            let dos = document.querySelector('#window-gameboy').contentWindow;
            dos.postMessage(new Uint8Array(arr));
        });
    };
}

export function play_c64() {
    console.info('Playing Commodore 64!');
    document.querySelector('#console-target').innerHTML = '\
        <iframe src="/static/emulators/c64/" id="window-c64" width="700" height="444" style="background: transparent; border: 0px none"></iframe>\
    ';
    document.querySelector('#window-c64').onload = (e) => {
        fetch('/static/emulators/c64/paxconsola.prg').then(res => res.arrayBuffer()).then(arr => {
            let dos = document.querySelector('#window-c64').contentWindow;
            dos.postMessage(new Uint8Array(arr));
        });
    };
}

"##)]
extern "C" {
    fn wasmboy_setup(binary: Uint8Array);
    fn wasmboy_play();
    fn wasmboy_pause();

    fn play_dos();
    fn play_gameboy();
    fn play_c64();

    fn alert(value: &str);
}

pub enum Msg {
    Noop,

    ChangeInput(String),
    Reset(String),

    CompileResult(PaxProgram, ExecutionTarget),
    CompilationError(String),
    GameStop,

    OnGameboyFocus,
    OnGameboyBlur,

    CompileGameboy,
    CompileDos,
    CompileC64,

    PaxForthCompilerResult(String, CurrentTarget),
    RgbasmCompilerResult(HashMap<String, Vec<u8>>),

    GameboyBinary(Vec<u8>),
}

pub struct App {
    forth_input: String,
    program: PaxProgram,
    link: ComponentLink<Self>,
    method: Option<(String, Vec<Block>)>,
    context: Box<dyn Bridge<workers::CompilationWorker>>,
    mem: Uint16Array,
    wasm: Option<Uint8Array>,

    current_target: CurrentTarget,
}

impl Component for App {
    type Message = Msg;
    type Properties = ();

    fn create(_: Self::Properties, link: ComponentLink<Self>) -> Self {
        let callback = link.callback(|res| match res {
            Response::Answer(program, execute) => Msg::CompileResult(program, execute),
            Response::CompilationError(err) => Msg::CompilationError(err),
            Response::GameboyBinary(binary) => Msg::GameboyBinary(binary),

            Response::PaxForthCompilerResult(result, target) => {
                let program = result.expect("Failed to compile Forth program");
                log!("paxforth succeeded.");
                Msg::PaxForthCompilerResult(program, target)
            }

            Response::RgbasmCompilerResult(result) => {
                let files = result.expect("`rgbasm` with non-zero status code");

                log!("rgbasm succeeded.");
                Msg::RgbasmCompilerResult(files)
            }
            Response::RgblinkCompilerResult(result) => {
                let files = result.expect("`rgblink` with non-zero status code");

                log!("rgblink succeeded.");
                Msg::GameboyBinary(files.get("build/paxconsola.gb").unwrap().to_vec())
            }
        });

        // `Worker::bridge` spawns an instance if no one is available
        let context = workers::CompilationWorker::bridge(callback);

        App {
            link,
            forth_input: START_CODE.to_string(),
            program: IndexMap::new(),
            method: None,
            context,
            mem: wasm_memory_init(),
            wasm: None,

            current_target: CurrentTarget::None,
        }
    }

    fn change(&mut self, _props: Self::Properties) -> ShouldRender {
        // Should only return "true" if new properties are different to
        // previously received properties.
        // This component has no properties so we will always return "false".
        false
    }

    fn update(&mut self, msg: Self::Message) -> ShouldRender {
        match msg {
            Msg::Noop => false,

            Msg::CompileResult(program, execute) => {
                self.program = program;
                // js! {
                //     // Clear the canvas
                //     const canvas = document.querySelector("canvas").getContext("2d");
                //     canvas.clearRect(0, 0, canvas.width, canvas.height);
                // }

                // stdweb::console!(log, "compilation done.");

                // Possibly run execution now that we've returned
                match execute {
                    ExecutionTarget::Debug => {}
                    ExecutionTarget::Wasm => {
                        self.mem = wasm_memory_init();

                        let wat = WasmForthCompiler::compile(&self.program);
                        let wasm_buffer = wat::parse_str(&wat).unwrap();

                        // run_wasm(&wasm, false).expect("run_wasm failed");
                        // let wasm_buffer = eval_forth(&self.program, false);

                        let mut wasm = Uint8Array::new_with_length(wasm_buffer.len() as _);
                        wasm.copy_from(&wasm_buffer);

                        // Run first frame.
                        run_wasm_with_memory(&wasm, &self.mem);
                        // stdweb::console!(log, "first frame done.");

                        self.wasm = Some(wasm);

                        // js! {
                        //     setTimeout(() => document.querySelector("#WASM_CANVAS").focus(), 1000);
                        // }
                    }
                    ExecutionTarget::Gameboy => {
                        // TODO need a better data type
                        // let mut filetree: Vec<Vec<u8>> = GB_DIR
                        //     .find("*")
                        //     .expect("invalid glob")
                        //     .filter_map(|file| match file {
                        //         include_dir::DirEntry::File(f) => Some(f),
                        //         _ => None,
                        //     })
                        //     .map(|file| {
                        //         vec![
                        //             file.path().to_string_lossy().as_bytes().to_owned(),
                        //             file.contents().to_owned(),
                        //         ]
                        //     })
                        //     .flatten()
                        //     .collect();

                        // Inject a compiled version of the game
                        // let pax_generated = cross_compile_forth_gb(self.program.clone());
                        // filetree.push("generated/pax_generated.asm".as_bytes().to_owned());
                        // filetree.push(pax_generated.as_bytes().to_owned());

                        // stdweb::console!(log, format!("gameboy code: {}", pax_generated));

                        // js! {
                        //     CompileGameboy(@{filetree})
                        //     .then(({ game }) => {
                        //       console.log("success", game);
                        //       return PlayGameboy(game);
                        //     }).catch(err => {
                        //       console.error("Error Configuring WasmBoy:", err);
                        //     });
                        // }

                        // js! {
                        //     setTimeout(() => document.querySelector("#GAMEBOY_CANVAS").focus(), 1000);
                        // }
                    }
                }
                true
            }
            Msg::CompilationError(err) => {
                alert(&format!("compile failed! {}", err));
                true
            }

            Msg::GameboyBinary(binary) => {
                let mut array = Uint8Array::new_with_length(binary.len() as u32);
                array.copy_from(&binary);
                wasmboy_setup(array);
                // wasmboy_focus();
                // wasmboy_play();
                // play_gameboy();
                true
            }

            Msg::GameStop => {
                // if let Some(handle) = self.game_handle.take() {
                //     drop(handle);
                // }
                false
            }

            Msg::OnGameboyFocus => {
                wasmboy_play();
                true
            }
            Msg::OnGameboyBlur => {
                wasmboy_pause();
                true
            }

            Msg::ChangeInput(code) => {
                self.forth_input = code.clone();

                true
            }

            Msg::Reset(method) => {
                self.method = Some((method.clone(), self.program.get(&method).unwrap().clone()));

                true
            }

            Msg::CompileGameboy => {
                self.current_target = CurrentTarget::Gameboy;

                self.context.send(Request::PaxForthCompile(
                    self.forth_input.clone(),
                    self.current_target,
                ));

                // play_gameboy();
                // Dispatch compile operation to Worker
                // self.context.send(Request::RgbasmCompile(
                //     self.forth_input.as_bytes().to_vec(),
                // ));
                // self.context.send(Request::RgblinkCompile(HashMap::new()));
                true
            }

            Msg::CompileDos => {
                self.current_target = CurrentTarget::Dos;

                play_dos();
                // Dispatch compile operation to Worker
                // self.context.send(Request::Question(
                //     self.forth_input.as_bytes().to_vec(),
                //     ExecutionTarget::DOS,
                // ));
                true
            }

            Msg::CompileC64 => {
                self.current_target = CurrentTarget::Commodore64;

                play_c64();
                // Dispatch compile operation to Worker
                // self.context.send(Request::Question(
                //     self.forth_input.as_bytes().to_vec(),
                //     ExecutionTarget::DOS,
                // ));
                true
            }

            Msg::PaxForthCompilerResult(program, target) => match target {
                CurrentTarget::Gameboy => {
                    self.context.send(Request::RgbasmCompile(hashmap![
                        "build/pax_generated.asm".to_string() => program.as_bytes().to_vec(),
                    ]));
                    true
                }
                _ => {
                    unimplemented!();
                }
            },

            Msg::RgbasmCompilerResult(files) => {
                self.context.send(Request::RgblinkCompile(files));
                true
            }
        }
    }

    fn view(&self) -> Html {
        let oninput = self
            .link
            .callback(|e: InputData| Msg::ChangeInput(e.value.clone()));

        let on_play_dos = self.link.callback(|_| Msg::CompileDos);
        let on_play_gameboy = self.link.callback(|_| Msg::CompileGameboy);
        let on_play_c64 = self.link.callback(|_| Msg::CompileC64);
        let gameboy_action_group = html! {
            <div style="display: flex; flex-direction: row;">
                <button style="flex: 1" class="button-action" onclick=on_play_gameboy>{ "Game Boy" }</button>
                <button style="flex: 1" class="button-action" onclick=on_play_dos>{ "DOS" }</button>
                <button style="flex: 1" class="button-action" onclick=on_play_c64>{ "Commodore 64" }</button>
            </div>
        };

        let forth_input: String = self.forth_input.clone();

        let active_status = if true { "Not active" } else { "Active" };

        html! {
            <div id="ide">
                <div id="header">
                    <h1><a href="/">{"Pax Consola"}</a></h1>
                    <div id="subheader">
                        <a href="/static/about/">{"About"}</a>
                        <a href="/book/">{"Docs"}</a>
                        <a href="http://github.com/tcr/paxconsola">{"Github"}</a>
                    </div>
                </div>
                <div style="display: flex; flex: 1; align-items: stretch; overflow: auto;">
                    <div style="flex: 1; flex-direction: column; display: flex; padding: 16px; overflow: hidden">
                        <div style="flex: 1; flex-direction: column; display: flex; border: 2px solid black">
                            <div id="MONACO_INJECT" style="flex: 1"></div>
                            <textarea id="MONACO_TEXTAREA" rows="10" value=forth_input oninput=oninput />
                        </div>
                    </div>
                    <div style="overflow: auto; background: #ddf; padding: 10px; max-height: 100%">
                        <div>{gameboy_action_group}</div>
                        <div id="console-target"><iframe src="/static/emulators/none/" width="700" height="444"></iframe></div>
                        <div id="console-status">{active_status}</div>
                    </div>
                </div>
            </div>
        }
    }
}
