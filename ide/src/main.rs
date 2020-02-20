#![recursion_limit = "4096"]

use indexmap::IndexMap;
use paxconsola::*;
use yew::{html, ClickEvent, Component, ComponentLink, Html, InputData, ShouldRender};

use serde::*;
use yew::worker::*;

const START_CODE: &str = r"$C020 constant last-key
$C022 constant random-register
$9800 constant graphics

variable initialized
variable frame

: random random-register @ 255 and swap % ;

variable snake-x-head
500 cells allot

variable snake-y-head
500 cells allot

variable apple-x
variable apple-y

37 constant left
38 constant up
39 constant right
40 constant down

20 constant width
18 constant height

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

\ Initialize only once
initialized @ 0= if initialize then
1 initialized !






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






\ game loop

\ frameskip
frame @ 1+ dup frame !
2 = if 0 frame !

draw-snake
draw-apple
check-input
move-snake-tail
move-snake-head
check-apple
check-collision
if else 0 initialized ! then

\ end frameskip
then
















(

: move-right 23 graphics 67 + c! ;
: move-left 21 graphics 65 + c! ;
: move-up 22 graphics 34 + c! ;
: move-down 24 graphics 98 + c! ;

last-key @
  left over = if move-left else
  up over    = if move-up else
  right over  = if move-right else
  down over = if move-down
  then then then then

)
";

struct Worker {
    link: AgentLink<Worker>,
}

#[derive(Serialize, Deserialize, Debug)]
pub enum Request {
    Question(Vec<u8>, bool),
}

#[derive(Serialize, Deserialize, Debug)]
pub enum Response {
    Answer(SuperPaxProgram, bool),
}

impl Agent for Worker {
    // Available:
    // - `Job` (one per bridge on the main thread)
    // - `Context` (shared in the main thread)
    // - `Private` (one per bridge in a separate thread)
    // - `Public` (shared in a separate thread)
    type Reach = Context; // Spawn only one instance on the main thread (all components can share this agent)
    type Message = Msg;
    type Input = Request;
    type Output = Response;

    // Create an instance with a link to the agent.
    fn create(link: AgentLink<Self>) -> Self {
        Worker { link }
    }

    // Handle inner messages (from callbacks)
    fn update(&mut self, msg: Self::Message) { /* ... */
    }

    // Handle incoming messages from components of other agents.
    fn handle_input(&mut self, msg: Self::Input, who: HandlerId) {
        match msg {
            Request::Question(input, execute) => {
                let program = {
                    let code = inject_prelude(&input);
                    let compiled = parse_forth(code);
                    let program = convert_to_superpax(compiled);
                    program
                };
                self.link.respond(who, Response::Answer(program, execute));
            }
        }
    }

    fn name_of_resource() -> &'static str {
        "bin/native_worker.js"
    }
}

struct App {
    forth_input: String,
    program: SuperPaxProgram,
    link: ComponentLink<Self>,
    method: Option<(String, Vec<Block>)>,
    context: Box<Bridge<Worker>>,
}

enum Msg {
    Click,
    ChangeInput(String),
    Reset(String),
    Inline(String),
    InlineAndOptimize(String),
    ShowMethod(String),
    RunInput,
    CompileResult(SuperPaxProgram, bool),
}

impl Component for App {
    type Message = Msg;
    type Properties = ();

    fn create(_: Self::Properties, link: ComponentLink<Self>) -> Self {
        let callback = link.callback(|res| {
            if let Response::Answer(program, execute) = res {
                Msg::CompileResult(program, execute)
            } else {
                unreachable!();
            }
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
        }
    }

    fn update(&mut self, msg: Self::Message) -> ShouldRender {
        match msg {
            Msg::CompileResult(program, execute) => {
                self.program = program;
                if execute {
                    let mut mock_program = self.program.clone();
                    inline_into_function(&mut mock_program, "main");
                    eval_forth(&mock_program, false);
                }
                true
            }
            Msg::Click => {
                self.context.send(Request::Question(
                    self.forth_input.as_bytes().to_vec(),
                    false,
                ));
                true
            }
            Msg::RunInput => {
                self.context.send(Request::Question(
                    self.forth_input.as_bytes().to_vec(),
                    true,
                ));
                true
            }

            Msg::ChangeInput(code) => {
                self.forth_input = code.clone();

                true
            }
            Msg::Reset(method) => {
                let mut mock_program = self.program.clone();
                self.method = Some((method.clone(), mock_program.get(&method).unwrap().clone()));

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
                optimize_function(&mut mock_program, &method);

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
        method_inspect = html! { <></> }; // FIXME this is a hack

        let oninput = self
            .link
            .callback(|e: InputData| Msg::ChangeInput(e.value.clone()));
        let onclick = self.link.callback(|_| Msg::Click);
        let onrun = self.link.callback(|_| Msg::RunInput);

        html! {
            <div style="display: flex; position: fixed; top: 0; left: 0; right: 0; bottom: 0; flex-direction: column">
                <link href="https://fonts.googleapis.com/css?family=Bungee+Inline&display=swap" rel="stylesheet" />
                <div style="background: black; color: white; font-size: 24px; padding: 10px 0; text-align: center; font-family: Bungee Inline, Arial Black, sans-serif; text-transform: uppercase;">
                    {"Pax Consola"}
                </div>
                <div style="display: flex; flex: 1; align-items: stretch; overflow: auto;">
                    <div style="flex: 1; overflow: auto; padding: 10px; flex-direction: column; display: flex; flex-basis: 0;">
                        <div id="MONACO_INJECT" style="flex: 1"></div>
                        <textarea id="MONACO_TEXTAREA" rows="10" value=&self.forth_input oninput=oninput />
                        <div>
                            <button class="button-action" onclick=onclick>{ "Compile" }</button>
                            <button class="button-action" onclick=onrun>{ "Run" }</button>
                        </div>
                    </div>
                    <div style="overflow: auto; background: #ddf; padding: 10px; max-height: 100%">
                        <h3>{ "Print Output" }</h3>
                        <textarea id="PRINT_OUTPUT" style="display: block; width: 100%; padding: 10px; border: 1px solid black;" rows="10" />
                        <h3>{ "Canvas" }</h3>
                        <canvas id="WASM_CANVAS" width="200" height="100" style="border: 1px solid black" />
                        <h3>{ "Method List" }</h3>
                        { methods }
                    </div>
                    {method_inspect}
                </div>
            </div>
        }
    }
}

fn main() {
    yew::start_app::<App>();
}
