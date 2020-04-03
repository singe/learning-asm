# simplest exit
.section __TEXT,__text
.globl _main
_main:
  movq $2, %rax  # Put 0 into RAX, which is where result values go.
  ret            # returns to whoever called us.

