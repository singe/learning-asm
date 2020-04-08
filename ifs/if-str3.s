	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                   ## -- Begin function main
_main:                                  ## @main
	subq	$40, %rsp

	movl	$0, 36(%rsp)

	leaq	L_.str(%rip), %rax
	movq	%rax, 24(%rsp)

	leaq	L_.str.1(%rip), %rax
	movq	%rax, 16(%rsp)

	leaq	L_.str.2(%rip), %rax
	movq	%rax, 8(%rsp)

	movq	24(%rsp), %rax
	cmpq	16(%rsp), %rax
	jne	LBB0_2

	leaq	L_.str.3(%rip), %rdi
	leaq	L_.str.4(%rip), %rsi
	movb	$0, %al
	callq	_printf

LBB0_2:
	xorl	%eax, %eax
	addq	$40, %rsp
	retq

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"foo"

L_.str.1:                               ## @.str.1
	.asciz	"bar"

L_.str.2:                               ## @.str.2
	.asciz	"quux"

L_.str.3:                               ## @.str.3
	.asciz	"%s"

L_.str.4:                               ## @.str.4
	.asciz	"baz"


.subsections_via_symbols
