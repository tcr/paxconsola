use std::collections::HashMap;
use std::rc::Rc;
use std::sync::Mutex;
use wasmtime::*;

fn run_wasm_result(binary: &[u8]) -> anyhow::Result<()> {
  let store = Store::default();
  let module = Module::from_binary(&store, binary)?;

  // Imports.
  let memory: Rc<Mutex<HashMap<u32, u16>>> = Rc::new(Mutex::new(HashMap::new()));
  let print_func = Func::wrap(&store, |value: i32| -> i32 {
    println!("{}", value);
    value
  });
  let extmem_load_func = Func::wrap(&store, {
    let memory = memory.clone();
    move |address: i32| -> i32 {
      let address = (address as u32) & 0xFFFF;
      *memory.lock().unwrap().get(&address).unwrap_or(&0) as _
    }
  });
  let extmem_load_8_func = Func::wrap(&store, {
    let memory = memory.clone();
    move |address: i32| -> i32 {
      let address = (address as u32) & 0xFFFF;
      *memory.lock().unwrap().get(&address).unwrap_or(&0) as u8 as _
    }
  });
  let extmem_store_func = Func::wrap(&store, {
    let memory = memory.clone();
    move |address: i32, value: i32| -> () {
      let address = (address as u32) & 0xFFFF;
      let value = (value as u32) & 0xFFFF;
      memory.lock().unwrap().insert(address, value as u16);
    }
  });
  let extmem_store_8_func = Func::wrap(&store, {
    let memory = memory.clone();
    move |address: i32, value: i32| -> () {
      let address = (address as u32) & 0xFFFF;
      let value = (value as u32) & 0xFFFF;
      memory.lock().unwrap().insert(address, value as u8 as u16);
    }
  });

  /*
  (type $t0 (func))
  (type $t1 (func (param i32 i32)))
  (type $t2 (func (param i32) (result i32)))
  (type $t3 (func (param i32)))
  (type $t4 (func (result i32)))

  (import "root" "print" (func $print (type $t2)))
  (import "root" "extmem_load" (func $extmem_load (param i32) (result i32)))
  (import "root" "extmem_load_8" (func $extmem_load_8 (param i32) (result i32)))
  (import "root" "extmem_store" (func $extmem_store (param i32) (param i32)))
  (import "root" "extmem_store_8" (func $extmem_store_8 (param i32) (param i32)))
  */
  let imports = [
    print_func.into(),
    extmem_load_func.into(),
    extmem_load_8_func.into(),
    extmem_store_func.into(),
    extmem_store_8_func.into(),
  ];

  // Once we've got that all set up we can then move to the instantiation
  // phase, pairing together a compiled module as well as a set of imports.
  // Note that this is where the wasm `start` function, if any, would run.
  let instance = Instance::new(&module, &imports)?;

  // Next we poke around a bit to extract the `run` function from the module.
  let run = instance
    .get_export("main")
    .and_then(|e| e.func())
    .ok_or(anyhow::format_err!("failed to find `run` function export"))?
    .get0::<i32>()?;

  run()?;
  Ok(())
}

pub fn run_wasm(binary: &[u8]) {
  run_wasm_result(binary).unwrap();
}
