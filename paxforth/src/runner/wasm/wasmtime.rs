use std::io::Write;
use std::rc::Rc;
use std::sync::{Mutex, MutexGuard};
use wasmtime::*;

pub struct WasmContext {
    instance: Instance,
    buffer: Rc<Mutex<Vec<u8>>>,
    memory: Rc<Mutex<Vec<u16>>>,
}

impl WasmContext {
    pub fn run(&mut self) -> anyhow::Result<()> {
        // Next we poke around a bit to extract the `run` function from the module.
        let run = self
            .instance
            .get_export("main")
            .and_then(|e| e.func())
            .ok_or(anyhow::format_err!("failed to find `run` function export"))?
            .get0::<i32>()?;

        run()?;

        Ok(())
    }

    pub fn flush_buffer(&mut self) -> anyhow::Result<Vec<u8>> {
        let buffer_ref = self.buffer.lock().unwrap();
        Ok(buffer_ref.iter().cloned().collect::<Vec<u8>>())
    }

    /**
     * Memory modification functions.
     */

    pub fn get_mem(&self, index: u32) -> anyhow::Result<u16> {
        let memory_ref = self.memory.lock().unwrap();
        Ok(memory_ref.get(index as usize).map(|x| *x).unwrap_or(0))
    }

    pub fn set_mem(&self, index: u32, value: u16) -> anyhow::Result<()> {
        let mut memory_ref = self.memory.lock().unwrap();
        memory_ref.insert(index as usize, value);
        Ok(())
    }

    pub fn get_mem_ref(&self) -> MutexGuard<Vec<u16>> {
        self.memory.lock().unwrap()
    }
}

pub fn parse_wasm(binary: &[u8], export_buffer: bool) -> anyhow::Result<WasmContext> {
    let store = Store::default();
    let module = Module::from_binary(&store, binary)?;

    // Imports.
    let buffer: Rc<Mutex<Vec<u8>>> = Rc::new(Mutex::new(Vec::new()));
    let memory: Rc<Mutex<Vec<u16>>> = Rc::new(Mutex::new(
        std::iter::repeat(0).take(65536).collect::<Vec<_>>(),
    ));
    let print_func = Func::wrap(&store, {
        let buffer = buffer.clone();
        move |value: i32| -> i32 {
            if export_buffer {
                writeln!(&mut *buffer.lock().unwrap(), "{}", value).ok();
            } else {
                println!("{}", value);
            }
            value
        }
    });
    let emit_func = Func::wrap(&store, {
        let buffer = buffer.clone();
        move |value: i32| {
            if export_buffer {
                write!(&mut *buffer.lock().unwrap(), "{}", value as u8 as char).ok();
            } else {
                print!("{}", value as u8 as char);
            }
        }
    });
    let extmem_load_func = Func::wrap(&store, {
        let memory = memory.clone();
        move |address: i32| -> i32 {
            let address = (address as u32) & 0xFFFF;
            *memory.lock().unwrap().get(address as usize).unwrap_or(&0) as _
        }
    });
    let extmem_load_8_func = Func::wrap(&store, {
        let memory = memory.clone();
        move |address: i32| -> i32 {
            let address = (address as u32) & 0xFFFF;
            *memory.lock().unwrap().get(address as usize).unwrap_or(&0) as u8 as _
        }
    });
    let extmem_store_func = Func::wrap(&store, {
        let memory = memory.clone();
        move |address: i32, value: i32| -> () {
            let address = (address as u32) & 0xFFFF;
            let value = (value as u32) & 0xFFFF;
            memory.lock().unwrap()[address as usize] = value as u16;
        }
    });
    let extmem_store_8_func = Func::wrap(&store, {
        let memory = memory.clone();
        move |address: i32, value: i32| -> () {
            let address = (address as u32) & 0xFFFF;
            let value = (value as u32) & 0xFFFF;
            memory.lock().unwrap()[address as usize] = value as u8 as u16;
        }
    });

    /*
    (type $t0 (func))
    (type $t1 (func (param i32 i32)))
    (type $t2 (func (param i32) (result i32)))
    (type $t3 (func (param i32)))
    (type $t4 (func (result i32)))

    (import "root" "print" (func $print (type $t2)))
    (import "root" "emit" (func $emit (type $t3)))
    (import "root" "extmem_load" (func $extmem_load (param i32) (result i32)))
    (import "root" "extmem_load_8" (func $extmem_load_8 (param i32) (result i32)))
    (import "root" "extmem_store" (func $extmem_store (param i32) (param i32)))
    (import "root" "extmem_store_8" (func $extmem_store_8 (param i32) (param i32)))
    */
    let imports = [
        print_func.into(),
        emit_func.into(),
        extmem_load_func.into(),
        extmem_load_8_func.into(),
        extmem_store_func.into(),
        extmem_store_8_func.into(),
    ];

    // Once we've got that all set up we can then move to the instantiation
    // phase, pairing together a compiled module as well as a set of imports.
    // Note that this is where the wasm `start` function, if any, would run.
    let instance = Instance::new(&module, &imports)?;

    Ok(WasmContext {
        instance,
        buffer,
        memory,
    })
}

pub fn run_wasm(binary: &[u8], export_buffer: bool) -> anyhow::Result<Vec<u8>> {
    let mut runner = parse_wasm(binary, export_buffer)?;
    runner.run()?;
    Ok(runner.flush_buffer()?)
}
