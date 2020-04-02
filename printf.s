	.section	__TEXT,__text
	.globl	_main
_main:
	pushq	%rax
	leaq	L_.fmt(%rip), %rdi
	leaq	L_.hw(%rip), %rsi
	movb	$0, %al
	callq	_printf
	popq	%rax
	retq

	.section	__TEXT,__cstring
L_.fmt:
	.asciz	"%s"
L_.hw:
	.asciz	"hello world\n"
