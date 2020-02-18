#![recursion_limit = "4096"]

use indexmap::IndexMap;
use paxconsola::*;
use yew::{html, ClickEvent, Component, ComponentLink, Html, InputData, ShouldRender};

use serde::*;
use yew::worker::*;

struct Worker {
    link: AgentLink<Worker>,
}

#[derive(Serialize, Deserialize, Debug)]
pub enum Request {
    Question(String),
}

#[derive(Serialize, Deserialize, Debug)]
pub enum Response {
    Answer(String),
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
            Request::Question(_) => {
                self.link
                    .respond(who, Response::Answer("That's cool!".into()));
            }
        }
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
    CompileResult,
}

impl Component for App {
    type Message = Msg;
    type Properties = ();

    fn create(_: Self::Properties, link: ComponentLink<Self>) -> Self {
        let callback = link.callback(|_| Msg::CompileResult);
        // `Worker::bridge` spawns an instance if no one is available
        let context = Worker::bridge(callback); // Connected! :tada:

        App {
            link,
            forth_input: "5 5 1 + * print".to_string(),
            program: IndexMap::new(),
            method: None,
            context,
        }
    }

    fn update(&mut self, msg: Self::Message) -> ShouldRender {
        match msg {
            Msg::CompileResult => true, // TODO process compile results
            Msg::Click => {
                self.program = {
                    let code = inject_prelude(self.forth_input.as_bytes());
                    let compiled = parse_forth(code);
                    let program = convert_to_superpax(compiled);
                    program
                };

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
            Msg::RunInput => {
                self.program = {
                    let code = inject_prelude(self.forth_input.as_bytes());
                    let compiled = parse_forth(code);
                    let program = convert_to_superpax(compiled);
                    program
                };

                let mut mock_program = self.program.clone();
                inline_into_function(&mut mock_program, "main");
                eval_forth(&mock_program, false);

                // js! {
                //     const canvas = document.querySelector("canvas");
                //     canvas.width = 100;
                //     canvas.height = 100;
                //     const ctx = canvas.getContext("2d");
                //     ctx.fillStyle = "green";
                //     ctx.fillRect(10, 10, 50, 50);
                // };

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
                <div style="display: flex; flex: 1">
                    <div style="flex: 1; overflow: auto; padding: 10px;">
                        <textarea style="display: block;" rows="10" value=&self.forth_input oninput=oninput />
                        <button onclick=onclick>{ "Compile" }</button>
                        <button onclick=onrun>{ "Run" }</button>
                    </div>
                    <div style="flex: 1; overflow: auto; background: #ddf; padding: 10px;">
                        <h3>{ "Print Output" }</h3>
                        <textarea id="PRINT_OUTPUT" rows="10" />
                        <h3>{ "Canvas" }</h3>
                        <canvas width="200" height="100" style="border: 1px solid black" />
                        <h3>{ "Method List" }</h3>
                        { methods }
                    </div>
                    <div style="flex: 1; overflow: auto; background: #eef; padding: 10px;">
                        <h3>{ "Method" }</h3>
                        { dump }
                    </div>
                </div>
            </div>
        }
    }
}

fn main() {
    yew::start_app::<App>();
}
