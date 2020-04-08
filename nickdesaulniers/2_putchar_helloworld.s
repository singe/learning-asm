.text
.globl _main
_main:
  subq $8, %rsp

movq $0x48, %rdi
call _putchar

movq $0x65, %rdi
call _putchar

movq $0x6c, %rdi
call _putchar

movq $0x6c, %rdi
call _putchar

movq $0x6f, %rdi
call _putchar

movq $0x20, %rdi
call _putchar

movq $0x57, %rdi
call _putchar

movq $0x6f, %rdi
call _putchar

movq $0x72, %rdi
call _putchar

movq $0x6c, %rdi
call _putchar

movq $0x64, %rdi
call _putchar

movq $0x21, %rdi
call _putchar

  movq $0, %rdi
  call _exit
