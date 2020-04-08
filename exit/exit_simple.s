# simple exit main function return
.section __TEXT,__text
.globl _main
_main:
  movl $2, %eax
  retq
