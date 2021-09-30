use js_sys::{Uint8Array, Uint16Array};
use wasm_bindgen::prelude::*;

#[wasm_bindgen(inline_js = r##"

export function run_wasm_with_memory(binary, mem) {
    let canvas = document.querySelector("#WASM_CANVAS");
    WebAssembly.instantiate(binary, {
        root: {
            print: (arg) => {
                // console.log("[print]", arg);
                document.querySelector("#PRINT_OUTPUT").value += arg + "\n";
            },
            emit: (arg) => {
                // console.log("[print]", arg);
                document.querySelector("#PRINT_OUTPUT").value += String.fromCharCode(arg);
            },
            extmem_load: (loc) => {
                if (loc < 0) { // TODO shouldn't wasm do this conversion?
                    loc = 0xFFFF + loc + 1;
                }
                // console.info("extmem_load:", loc);
                return mem[loc] & 0xFFFF;
            },
            extmem_load_8: (loc) => {
                if (loc < 0) { // TODO shouldn't wasm do this conversion?
                    loc = 0xFFFF + loc + 1;
                }
                // console.info("extmem_load_8:", loc);
                return mem[loc] & 0xFF;
            },
            extmem_store: (loc, value) => {
                if (loc < 0) { // TODO shouldn't wasm do this conversion?
                    loc = 0xFFFF + loc + 1;
                }
                // console.info("extmem_store:", loc.toString(16), value);
                if (loc == 0x9800) {
                    requestAnimationFrame(() => {
                        const ctx = canvas.getContext("2d");
                        ctx.fillStyle = "#222222";
                        ctx.fillRect(0, 0, 500, 500);
                    });
                }
                mem[loc] = value & 0xFFFF;
            },
            extmem_store_8: (loc, value) => {
                if (loc < 0) { // TODO shouldn't wasm do this conversion?
                    loc = 0xFFFF + loc + 1;
                }
                // console.info("extmem_store_8:", loc.toString(16), value);

                // FIXME make these constants configurable or prominent
                const row_len = 32; // fixed on gameboy
                const wl = 20;
                const hl = 18;
                const w = canvas.width;
                const h = canvas.height;
                if (loc >= 0x9800 && loc < 0x9800 + (row_len*hl)) {
                    const x = (loc - 0x9800) % row_len;
                    const y = Math.floor((loc - 0x9800) / row_len);

                    const ctx = canvas.getContext("2d");
                    ctx.fillStyle = value == 0 ? "#dddddd" : value == 1 ? "#ee4400" : value == 2 ? "#2299cc" : "#222222";
                    // console.log(x, y);
                    ctx.fillRect(w/wl*x, h/hl*y, w/wl, h/hl);
                }
                mem[loc] = value & 0xFF;
            },
        },
    }).then(res => {
        // console.info("[wasm] starting...");
        document.querySelector("#PRINT_OUTPUT").value = "";
        res.instance.exports.main();
        // console.info("[wasm] complete.");
    });
}

"##)]
extern "C" {
    pub fn run_wasm_with_memory(binary: &Uint8Array, memory: &Uint16Array);
}

pub fn run_wasm(binary: &[u8], _export_buffer: bool) -> anyhow::Result<Vec<u8>> {
    let binary_array = Uint8Array::from(binary);
    run_wasm_with_memory(&binary_array, &wasm_memory_init());
    Ok(vec![])
}

pub fn wasm_memory_init() -> Uint16Array {
    let mem = Uint16Array::new_with_length(0xFFFF);
    mem.fill(0, 0, 0xFFFF);
    return mem;
}
