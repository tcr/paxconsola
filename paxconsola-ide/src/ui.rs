use crate::*;
use include_dir::*;
use indexmap::IndexMap;
use js_sys::{Uint16Array, Uint8Array};
use paxforth::runner::wasm::*;
use paxforth::targets::wasm::*;
use paxforth::*;
use wasm_bindgen::prelude::*;
use yew::worker::*;
use yew::{html, Component, ComponentLink, Html, InputData, MouseEvent, ShouldRender};

// Relative to src/
const START_CODE: &str = include_str!("default_ui.fth");

pub struct App {
    forth_input: String,
    program: PaxProgram,
    link: ComponentLink<Self>,
    method: Option<(String, Vec<Block>)>,
    context: Box<dyn Bridge<workers::CompilationWorker>>,
    mem: Uint16Array,
    // game_tick: IntervalService,
    // game_handle: Option<IntervalTask>,
    wasm: Option<Uint8Array>,
}

#[wasm_bindgen(inline_js = r##"

export function wasmboy_setup(binary) {
    window.PlayGameboy(binary);
}

export function wasmboy_play() {
    // WasmBoy.WasmBoy.play();
}

export function wasmboy_pause() {
    // WasmBoy.WasmBoy.pause();
}

export function wasmboy_focus() {
    setTimeout(() => document.querySelector("#GAMEBOY_CANVAS").focus(), 1000);
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
    fn wasmboy_focus();

    fn play_dos();
    fn play_gameboy();
    fn play_c64();

    fn alert(value: &str);
}

impl Component for App {
    type Message = Msg;
    type Properties = ();

