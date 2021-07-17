use ggez;
use ggez::event::{self, Axis, Button, GamepadId, KeyCode, KeyMods, MouseButton};
use ggez::graphics::{self, DrawMode, DrawParam};
use ggez::input;
use ggez::nalgebra as na;
use ggez::timer;
use ggez::{Context, GameResult};
use paxforth::runner::wasm::wasmtime::*;
use paxforth::targets::wasm::*;
use paxforth::*;

struct MainState {
    pos_x: f32,
    runner: WasmContext,
}

impl MainState {
    fn new() -> ggez::GameResult<MainState> {
        let src = std::fs::read_to_string("snake.pax").unwrap();

        // Parse program into Pax.
        let source_program = parse_to_pax(&src, Some("snake.pax"));

        // Main must be inlined before evaluating in WebAssembly.
        let mut program = source_program.clone();
        inline_into_function(&mut program, "main");
        // optimize_function(&mut program, "main");
        let wat = WasmForthCompiler::compile(&program);

        // Run as WASM.
        let wasm = wat::parse_str(&wat).unwrap();
        let runner = parse_wasm(wasm.as_slice(), true).unwrap();

        let s = MainState { pos_x: 0.0, runner };

        Ok(s)
    }
}

impl event::EventHandler for MainState {
    fn update(&mut self, ctx: &mut ggez::Context) -> ggez::GameResult {
        const DESIRED_FPS: u32 = 10;

        while timer::check_update_time(ctx, DESIRED_FPS) {
            self.pos_x = self.pos_x % 800.0 + 1.0;

            self.runner.run().unwrap();
            let buffer = self.runner.flush_buffer().unwrap();
            eprint!("{}", String::from_utf8_lossy(&buffer));
        }

        Ok(())
    }

    fn key_down_event(
        &mut self,
        _ctx: &mut Context,
        keycode: KeyCode,
        keymod: KeyMods,
        repeat: bool,
    ) {
        if keycode == KeyCode::Down {
            self.runner.set_mem(0xC020, 40);
        }
        if keycode == KeyCode::Left {
            self.runner.set_mem(0xC020, 37);
        }
        if keycode == KeyCode::Up {
            self.runner.set_mem(0xC020, 38);
        }
        if keycode == KeyCode::Right {
            self.runner.set_mem(0xC020, 39);
        }
    }

    fn draw(&mut self, ctx: &mut ggez::Context) -> ggez::GameResult {
        graphics::clear(ctx, [0.1, 0.2, 0.3, 1.0].into());

        const SWIDTH: f32 = 800.0;
        const SHEIGHT: f32 = 600.0;

        const WIDTH: usize = 20;
        const HEIGHT: usize = 18;

        const ROW_SKIP: usize = 32;

        for i in 0..WIDTH {
            for j in 0..HEIGHT {
                let wunit = SWIDTH / WIDTH as f32;
                let hunit = SHEIGHT / HEIGHT as f32;

                let status = self
                    .runner
                    .get_mem((0x9800 + i + (j * ROW_SKIP)) as u32)
                    .unwrap();

                // Create and draw a filled rectangle mesh.
                let circle = graphics::Mesh::new_rectangle(
                    ctx,
                    graphics::DrawMode::fill(),
                    graphics::Rect::new(wunit * i as f32, hunit * j as f32, wunit, hunit),
                    if status > 0 {
                        graphics::BLACK
                    } else {
                        graphics::WHITE
                    },
                )?;
                graphics::draw(ctx, &circle, DrawParam::default())?;
            }
        }

        graphics::present(ctx)?;
        Ok(())
    }
}

pub fn main() -> ggez::GameResult {
    let cb = ggez::ContextBuilder::new("paxconsola_desktop", "trim");
    let (ctx, event_loop) = &mut cb.build()?;
    let state = &mut MainState::new()?;
    event::run(ctx, event_loop, state)
}
