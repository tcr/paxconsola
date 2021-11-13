use crate::*;
use gloo_console::log;
use js_sys::Uint8Array;
use maplit::*;
use std::io::prelude::*;
use wasm_bindgen::prelude::*;
use yew::worker::*;
use yew::{html, ChangeData, Component, ComponentLink, Html, InputData, MouseEvent, ShouldRender};

// Relative to src/
const SNAKE_WORLD: &str = include_str!("../../games/snake_world.fth");
const SWORD_WORLD: &str = include_str!("../../games/sword_world.fth");
const FORK_WORLD: &str = include_str!("../../games/fork_world.fth");

#[wasm_bindgen(inline_js = r##"

export function play_gameboy_binary(binary) {
    console.info('Playing Game Boy!');
    document.querySelector('#console-target').innerHTML = '\
        <iframe src="/emularity/gameboy/" id="window-gameboy" width="700" height="444"></iframe>\
    ';
    document.querySelector('#window-gameboy').onload = (e) => {
        let dos = document.querySelector('#window-gameboy').contentWindow;
        dos.postMessage(binary);
        dos.focus();
    };
}

export function play_dos_binary(binary) {
    console.info('Playing DOS!');
    document.querySelector('#console-target').innerHTML = '\
        <iframe src="/emularity/dos/" id="window-dos" width="700" height="444" style="background: transparent; border: 0px none"></iframe>\
    ';
    document.querySelector('#window-dos').onload = (e) => {
        let dos = document.querySelector('#window-dos').contentWindow;
        dos.postMessage(binary);
        dos.focus();
    };
}

export function play_c64_binary(binary) {
    console.info('Playing Commodore 64!');
    document.querySelector('#console-target').innerHTML = '\
        <iframe src="/emularity/c64/" id="window-c64" width="700" height="444" style="background: transparent; border: 0px none"></iframe>\
    ';
    document.querySelector('#window-c64').onload = (e) => {
        let dos = document.querySelector('#window-c64').contentWindow;
        dos.postMessage(binary);
        dos.focus();
    };
}

export function setEditorValue(value) {
    window.setEditorValue(value);
}

"##)]
extern "C" {
    fn play_gameboy_binary(binary: Uint8Array);
    fn play_dos_binary(binary: Uint8Array);
    fn play_c64_binary(binary: Uint8Array);

    fn setEditorValue(value: String);
}

pub enum Msg {
    Noop,

    ChangeInput(String),
    ChangeExampleSelection(String),
    ChangeExample,

    CompileGameboy,
    CompileDos,
    CompileC64,

    PaxForthCompilerResult(String, CurrentTarget, Engine),
    PaxForthCompilerError(String),

    RgbasmCompilerResult(HashMap<String, Vec<u8>>, Engine),
    GameboyBinary(Vec<u8>),
    NasmCompilerResult(HashMap<String, Vec<u8>>, Engine),
    Ca65CompilerResult(HashMap<String, Vec<u8>>, Engine),
    Ld65CompilerResult(HashMap<String, Vec<u8>>, Engine),
}

pub struct App {
    link: ComponentLink<Self>,
    context: Box<dyn Bridge<workers::CompilationWorker>>,

    forth_input: String,
    example_selection: String,

    current_target: CurrentTarget,
}

impl Component for App {
    type Message = Msg;
    type Properties = ();

