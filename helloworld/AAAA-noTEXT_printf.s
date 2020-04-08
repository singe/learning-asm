  .section  __TEXT,__text
  .globl  _main
_main:
  subq  $24, %rsp             # Variable space & stack alignment

  movq  $0x41414141, 4(%rsp)  # AAAA
  movl  $0x7325, (%rsp)       # %s

  leaq  (%rsp), %rdi          # param 1
  leaq  4(%rsp), %rsi         # param 2
  movb  $0, %al               # no vector args
  callq _printf               # printf("%s","AAAA")

  addq  $24, %rsp             # Reclaim variable space & stack alignment
  retq
