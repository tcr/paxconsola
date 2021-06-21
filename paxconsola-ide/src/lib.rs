#![recursion_limit = "4096"]

use include_dir::*;
use indexmap::IndexMap;
use paxforth::*;
use serde::*;
use stdweb;
use stdweb::js;
use yew::services::interval::*;
use yew::worker::*;
use yew::{html, ClickEvent, Component, ComponentLink, Html, InputData, ShouldRender};

static GB_DIR: Dir = include_dir!("./template/gb");

const START_CODE: &str = r"$C020 constant last-key
$C022 constant random-register
$9800 constant graphics

: random random-register @ 255 and swap % ;

37 constant left
38 constant up
39 constant right
40 constant down

\ 30 constant width
\ 20 constant height

20 constant width
18 constant height

variable initialized
variable frame \ unused

variable snake-x-head
500 cells allot

variable snake-y-head
500 cells allot

variable apple-x
variable apple-y

variable direction
variable length

: snake-x ( offset -- address )
  cells snake-x-head + ;

: snake-y ( offset -- address )
  cells snake-y-head + ;

\ TODO should be multiplying 32 by `cells`
: convert-x-y ( x y -- offset )  32 * + ;
: draw ( color x y -- )  convert-x-y graphics + c! ;
: draw-white ( x y -- )  0 rot rot draw ;
: draw-black ( x y -- )  2 rot rot draw ;
: draw-snake-tile ( x y -- )  3 rot rot draw ;
: draw-apple-tile ( x y -- )  4 rot rot draw ;

: draw-walls
  width 0 do
    i 0 draw-black
    i height 1 - draw-black
  loop
  height 0 do
    0 i draw-black
    width 1 - i draw-black
  loop ;

: initialize-snake
  4 length !
  length @ 1 + 0 do
    8 i - i snake-x !
    8 i snake-y !
  loop
  right direction ! ;

: set-apple-position apple-x ! apple-y ! ;

: initialize-apple  8 13 set-apple-position ;

: initialize
  width 0 do
    height 0 do
      j i draw-white
    loop
  loop
  draw-walls
  initialize-snake
  initialize-apple ;


\ game runtime

: move-up  -1 snake-y-head +! ;
: move-left  -1 snake-x-head +! ;
: move-down  1 snake-y-head +! ;
: move-right  1 snake-x-head +! ;

: move-snake-head  direction @
  left over  = if move-left else
  up over    = if move-up else
  right over = if move-right else
  down over  = if move-down
  then then then then drop ;

\ Move each segment of the snake forward by one
: move-snake-tail  -1 length @ do
    i drop i snake-x @ i 1 + snake-x !
    i snake-y @ i 1 + snake-y !
  1 -loop ;

: is-horizontal  direction @ dup
  left = swap
  right = or ;

: is-vertical  direction @ dup
  up = swap
  down = or ;

: turn-up     is-horizontal if up direction ! then ;
: turn-left   is-vertical if left direction ! then ;
: turn-down   is-horizontal if down direction ! then ;
: turn-right  is-vertical if right direction ! then ;

: change-direction ( key -- )
  left over = if turn-left else
  up over = if turn-up else
  right over = if turn-right else
  down over = if turn-down
  then then then then drop ;

: check-input
  last-key @ change-direction
  0 last-key ! ;

\ get random x or y position within playable area
: random-x-position ( -- pos )
  width 4 - random 2 + ;
: random-y-position ( -- pos )
  height 4 - random 2 + ;

: move-apple
  apple-x @ apple-y @ draw-white
  random-x-position random-y-position
  set-apple-position ;

: grow-snake  1 length +! ;

: check-apple
  snake-x-head @ apple-x @ =
  snake-y-head @ apple-y @ =
  and if
    move-apple
    grow-snake
  then ;

: check-collision ( -- flag )
  \ get current x/y position
  snake-x-head @ snake-y-head @

  \ get color at current position
  convert-x-y graphics + c@

  \ leave boolean flag on stack
  0 = ;

: draw-snake
  length @ 0 do
    i snake-x @ i snake-y @ draw-snake-tile
  loop
  length @ snake-x @
  length @ snake-y @
  draw-white ;

: draw-apple
  apple-x @ apple-y @ draw-apple-tile ;


\ Initialize only once
initialized @ 0= if initialize then
1 initialized !

\ Game loop
draw-snake
draw-apple
check-input
move-snake-tail
move-snake-head
check-apple
check-collision
if else 0 initialized ! then

";

pub struct Worker {
    link: AgentLink<Worker>,
}

