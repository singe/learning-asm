# Simple exit using an imported function
  .section  __TEXT,__text
  .globl  _main                   
_main:                                  
  pushq %rax     # Push the stack pointer to return to
  movq  $2, %rdi # Put $2 in the first argument to exit
  callq _exit    # Call the exit function, the linked will import it
