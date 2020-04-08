	.section	__TEXT,__text
	.globl	_main
_main:
	subq	$56, %rsp

	leaq	32(%rsp), %rax
	movq	%rax, %rdi
	movl	$42, %esi
	movl	$16, %edx
	movq	%rax, 16(%rsp)
	callq	_memset

	movq	16(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	24(%rsp), %rcx
	movsbl	(%rcx), %esi
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf

	movq	24(%rsp), %rcx
	movb	(%rcx), %r8b
	addb	$1, %r8b
	movb	%r8b, (%rcx)
	movq	24(%rsp), %rcx
	movsbl	(%rcx), %esi
	leaq	L_.str(%rip), %rdi
	movl	%eax, 12(%rsp)
	movb	$0, %al
	callq	_printf

	movq	24(%rsp), %rcx
	addq	$1, %rcx
	movq	%rcx, 24(%rsp)
	movq	24(%rsp), %rcx
	movsbl	(%rcx), %esi
	leaq	L_.str(%rip), %rdi
	movl	%eax, 8(%rsp)
	movb	$0, %al
	callq	_printf

	xorl	%eax, %eax
	addq	$56, %rsp
	retq

	.section	__TEXT,__cstring
L_.str:
	.asciz	"Current byte: %hhd\n"