#[derive(Serialize, Deserialize, Debug)]
pub enum Request {
    Question(Vec<u8>, ExecutionTarget),
}

#[derive(Serialize, Deserialize, Debug)]
pub enum Response {
    Answer(PaxProgram, ExecutionTarget),
    CompilationError(String),
}

impl Agent for Worker {
    // Available:
    // - `Job` (one per bridge on the main thread)
    // - `Context` (shared in the main thread)
    // - `Private` (one per bridge in a separate thread)
    // - `Public` (shared in a separate thread)
    type Reach = Public; // Spawn only one instance on the main thread (all components can share this agent)
    type Message = Msg;
    type Input = Request;
    type Output = Response;

    // Create an instance with a link to the agent.
    fn create(link: AgentLink<Self>) -> Self {
        Worker { link }
    }

    // Handle inner messages (from callbacks)
    fn update(&mut self, _msg: Self::Message) { /* ... */
    }

    // Handle incoming messages from components of other agents.
    fn handle_input(&mut self, msg: Self::Input, who: HandlerId) {
        match msg {
            Request::Question(input, execute) => {
                let program = std::panic::catch_unwind(move || {
                    let program = parse_to_superpax(code);
                    program
                });
                match program {
                    Ok(mut program) => {
                        match execute {
                            ExecutionTarget::Wasm => {
                                inline_into_function(&mut program, "main");
                            }
                            _ => {}
                        }
                        self.link.respond(who, Response::Answer(program, execute));
                    }
                    Err(err) => {
                        self.link
                            .respond(who, Response::CompilationError(format!("{:?}", err)));
                    }
                }
            }
        }
    }

    fn name_of_resource() -> &'static str {
        "bin/compilation_worker.js"
    }
}

#[derive(Serialize, Deserialize, Debug)]
pub enum ExecutionTarget {
    Debug,
    Gameboy,
    Wasm,
}

pub enum Msg {
    Click,
    ChangeInput(String),
    Reset(String),
    Inline(String),
    InlineAndOptimize(String),
    ShowMethod(String),
    RunInput,
    CompileResult(PaxProgram, ExecutionTarget),
    CompilationError(String),
    NextTick(Vec<u8>),
    GameStop,
    OnFocus,
    OnBlur,
    InputChange(usize),
    CompileGameboy,
    OnGameboyFocus,
    OnGameboyBlur,
}

pub struct App {
    forth_input: String,
    program: PaxProgram,
    link: ComponentLink<Self>,
    method: Option<(String, Vec<Block>)>,
    context: Box<dyn Bridge<Worker>>,
    mem: stdweb::Value,
    game_tick: IntervalService,
    game_handle: Option<IntervalTask>,
    wasm: Option<Vec<u8>>,
}

impl Component for App {
    type Message = Msg;
    type Properties = ();

    fn create(_: Self::Properties, link: ComponentLink<Self>) -> Self {
        let callback = link.callback(|res| match res {
            Response::Answer(program, execute) => Msg::CompileResult(program, execute),
            Response::CompilationError(err) => Msg::CompilationError(err),
        });
        // `Worker::bridge` spawns an instance if no one is available
        let context = Worker::bridge(callback); // Connected! :tada:

        App {
            link,
            // forth_input: "5 5 1 + * print".to_string(),
            forth_input: START_CODE.to_string(),
            program: IndexMap::new(),
            method: None,
            context,
            mem: wasm_memory_init(),
            game_tick: IntervalService::new(),
            game_handle: None,
            wasm: None,
        }
    }

