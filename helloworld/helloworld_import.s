	.section	__TEXT,__cstring    # Put our strings in the TEXT segment
L_.fmt:
	.asciz	"%s"                  # The format string
L_.hw:
	.asciz	"Hello world!\n"      # The text

	.section	__TEXT,__text
	.globl	_main
_main:
	pushq	%rax

	leaq	L_.fmt(%rip), %rdi      # The format string
	leaq	L_.hw(%rip), %rsi       # The value to print
	movb	$0, %al
	callq	_printf                 # printf("%s", "Hello world!\n")

  movq $0, %rdi                 # exit code 0
  callq _exit                   # exit(0)

	#popq	%rax
	#retq
