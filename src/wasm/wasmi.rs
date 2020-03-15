use crate::*;
use lazy_static::lazy_static;
use petgraph::{graph::NodeIndex, Direction};
use std::collections::HashMap;
use std::io::prelude::*;
use std::sync::Mutex;
use wasmi::{
  Error as InterpreterError, Externals, FuncInstance, FuncRef, GlobalDescriptor, GlobalInstance,
  GlobalRef, ImportResolver, ImportsBuilder, MemoryDescriptor, MemoryInstance, MemoryRef, Module,
  ModuleImportResolver, ModuleInstance, ModuleRef, RuntimeArgs, RuntimeValue, Signature,
  TableDescriptor, TableInstance, TableRef, Trap,
};

pub struct SpecModule {}

impl SpecModule {
  pub fn new() -> Self {
    SpecModule {}
  }
}

const PRINT_FUNC_INDEX: usize = 0;

impl Externals for SpecModule {
  fn invoke_index(
    &mut self,
    index: usize,
    args: RuntimeArgs,
  ) -> Result<Option<RuntimeValue>, Trap> {
    match index {
      PRINT_FUNC_INDEX => {
        let a: u32 = args.nth_checked(0)?;
        println!("{:?}", a);
        Ok(Some(RuntimeValue::I32(a as i32)))
      }
      _ => panic!("SpecModule doesn't provide function at index {}", index),
    }
  }
}

impl ModuleImportResolver for SpecModule {
  fn resolve_func(
    &self,
    field_name: &str,
    func_type: &Signature,
  ) -> Result<FuncRef, InterpreterError> {
    let index = match field_name {
      "print" => PRINT_FUNC_INDEX,
      _ => {
        return Err(InterpreterError::Instantiation(format!(
          "Unknown host func import {}",
          field_name
        )));
      }
    };

    let func = FuncInstance::alloc_host(func_type.clone(), index);
    return Ok(func);
  }
}

pub struct SpecDriver {
  spec_module: SpecModule,
}

impl SpecDriver {
  pub fn new() -> SpecDriver {
    SpecDriver {
      spec_module: SpecModule::new(),
    }
  }

  pub fn spec_module(&mut self) -> &mut SpecModule {
    &mut self.spec_module
  }
}

impl ImportResolver for SpecDriver {
  fn resolve_func(
    &self,
    module_name: &str,
    field_name: &str,
    func_type: &Signature,
  ) -> Result<FuncRef, InterpreterError> {
    if module_name == "root" {
      self.spec_module.resolve_func(field_name, func_type)
    } else {
      Err(InterpreterError::Instantiation(format!(
        "Module not registered {}",
        module_name
      )))
    }
  }

  fn resolve_global(
    &self,
    _module_name: &str,
    _field_name: &str,
    _descriptor: &GlobalDescriptor,
  ) -> Result<GlobalRef, InterpreterError> {
    unimplemented!();
  }

  fn resolve_memory(
    &self,
    _module_name: &str,
    _field_name: &str,
    _descriptor: &MemoryDescriptor,
  ) -> Result<MemoryRef, InterpreterError> {
    unimplemented!();
  }

  fn resolve_table(
    &self,
    _module_name: &str,
    _field_name: &str,
    _descriptor: &TableDescriptor,
  ) -> Result<TableRef, InterpreterError> {
    unimplemented!();
  }
}

/// Evaluate WebAssembly binary using the wasmi library.
pub fn run_wasm(binary: &[u8]) {
  use self::wasmi_support::*;
  use wasmi::{ImportsBuilder, Module, ModuleInstance, NopExternals, RuntimeValue};

  // Here we load module using dedicated for this purpose
  // `load_from_file` function (which works only with modules)
  let module = Module::from_buffer(binary).expect("WebAssembly binary had validation errors");

  let mut imports = SpecDriver::new();

  // Intialize deserialized module. It adds module into It expects 3 parameters:
  // - a name for the module
  // - a module declaration
  // - "main" module doesn't import native module(s) this is why we don't need to provide external native modules here
  // This test shows how to implement native module https://github.com/NikVolf/parity-wasm/blob/master/src/interpreter/tests/basics.rs#L197
  let main = ModuleInstance::new(&module, &imports)
    .expect("Failed to instantiate module")
    .run_start(imports.spec_module())
    .expect("Failed to run start function in module");

  // TODO module root not found

  // "_call" export of function to be executed with an i32 argument and prints the result of execution
  main.invoke_export("main", &[], imports.spec_module());
}
