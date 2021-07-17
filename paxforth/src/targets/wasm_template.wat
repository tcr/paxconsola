(module
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

    (func $__wasm_call_ctors (type $t0))

    (func $mem_load (export "mem_load") (type $t2) (param $p0 i32) (result i32)
        get_local $p0
        call $extmem_load)

    (func $mem_load_8 (export "mem_load_8") (type $t2) (param $p0 i32) (result i32)
        get_local $p0
        call $extmem_load_8)

    (func $mem_store (export "mem_store") (type $t1) (param $p0 i32) (param $p1 i32)
        get_local $p0
        get_local $p1
        call $extmem_store)

    (func $mem_store_8 (export "mem_store_8") (type $t1) (param $p0 i32) (param $p1 i32)
        get_local $p0
        get_local $p1
        call $extmem_store_8)

    (func $data_push (export "data_push") (type $t3) (param $p0 i32)
        (local $l0 i32)
        i32.const 0
        i32.const 0
        i32.load offset={{data_ptr}}
        tee_local $l0
        i32.const 1
        i32.add
        i32.store offset={{data_ptr}}
        get_local $l0
        i32.const 1
        i32.shl
        i32.const {{data}}
        i32.add
        get_local $p0
        i32.store16)

    (func $data_pop (export "data_pop") (type $t4) (result i32)
        (local $l0 i32)
        i32.const 0
        i32.const 0
        i32.load offset={{data_ptr}}
        i32.const -1
        i32.add
        tee_local $l0
        i32.store offset={{data_ptr}}
        get_local $l0
        i32.const 1
        i32.shl
        i32.const {{data}}
        i32.add
        i32.load16_s)

    (func $return_push (export "return_push") (type $t3) (param $p0 i32)
        (local $l0 i32)
        i32.const 0
        i32.const 0
        i32.load offset={{return_ptr}}
        tee_local $l0
        i32.const 1
        i32.add
        i32.store offset={{return_ptr}}
        get_local $l0
        i32.const 1
        i32.shl
        i32.const {{return}}
        i32.add
        get_local $p0
        i32.store16)

    (func $return_pop (export "return_pop") (type $t0)
        (local $l0 i32)
        i32.const 0
        i32.const 0
        i32.load offset={{return_ptr}}
        i32.const -1
        i32.add
        tee_local $l0
        i32.store offset={{return_ptr}}
        get_local $l0
        i32.const 1
        i32.shl
        i32.const {{return}}
        i32.add
        i32.load16_s
        call $data_push)

    (func $temp_store (export "temp_store") (type $t3) (param $p0 i32)
        i32.const 0
        get_local $p0
        i32.store16 offset={{temp}})

    (func $temp_load (export "temp_load") (type $t4) (result i32)
        i32.const 0
        i32.load16_s offset={{temp}})

    (func $drop (export "drop") (type $t0)
        i32.const 0
        i32.const 0
        i32.load offset={{data_ptr}}
        i32.const -1
        i32.add
        i32.store offset={{data_ptr}})

    (func $add (export "add") (type $t0)
        call $data_pop
        call $data_pop
        i32.add
        i32.const 16
        i32.shl
        i32.const 16
        i32.shr_s
        call $data_push)

    (func $multiply (export "multiply") (type $t0)
        call $data_pop
        call $data_pop
        i32.mul
        i32.const 16
        i32.shl
        i32.const 16
        i32.shr_s
        call $data_push)

    (func $nand (export "nand") (type $t0)
        call $data_pop
        call $data_pop
        i32.and
        i32.const -1
        i32.xor
        call $data_push)

    {{functions}}

    (func $main (export "main") (type $t4) (result i32)
        call $fn_main
        i32.const 255)


    (memory $memory (export "memory") 2))
    