use ggez;
use ggez::event::{self, KeyCode, KeyMods, MouseButton};
use ggez::graphics::{self, DrawParam};
use ggez::timer;
use ggez::{Context, GameResult};
use glam::*;
use paxforth::program::inline::*;
use paxforth::program::optimize::*;
use paxforth::runner::wasm::wasmtime::*;
use paxforth::targets::wasm::*;
use paxforth::*;
use std::time::SystemTime;

struct MainState {
    pos_x: f32,
    runner: WasmContext,
    time_count: Vec<u128>,
}

impl MainState {
    fn new() -> ggez::GameResult<MainState> {
        let src = std::fs::read_to_string("snake.fth").unwrap();

        // Parse program into Pax.
        let source_program = parse_to_pax(&src, Some("snake.fth"));

        // Main must be inlined before evaluating in WebAssembly.
        let mut program = source_program.clone();

        // if arg_inline {
        inline_into_function(&mut program, "main");
        // }
        // if arg_optimize {
        let main_opt = propagate_registers(&program, "main");
        program.remove("main");
        program.insert("main".to_string(), main_opt);
        // strip_branches(&mut source_program, "main");
        // }

        let wat = WasmForthCompiler::compile(&program);

        // Run as WASM.
        let wasm = wat::parse_str(&wat).unwrap();
        let runner = parse_wasm(wasm.as_slice(), true).unwrap();

        let s = MainState {
            pos_x: 0.0,
            runner,
            time_count: vec![],
        };

        Ok(s)
    }
}

impl event::EventHandler<ggez::GameError> for MainState {
    fn update(&mut self, ctx: &mut ggez::Context) -> ggez::GameResult {
        const DESIRED_FPS: u32 = 10;

        while timer::check_update_time(ctx, DESIRED_FPS) {
            self.pos_x = self.pos_x % 800.0 + 1.0;

            // Run next loop.
            let start = SystemTime::now();
            self.runner.run().unwrap();
            let end = SystemTime::now();
            self.time_count
                .push(end.duration_since(start).unwrap().as_nanos());
            if self.time_count.len() > 100 {
                let len = self.time_count.len();
                eprintln!(
                    "average loop time: {:.3}ms",
                    (((self.time_count.drain(0..).sum::<u128>() as usize) / len) as f64)
                        / 1_000_000.
                );
            }
        }

        let buffer = self.runner.flush_buffer().unwrap();
        // eprint!("{}", String::from_utf8_lossy(&buffer));

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
            self.runner.set_mem(0xC020, 40).ok();
        }
        if keycode == KeyCode::Left {
            self.runner.set_mem(0xC020, 37).ok();
        }
        if keycode == KeyCode::Up {
            self.runner.set_mem(0xC020, 38).ok();
        }
        if keycode == KeyCode::Right {
            self.runner.set_mem(0xC020, 39).ok();
        }
    }

    fn draw(&mut self, ctx: &mut ggez::Context) -> ggez::GameResult {
        graphics::clear(ctx, [0.1, 0.2, 0.3, 1.0].into());

        let SWIDTH: f32 = graphics::drawable_size(ctx).0 as f32;
        let SHEIGHT: f32 = graphics::drawable_size(ctx).1 as f32;

        const WIDTH: usize = 20;
        const HEIGHT: usize = 18;

        const ROW_SKIP: usize = 32;

        let mem = self.runner.get_mem_ref();

        let wunit = SWIDTH / WIDTH as f32;
        let hunit = SHEIGHT / HEIGHT as f32;

        let mesh = graphics::MeshBuilder::new()
            .rectangle(
                graphics::DrawMode::fill(),
                graphics::Rect::new(0., 0., wunit, hunit),
                graphics::Color::new(1., 1., 1., 1.),
            )?
            .build(ctx)?;
        let mut mesh_batch = graphics::MeshBatch::new(mesh)?;

        for i in 0..WIDTH {
            for j in 0..HEIGHT {
                let status = mem[0x9800 + i + (j * ROW_SKIP)];

                // Create and draw a filled rectangle mesh.
                let circle = graphics::DrawParam::new()
                    .dest(Vec2::new(wunit * i as f32, hunit * j as f32))
                    .color(match status {
                        // Black
                        1 => graphics::Color::BLACK,
                        // Red
                        2 => graphics::Color::new(1., 0., 0., 1.),
                        // Green
                        3 => graphics::Color::new(0., 1., 0., 1.),
                        // Blue
                        4 => graphics::Color::new(0., 0., 0.5, 1.),
                        // White
                        _ => graphics::Color::WHITE,
                    });
                mesh_batch.add(circle);
            }
        }

        mesh_batch.flush_range(ctx, graphics::MeshIdx(0), WIDTH * HEIGHT)?;
        mesh_batch.draw(ctx, DrawParam::default())?;

        graphics::present(ctx)?;
        Ok(())
    }
}

pub fn main() -> ggez::GameResult {
    let cb = ggez::ContextBuilder::new("paxconsola_desktop", "trim");
    let (ctx, event_loop) = cb.build()?;
    let state = MainState::new()?;
    event::run(ctx, event_loop, state)
}
