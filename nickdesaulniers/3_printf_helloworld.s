.data
_hello:
  .asciz "hello world %d\n"

.text
.globl _main
_main:
  subq $8, %rsp

  movb $0, %al
  leaq _hello(%rip), %rdi
  movq $42, %rsi
  call _printf

  movq $0, %rdi
  call _exit
