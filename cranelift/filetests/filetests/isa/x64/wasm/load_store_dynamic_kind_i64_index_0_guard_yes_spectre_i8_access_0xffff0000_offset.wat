;;! target = "x86_64"
;;!
;;! settings = ['enable_heap_access_spectre_mitigation=true']
;;!
;;! compile = true
;;!
;;! [globals.vmctx]
;;! type = "i64"
;;! vmctx = true
;;!
;;! [globals.heap_base]
;;! type = "i64"
;;! load = { base = "vmctx", offset = 0, readonly = true }
;;!
;;! [globals.heap_bound]
;;! type = "i64"
;;! load = { base = "vmctx", offset = 8, readonly = true }
;;!
;;! [[heaps]]
;;! base = "heap_base"
;;! min_size = 0x10000
;;! offset_guard_size = 0
;;! index_type = "i64"
;;! style = { kind = "dynamic", bound = "heap_bound" }

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i64 1)

  (func (export "do_store") (param i64 i32)
    local.get 0
    local.get 1
    i32.store8 offset=0xffff0000)

  (func (export "do_load") (param i64) (result i32)
    local.get 0
    i32.load8_u offset=0xffff0000))

;; function u0:0:
;;   pushq   %rbp
;;   unwind PushFrameRegs { offset_upward_to_caller_sp: 16 }
;;   movq    %rsp, %rbp
;;   unwind DefineNewFrame { offset_upward_to_caller_sp: 16, offset_downward_to_clobbers: 0 }
;; block0:
;;   movq    %rdi, %rax
;;   addq    %rax, const(0), %rax
;;   jb #trap=heap_oob
;;   movq    8(%rdx), %rcx
;;   addq    %rdi, 0(%rdx), %rdi
;;   movl    $-65536, %edx
;;   lea     0(%rdi,%rdx,1), %rdi
;;   xorq    %rdx, %rdx, %rdx
;;   cmpq    %rcx, %rax
;;   cmovnbeq %rdx, %rdi, %rdi
;;   movb    %sil, 0(%rdi)
;;   jmp     label1
;; block1:
;;   movq    %rbp, %rsp
;;   popq    %rbp
;;   ret
;;
;; function u0:1:
;;   pushq   %rbp
;;   unwind PushFrameRegs { offset_upward_to_caller_sp: 16 }
;;   movq    %rsp, %rbp
;;   unwind DefineNewFrame { offset_upward_to_caller_sp: 16, offset_downward_to_clobbers: 0 }
;; block0:
;;   movq    %rdi, %rax
;;   addq    %rax, const(0), %rax
;;   jb #trap=heap_oob
;;   movq    8(%rsi), %rcx
;;   addq    %rdi, 0(%rsi), %rdi
;;   movl    $-65536, %edx
;;   lea     0(%rdi,%rdx,1), %rsi
;;   xorq    %rdx, %rdx, %rdx
;;   cmpq    %rcx, %rax
;;   cmovnbeq %rdx, %rsi, %rsi
;;   movzbq  0(%rsi), %rax
;;   jmp     label1
;; block1:
;;   movq    %rbp, %rsp
;;   popq    %rbp
;;   ret