    fn update(&mut self, msg: Self::Message) -> ShouldRender {
        match msg {
            Msg::OnGameboyFocus => {
                js! {
                    WasmBoy.WasmBoy.play();
                }
                true
            }
            Msg::OnGameboyBlur => {
                js! {
                    WasmBoy.WasmBoy.pause();
                }
                true
            }
            Msg::InputChange(key) => {
                let mem = &self.mem;
                stdweb::console!(log, format!("input changing to {:?}", key));
                js! {
                    @{mem}[0xC020] = @{key as u32};
                }
                // TODO this didn't work!
                true
            }
            Msg::CompileResult(program, execute) => {
                self.program = program;
                js! {
                    // Clear the canvas
                    const canvas = document.querySelector("canvas").getContext("2d");
                    canvas.clearRect(0, 0, canvas.width, canvas.height);
                }

                stdweb::console!(log, "compilation done.");

                // Possibly run execution now that we've returned
                match execute {
                    ExecutionTarget::Debug => {}
                    ExecutionTarget::Wasm => {
                        self.mem = wasm_memory_init();
                        let wasm = eval_forth(&self.program);

                        // Run first frame.
                        run_wasm_with_memory(&wasm, &self.mem);
                        stdweb::console!(log, "first frame done.");

                        self.wasm = Some(wasm);

                        js! {
                            setTimeout(() => document.querySelector("#WASM_CANVAS").focus(), 1000);
                        }
                    }
                    ExecutionTarget::Gameboy => {
                        // TODO need a better data type
                        let mut filetree: Vec<Vec<u8>> = GB_DIR
                            .find("*")
                            .expect("invalid glob")
                            .filter_map(|file| match file {
                                include_dir::DirEntry::File(f) => Some(f),
                                _ => None,
                            })
                            .map(|file| {
                                vec![
                                    file.path().to_string_lossy().as_bytes().to_owned(),
                                    file.contents().to_owned(),
                                ]
                            })
                            .flatten()
                            .collect();

                        // Inject a compiled version of the game
                        let pax_generated = cross_compile_forth_gb(self.program.clone());
                        filetree.push("generated/pax_generated.asm".as_bytes().to_owned());
                        filetree.push(pax_generated.as_bytes().to_owned());

                        stdweb::console!(log, format!("gameboy code: {}", pax_generated));

                        js! {
                            CompileGameboy(@{filetree})
                            .then(({ game }) => {
                              console.log("success", game);
                              return PlayGameboy(game);
                            }).catch(err => {
                              console.error("Error Configuring WasmBoy:", err);
                            });
                        }

                        js! {
                            setTimeout(() => document.querySelector("#GAMEBOY_CANVAS").focus(), 1000);
                        }
                    }
                }
                true
            }
            Msg::CompilationError(err) => {
                js! {
                    alert("compile failed! " + @{err});
                }
                true
            }
            Msg::NextTick(wasm) => {
                run_wasm_with_memory(&wasm, &self.mem);
                true
            }
            Msg::GameStop => {
                if let Some(handle) = self.game_handle.take() {
                    drop(handle);
                }
                false
            }

            Msg::CompileGameboy => {
                // Dispatch compile operation to Worker
                self.context.send(Request::Question(
                    self.forth_input.as_bytes().to_vec(),
                    ExecutionTarget::Gameboy,
                ));
                true
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
            Msg::Inline(method) => {
                let mut program = self.program.clone();
                inline_into_function(&mut program, &method);
                self.method = Some((method.clone(), program.get(&method).unwrap().clone()));

                true
            }
            Msg::InlineAndOptimize(method) => {
                let mut mock_program = self.program.clone();

                inline_into_function(&mut mock_program, &method);
                // TODO optimize_function(&mut mock_program, &method);

                self.method = Some((method.clone(), mock_program.get(&method).unwrap().clone()));

                true
            }
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
                    js! {
                        ResponsiveGamepad.ResponsiveGamepad.onInputsChange([
                            ResponsiveGamepad.ResponsiveGamepad.RESPONSIVE_GAMEPAD_INPUTS.DPAD_UP,
                            ResponsiveGamepad.ResponsiveGamepad.RESPONSIVE_GAMEPAD_INPUTS.DPAD_DOWN,
                            ResponsiveGamepad.ResponsiveGamepad.RESPONSIVE_GAMEPAD_INPUTS.DPAD_LEFT,
                            ResponsiveGamepad.ResponsiveGamepad.RESPONSIVE_GAMEPAD_INPUTS.DPAD_RIGHT,
                        ], state => {
                            const callback = @{input_closure};
                            console.log("gamepad state", state);
                            if (state.DPAD_UP) {
                                callback(38);
                            } else if (state.DPAD_DOWN) {
                                callback(40);
                            } else if (state.DPAD_LEFT) {
                                callback(37);
                            } else if (state.DPAD_RIGHT) {
                                callback(39);
                            }
                        });
                    }

                    js! {
                        ResponsiveGamepad.ResponsiveGamepad.enable()
                    }
                    self.game_handle = Some(self.game_tick.spawn(
                        std::time::Duration::from_millis(100),
                        self.link.callback(move |_| Msg::NextTick(wasm.clone())),
                    ));
                }
                true
            }
            Msg::OnBlur => {
                js! {
                    ResponsiveGamepad.ResponsiveGamepad.disable()
                }
                if let Some(handle) = self.game_handle.take() {
                    drop(handle);
                }
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
                                    .callback(move |e: ClickEvent| Msg::Reset(k2.clone()))
                            }>
                                {"Original"}
                            </button>
                            <button onclick={
                                self.link
                                    .callback(move |e: ClickEvent| Msg::Inline(k1.clone()))
                            }>
                                {"Inline"}
                            </button>
                            <button onclick={
                                self.link
                                    .callback(move |e: ClickEvent| Msg::InlineAndOptimize(k3.clone()))
                            }>
                                {"Inline And Optimize"}
                            </button>
                        </>
                    }],
                    vec![html! {
                        <h3>
                            {format!("{}:", k)}
                        </h3>
                    }],
                    v.iter()
                        .enumerate()
                        .map(|(i, b)| {
                            [
                                vec![html! { <h5 style="margin: 0">{format!("block #{}", i)}</h5> }],
                                b.commands()
                                    .into_iter()
                                    .map(|y| html! { <div>{format!("    {:?}", y.0)}</div> })
                                    .collect::<Vec<_>>(),
                            ]
                            .concat()
                        })
                        .flatten()
                        .collect::<Vec<_>>(),
                ]
                .concat()
            })
            .flatten()
            .collect::<Html>();

        let dump = html! {
            <pre>{blocks}</pre>
        };

        let methods = html! {
            <div>
              {self.program.iter().map(|(k, v)| {
                  let k2 = k.clone();
                  let onclick = self.link.callback(move |_| Msg::ShowMethod(k2.clone()));
                  html! { <pre style="cursor: pointer" onclick=onclick>{k}</pre> }
              }).collect::<Html>()}
            </div>
        };

        let mut method_inspect = html! {
            <div style="flex: 1; overflow: auto; background: #eef; padding: 10px; flex-basis: 0;">
                <h3>{ "Method" }</h3>
                { dump }
            </div>
        };
        method_inspect = html! { <></> }; // TODO this is a hack

        let oninput = self
            .link
            .callback(|e: InputData| Msg::ChangeInput(e.value.clone()));
        let onrun = self.link.callback(|_| Msg::RunInput);

        let action_group = html! {
            <div style="display: flex; flex-direction: row;">
                <button style="flex: 1" class="button-action" onclick=onrun>{ "Run in Browser" }</button>
            </div>
        };

        let onfocus = self.link.callback(|_| Msg::OnFocus);
        let onblur = self.link.callback(|_| Msg::OnBlur);

        let onclick = self.link.callback(|_| Msg::CompileGameboy);
        let ongameboyfocus = self.link.callback(|_| Msg::OnGameboyFocus);
        let ongameboyblur = self.link.callback(|_| Msg::OnGameboyBlur);
        let gameboy_action_group = html! {
            <div style="display: flex; flex-direction: row;">
                <button style="flex: 1" class="button-action" onclick=onclick>{ "Run on Gameboy" }</button>
            </div>
        };

        html! {
            <div style="display: flex; position: fixed; top: 0; left: 0; right: 0; bottom: 0; flex-direction: column">
                <div style="background: black; color: white; font-size: 24px; padding: 10px 0; text-align: center; font-family: Bungee Inline, Arial Black, sans-serif; text-transform: uppercase;">
                    {"Pax Consola"}
                </div>
                <div style="display: flex; flex: 1; align-items: stretch; overflow: auto;">
                    <div style="flex: 1; flex-direction: column; display: flex; padding: 16px; overflow: hidden">
                        <div style="flex: 1; flex-direction: column; display: flex; border: 2px solid black">
                            <div id="MONACO_INJECT" style="flex: 1"></div>
                            <textarea id="MONACO_TEXTAREA" rows="10" value=&self.forth_input oninput=oninput />
                        </div>
                    </div>
                    <div style="overflow: auto; background: #ddf; padding: 10px; max-height: 100%">
                        <h3>{ "Browser" }</h3>
                        { action_group }
                        <canvas onfocus=onfocus onblur=onblur id="WASM_CANVAS" width="300" height="200" style="border: 1px solid black" tabIndex="0" />
                        <div style=(if self.wasm.is_none() { "visibility: hidden" } else { "" })>{"Click to play."}</div>
                        <h3>{ "Gameboy" }</h3>
                        { gameboy_action_group }
                        <div style="border: 1px solid black; display: inline-block">
                            <canvas id="GAMEBOY_CANVAS" onfocus=ongameboyfocus onblur=ongameboyblur width="300" height="200" tabIndex="0" style="display: block;" />
                        </div>
                        <div>{"Click to play."}</div>
                        <h3>{ "Print Output" }</h3>
                        <textarea id="PRINT_OUTPUT" style="display: block; width: 100%; padding: 10px; border: 1px solid black;" rows="10" />
                        <h3>{ "Method List" }</h3>
                        { methods }
                    </div>
                    {method_inspect}
                </div>
            </div>
        }
    }
}
