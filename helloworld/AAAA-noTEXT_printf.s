  .section  __TEXT,__text
  .globl  _main
_main:
  subq  $40, %rsp             # Variable space

  movb  $0, 24(%rsp)          # Null terminator
  movl  $0x41414141, 20(%rsp) # AAAA
  movl  $0x7325, 16(%rsp)     # %s

  leaq  16(%rsp), %rdi        # param 1
  leaq  20(%rsp), %rsi        # param 2
  movb  $0, %al
  callq _printf               # printf("%s","AAAA")

  addq  $40, %rsp             # Reclaim variable space
  retq
