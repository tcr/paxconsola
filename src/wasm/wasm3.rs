use ::wasm3;
use lazy_static::lazy_static;
use std::collections::HashMap;
use std::sync::Mutex;

lazy_static! {
  static ref WASM3_MEM: Mutex<HashMap<u32, u16>> = Mutex::new(HashMap::new());
}

wasm3::make_func_wrapper!(wasm_print_wrap: wasm_print(value: u32) -> u64);
fn wasm_print(value: u32) -> u64 {
  println!("{}", value);
  value as _
}

wasm3::make_func_wrapper!(wasm_extmem_load_wrap: wasm_extmem_load(address: u32) -> u64);
fn wasm_extmem_load(mut address: u32) -> u64 {
  address = address & 0xFFFF;
  (*WASM3_MEM.lock().unwrap().get(&address).unwrap_or(&0)) as _
}

wasm3::make_func_wrapper!(wasm_extmem_load_8_wrap: wasm_extmem_load_8(address: u32) -> u64);
fn wasm_extmem_load_8(mut address: u32) -> u64 {
  address = address & 0xFFFF;
  ((*WASM3_MEM.lock().unwrap().get(&address).unwrap_or(&0)) as u8) as _
}

wasm3::make_func_wrapper!(wasm_extmem_store_wrap: wasm_extmem_store(address: u32, value: u32));
fn wasm_extmem_store(mut address: u32, mut value: u32) {
  address = address & 0xFFFF;
  value = value & 0xFFFF;
  WASM3_MEM.lock().unwrap().insert(address, value as u16);
}

wasm3::make_func_wrapper!(wasm_extmem_store_8_wrap: wasm_extmem_store_8(address: u32, value: u32));
fn wasm_extmem_store_8(mut address: u32, mut value: u32) {
  address = address & 0xFFFF;
  value = value & 0xFFFF;
  WASM3_MEM
    .lock()
    .unwrap()
    .insert(address, value as u8 as u16);
}

/// Evaluate WebAssembly binary using the wasm3 library.
pub fn run_wasm(binary: &[u8]) {
  use wasm3::environment::Environment;
  use wasm3::module::Module;

  let env = Environment::new().unwrap();
  let rt = env.create_runtime(1024 * 60).unwrap();
  let parsed_module = Module::parse(&env, &binary[..]).expect("module couldnt parse");

  let mut module = rt.load_module(parsed_module).unwrap();
  eprintln!("execution:");
  module
    .link_function::<(i32,), i32>("root", "print", wasm_print_wrap)
    .unwrap();
  module
    .link_function::<(i32,), i32>("root", "extmem_load", wasm_extmem_load_wrap)
    .unwrap();
  module
    .link_function::<(i32,), i32>("root", "extmem_load_8", wasm_extmem_load_8_wrap)
    .unwrap();
  module
    .link_function::<(i32, i32), ()>("root", "extmem_store", wasm_extmem_store_wrap)
    .unwrap();
  module
    .link_function::<(i32, i32), ()>("root", "extmem_store_8", wasm_extmem_store_8_wrap)
    .unwrap();
  let func = module
    .find_function::<(), i32>("main")
    .unwrap_or_else(|err| {
      match &err {
        wasm3::error::Error::Wasm3(err) => {
          eprintln!("wasm compilation error: {}", err);
        }
        _ => {}
      }
      panic!("{:?}", err);
    });
  func.call().unwrap();
}