    fn create(_: Self::Properties, link: ComponentLink<Self>) -> Self {
        let callback = link.callback(|res| match res {
            Response::Answer(program, execute) => Msg::CompileResult(program, execute),
            Response::CompilationError(err) => Msg::CompilationError(err),
            Response::GameboyBinary(binary) => Msg::GameboyBinary(binary),
        });
        // `Worker::bridge` spawns an instance if no one is available
        let context = workers::CompilationWorker::bridge(callback); // Connected! :tada:

        App {
            link,
            // forth_input: "5 5 1 + * print".to_string(),
            forth_input: START_CODE.to_string(),
            program: IndexMap::new(),
            method: None,
            context,
            mem: wasm_memory_init(),
            // game_tick: IntervalService::new(),
            // game_handle: None,
            wasm: None,
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
            Msg::OnGameboyFocus => {
                wasmboy_play();
                true
            }
            Msg::OnGameboyBlur => {
                wasmboy_pause();
                true
            }
            Msg::InputChange(key) => {
                let mem = &self.mem;
                // stdweb::console!(log, format!("input changing to {:?}", key));
                // js! {
                //     @{mem}[0xC020] = @{key as u32};
                // }
                // TODO this didn't work!
                true
            }
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
            Msg::GameboyBinary(binary) => {
                let mut array = Uint8Array::new_with_length(binary.len() as u32);
                array.copy_from(&binary);
                wasmboy_setup(array);
                wasmboy_focus();
                // wasmboy_play();
                // play_gameboy();
                true
            }
            Msg::CompilationError(err) => {
                alert(&format!("compile failed! {}", err));
                true
            }
            Msg::NextTick(wasm) => {
                run_wasm_with_memory(&wasm, &self.mem);
                true
            }
            Msg::GameStop => {
                // if let Some(handle) = self.game_handle.take() {
                //     drop(handle);
                // }
                false
            }
            Msg::Click => {
                // Dispatch compile operation to Worker
                self.context.send(Request::Question(
                    self.forth_input.as_bytes().to_vec(),
                    ExecutionTarget::Debug,
                ));
                true
            }
            Msg::RunInput => {
                // Dispatch compile operation to Worker
                self.context.send(Request::Question(
                    self.forth_input.as_bytes().to_vec(),
                    ExecutionTarget::Wasm,
                ));
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
            // Msg::Inline(method) => {
            //     let mut program = self.program.clone();
            //     inline_into_function(&mut program, &method);
            //     self.method = Some((method.clone(), program.get(&method).unwrap().clone()));

            //     true
            // }
            // Msg::InlineAndOptimize(method) => {
            //     let mut mock_program = self.program.clone();

            //     inline_into_function(&mut mock_program, &method);
            //     optimize_function(&mut mock_program, &method);

            //     self.method = Some((method.clone(), mock_program.get(&method).unwrap().clone()));

            //     true
            // }
            Msg::ShowMethod(method) => {
                self.method = self
                    .program
                    .get(&method)
                    .map(|x| (method.clone(), x.clone()));

                true
            }
            Msg::OnFocus => {
                if let Some(wasm) = self.wasm.clone() {
                    // Register gamepad listener.
                    let input_callback = self.link.callback(|e: usize| Msg::InputChange(e));
                    let input_closure = move |key: usize| {
                        input_callback.emit(key);
                    };
                    // js! {
                    //     ResponsiveGamepad.ResponsiveGamepad.onInputsChange([
                    //         ResponsiveGamepad.ResponsiveGamepad.RESPONSIVE_GAMEPAD_INPUTS.DPAD_UP,
                    //         ResponsiveGamepad.ResponsiveGamepad.RESPONSIVE_GAMEPAD_INPUTS.DPAD_DOWN,
                    //         ResponsiveGamepad.ResponsiveGamepad.RESPONSIVE_GAMEPAD_INPUTS.DPAD_LEFT,
                    //         ResponsiveGamepad.ResponsiveGamepad.RESPONSIVE_GAMEPAD_INPUTS.DPAD_RIGHT,
                    //     ], state => {
                    //         const callback = @{input_closure};
                    //         console.log("gamepad state", state);
                    //         if (state.DPAD_UP) {
                    //             callback(38);
                    //         } else if (state.DPAD_DOWN) {
                    //             callback(40);
                    //         } else if (state.DPAD_LEFT) {
                    //             callback(37);
                    //         } else if (state.DPAD_RIGHT) {
                    //             callback(39);
                    //         }
                    //     });
                    // }

                    // js! {
                    //     ResponsiveGamepad.ResponsiveGamepad.enable()
                    // }
                    // self.game_handle = Some(self.game_tick.spawn(
                    //     std::time::Duration::from_millis(100),
                    //     self.link.callback(move |_| Msg::NextTick(wasm.clone())),
                    // ));
                }
                true
            }
            Msg::OnBlur => {
                // js! {
                //     ResponsiveGamepad.ResponsiveGamepad.disable()
                // }
                // if let Some(handle) = self.game_handle.take() {
                //     drop(handle);
                // }
                true
            }

            Msg::CompileGameboy => {
                play_gameboy();
                // Dispatch compile operation to Worker
                // self.context.send(Request::Question(
                //     self.forth_input.as_bytes().to_vec(),
                //     ExecutionTarget::Gameboy,
                // ));
                true
            }
            Msg::CompileDos => {
                play_dos();
                // Dispatch compile operation to Worker
                // self.context.send(Request::Question(
                //     self.forth_input.as_bytes().to_vec(),
                //     ExecutionTarget::DOS,
                // ));
                true
            }
            Msg::CompileC64 => {
                play_c64();
                // Dispatch compile operation to Worker
                // self.context.send(Request::Question(
                //     self.forth_input.as_bytes().to_vec(),
                //     ExecutionTarget::DOS,
                // ));
                true
            }
        }
    }

    fn view(&self) -> Html {
        let blocks = self
            .method
            .iter()
            .map(|(k, v)| {
                let k1 = k.clone();
                let k2 = k.clone();
                let k3 = k.clone();
                vec![
                    vec![html! {
                        <>
                            <button onclick={
                                self.link
                                    .callback(move |e: MouseEvent| Msg::Reset(k2.clone()))
                            }>
                                {"Original"}
                            </button>
                            // <button onclick={
                            //     self.link
                            //         .callback(move |e: MouseEvent| Msg::Inline(k1.clone()))
                            // }>
                            //     {"Inline"}
                            // </button>
                        </>
                    }],
                    vec![html! {
                        <h3>
                            {format!("{}:", k)}
                        </h3>
                    }],
                    // v.iter()
                    //     .enumerate()
                    //     .map(|(i, b)| {
                    //         [
                    //             vec![html! { <h5 style="margin: 0">{format!("block #{}", i)}</h5> }],
                    //             b.commands()
                    //                 .into_iter()
                    //                 .map(|y| html! { <div>{format!("    {:?}", y.0)}</div> })
                    //                 .collect::<Vec<_>>(),
                    //         ]
                    //         .concat()
                    //     })
                    //     .flatten()
                    //     .collect::<Vec<_>>(),
                ]
                .concat()
            })
            .flatten()
            .collect::<Html>();

        let dump = html! {
            <pre>{blocks}</pre>
        };

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

        html! {
            <div style="display: flex; position: fixed; top: 0; left: 0; right: 0; bottom: 0; flex-direction: column">
                <div id="header">
                    <h1>{"Pax Consola"}</h1>
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
                        <div style="background-color: #333; width: 700px; height: 444px" id="console-target"></div>
                    </div>
                </div>
            </div>
        }
    }
}
