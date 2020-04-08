  .section  __TEXT,__text
  .globl  _main
_main:
  movq $0x2000004, %rax         # write syscall
  movq $1, %rdi                 # stdout file 1
  movq $0x0041414141, -20(%rsp) # AAAA\0 into local var -20(rsp)
  leaq -20(%rsp), %rsi          # syscall parm 1
  movq $10, %rdx                # write length
  syscall                       # call
  xorl %eax, %eax               # return 0
  retq
