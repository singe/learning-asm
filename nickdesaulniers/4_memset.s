.data
_answer:
  .asciz "Current byte: %d\n"

.text
.globl _main
_main:
  subq $8, %rsp

  subq $16, %rsp # allocate 16B
  leaq (%rsp), %rdi # first arg, &array
  movq $42, %rsi # second arg, 42
  movq $16, %rdx # third arg, 16B
  call _memset

  leaq _answer(%rip), %rdi
  movq $0, %rsi # zero out rsi incase clobbered by call to memset
  movb (%rsp), %sil # copy first byte of (rsp) to lower byte of rsi equavlent to movzql (%rsp), %esi
  movb $0, %al
  call _printf

  incq (%rsp) # deref and inc first byte of array

  leaq _answer(%rip), %rdi
  movq $0, %rsi
  movb (%rsp), %sil
  movb $0, %al
  call _printf

  leaq _answer(%rip), %rdi
  movq $0, %rsi
  movb 1(%rsp), %sil # print second byte of array
  movb $0, %al
  call _printf

  addq $16, %rsp # clean up stack

  movq $0, %rdi
  call _exit