    fn create(_: Self::Properties, link: ComponentLink<Self>) -> Self {
        let callback = link.callback(|res| match res {
            Response::PaxForthCompilerResult(result, target, engine) => match result {
                Err(err) => Msg::PaxForthCompilerError(err),
                Ok(program) => {
                    log!("`paxforth` succeeded.");
                    Msg::PaxForthCompilerResult(program, target, engine)
                }
            },
            Response::RgbasmCompilerResult(result, engine) => {
                let files = result.expect("`rgbasm` with non-zero status code");

                log!("`rgbasm` succeeded.");
                Msg::RgbasmCompilerResult(files, engine)
            }
            Response::RgblinkCompilerResult(result, _engine) => {
                let files = result.expect("`rgblink` with non-zero status code");

                log!("`rgblink` succeeded.");
                Msg::GameboyBinary(files.get("build/paxconsola.gb").unwrap().to_vec())
            }
            Response::NasmCompilerResult(result, engine) => {
                let files = result.expect("`nasm` with non-zero status code");

                log!("`nasm` succeeded.");
                Msg::NasmCompilerResult(files, engine)
            }
            Response::Ca65CompilerResult(result, engine) => {
                let files = result.expect("`ca65` with non-zero status code");

                log!("`ca65` succeeded.");
                Msg::Ca65CompilerResult(files, engine)
            }
            Response::Ld65CompilerResult(result, engine) => {
                let files = result.expect("`ld65` with non-zero status code");

                log!("`ld65` succeeded.");
                Msg::Ld65CompilerResult(files, engine)
            }
        });

        // `Worker::bridge` spawns an instance if no one is available
        let context = workers::CompilationWorker::bridge(callback);

        App {
            link,
            context,

            // Beginning value is "Snake World"
            forth_input: SNAKE_WORLD.to_string(),
            example_selection: "snake_world".to_string(),

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

            Msg::ChangeInput(code) => {
                self.forth_input = code.clone();

                true
            }
            Msg::ChangeExampleSelection(example) => {
                self.example_selection = example.clone();

                true
            }
            Msg::ChangeExample => {
                match self.example_selection.as_str() {
                    "snake_world" => {
                        setEditorValue(SNAKE_WORLD.to_string());
                    }
                    "sword_world" => {
                        setEditorValue(SWORD_WORLD.to_string());
                    }
                    "fork_world" => {
                        setEditorValue(FORK_WORLD.to_string());
                    }
                    _ => {}
                }

                true
            }

            // Compile for specific targets
            Msg::CompileGameboy => {
                self.current_target = CurrentTarget::Gameboy;
                self.context.send(Request::PaxForthCompile(
                    self.forth_input.clone(),
                    self.current_target,
                ));

                true
            }

            Msg::CompileDos => {
                self.current_target = CurrentTarget::Dos;
                self.context.send(Request::PaxForthCompile(
                    self.forth_input.clone(),
                    self.current_target,
                ));

                true
            }

            Msg::CompileC64 => {
                self.current_target = CurrentTarget::Commodore64;
                self.context.send(Request::PaxForthCompile(
                    self.forth_input.clone(),
                    self.current_target,
                ));

                true
            }

            // Compiler results
            Msg::PaxForthCompilerResult(program, target, engine) => {
                match target {
                    CurrentTarget::Gameboy => {
                        self.context.send(Request::RgbasmCompile(hashmap![
                            "build/pax_generated.asm".to_string() => program.as_bytes().to_vec(),
                        ], engine));

                        true
                    }
                    CurrentTarget::Dos => {
                        self.context.send(Request::NasmCompile(hashmap![
                            "build/paxconsola_generated.asm".to_string() => program.as_bytes().to_vec(),
                        ], engine));

                        true
                    }
                    CurrentTarget::Commodore64 => {
                        self.context.send(Request::Ca65Compile(hashmap![
                            "build/paxconsola_generated.asm".to_string() => program.as_bytes().to_vec(),
                        ], engine));

                        true
                    }
                    _ => {
                        unimplemented!();
                    }
                }
            }
            Msg::PaxForthCompilerError(string) => {
                gloo_console::error!("{}", string);
                true
            }

            Msg::RgbasmCompilerResult(files, engine) => {
                self.context.send(Request::RgblinkCompile(files, engine));
                true
            }

            Msg::GameboyBinary(binary) => {
                let array = Uint8Array::new_with_length(binary.len() as u32);
                array.copy_from(&binary);

                play_gameboy_binary(array);

                true
            }

            Msg::NasmCompilerResult(files, _engine) => {
                let binary = files["build/PAXCNSLA.COM"].clone();

                let array = Uint8Array::new_with_length(binary.len() as u32);
                play_dos_binary(array);

                true
            }

            Msg::Ca65CompilerResult(files, engine) => {
                self.context.send(Request::Ld65Compile(files, engine));
                true
            }

            Msg::Ld65CompilerResult(files, _engine) => {
                let binary = files["build/paxconsola.prg"].clone();

                let array = Uint8Array::new_with_length(binary.len() as u32);
                array.copy_from(&binary);

                play_c64_binary(array);

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
        let console_target_actions = html! {
            <div id="console-target-actions">
                <button class="button-action" onclick=on_play_dos>{ "DOS" }</button>
                <button class="button-action" onclick=on_play_c64>{ "Commodore 64" }</button>
                <button class="button-action" onclick=on_play_gameboy>{ "Game Boy" }</button>
            </div>
        };

        let on_change_example = self.link.callback(|e: ChangeData| match e {
            ChangeData::Select(el) => Msg::ChangeExampleSelection(el.value()),
            _ => Msg::Noop,
        });
        let on_change_click = self.link.callback(|_e: MouseEvent| Msg::ChangeExample);

        let forth_input: String = self.forth_input.clone();

        let advice = match self.current_target {
            CurrentTarget::None => "",
            CurrentTarget::Gameboy | CurrentTarget::Dos | CurrentTarget::Commodore64 => {
                "Controls: Use the keypad arrows"
            }
        };

        html! {
            <div id="ide">
                <div id="header">
                    <h1><a href="/">{"Pax Consola"}</a></h1>
                    <div id="subheader">
                        <a href="/book/about.html">{"About"}</a>
                        <a href="/book/">{"Docs"}</a>
                        <a href="http://github.com/tcr/paxconsola">{"Github"}</a>
                    </div>
                </div>
                <div style="display: flex; flex: 1; align-items: stretch; overflow: auto;">
                    <div style="flex: 1; flex-direction: column; display: flex; padding: 10px 16px 16px; overflow: hidden">
                        <div style="padding: 0">
                            <button class="button-action" onclick=on_change_click>{ "Load example... "}</button>
                            <select class="select-action" onchange=on_change_example value=self.example_selection.to_string()>
                                <option value="snake_world">{"Snake World"}</option>
                                <option value="fork_world">{"Fork World (DOS)"}</option>
                                <option value="sword_world">{"Sword World (DOS)"}</option>
                            </select>
                        </div>
                        <div style="flex: 1; flex-direction: column; display: flex; border: 2px solid black">
                            <div id="MONACO_INJECT" style="flex: 1"></div>
                            <textarea id="MONACO_TEXTAREA" rows="10" value=forth_input oninput=oninput />
                        </div>
                    </div>
                    <div style="overflow: auto; background: #ddf; padding: 10px; max-height: 100%">
                        <div>{console_target_actions}</div>
                        <div id="console-target"><iframe src="/emularity/none/" width="700" height="444"></iframe></div>
                        <div id="console-advice">{advice}</div>
                    </div>
                </div>
            </div>
        }
    }
}
