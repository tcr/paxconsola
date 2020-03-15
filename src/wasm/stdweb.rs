use ::stdweb;

pub fn run_wasm(binary: &[u8]) {
  run_wasm_with_memory(binary, &wasm_memory_init());
}

pub fn wasm_memory_init() -> stdweb::Value {
  use stdweb::*;

  return js! {
      const mem = new Uint16Array(0xFFFF);
      mem.fill(0);
      return mem;
  };
}

// Provide memory to operate with
pub fn run_wasm_with_memory(binary: &[u8], memory: &stdweb::Value) {
  use stdweb::*;

  js! {
      let binary = @{binary};
      let canvas = document.querySelector("#WASM_CANVAS");
      let mem = @{memory};
      WebAssembly.instantiate(new Uint8Array(binary), {
          root: {
              print: (arg) => {
                  // console.log("[print]", arg);
                  document.querySelector("#PRINT_OUTPUT").value += arg + "\n";
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
}
