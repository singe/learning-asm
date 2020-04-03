# Simple exit using a system call
.section __TEXT,__text
.globl _main
_main:
  movq  $0x2000001, %rax # exit system call is $1 with $0x2000000 offset
  movq  $2, %rdi         # set the exit code
  syscall                # call the syscall
