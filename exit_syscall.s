# Simple exit program
.section __TEXT,__text
.globl _main
_main:
  movl $0x2000001, %eax # exit system call is $1 with $0x2000000 offset
  movq $2, %rdi         # set the exit code
  syscall
