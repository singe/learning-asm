# A simple hello world using system calls
.section __DATA,__data
str:                             # Put our string in the data segment
  .asciz "Hello world!\n"

.section __TEXT,__text
.globl _main
_main:
  #pushq %rax

  movq $0x2000004, %rax          # preparing the write system call 4
  movq $1, %rdi                  # STDOUT file descriptor is 1
  movq str@GOTPCREL(%rip), %rsi  # The value to print
  movq $13, %rdx                 # the size of the value to print
  syscall                        # write(stdout, "Hello world!\n", 13)
  
  movq $0x2000001, %rax          # preparing the exit system call
  movq $0, %rdi
  syscall                        # exit(0)

  #popq %rax
  #retq
