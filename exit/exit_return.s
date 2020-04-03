# simple exit main function return
.section __TEXT,__text
.globl _main
_main:
  pushq %rax
  movl $2, (%rsp)
  popq %rax
  retq
