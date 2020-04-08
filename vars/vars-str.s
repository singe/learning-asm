	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"1"

L_.str.1:                               ## @.str.1
	.asciz	"2"

L_.str.2:                               ## @.str.2
	.asciz	"3"

	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                   ## -- Begin function main
_main:                                  ## @main
	subq	$72, %rsp
	leaq	37(%rsp), %rax
	movl	$0, 68(%rsp)

	leaq	L_.str(%rip), %rcx    # a = 1
	movq	%rcx, 56(%rsp)

	leaq	L_.str.1(%rip), %rcx  # b = 2
	movq	%rcx, 48(%rsp)

	leaq	L_.str.2(%rip), %rcx  # c = 3
	movq	%rcx, 40(%rsp)

	movq	56(%rsp), %rsi        # a 56(rsp)
	movq	%rax, %rdi
	movq	%rax, 24(%rsp)          ## 8-byte Spill
	callq	_strcpy

	movq	48(%rsp), %rsi        # b 48(rsp)
	movq	24(%rsp), %rdi          ## 8-byte Reload
	movq	%rax, 16(%rsp)          ## 8-byte Spill
	callq	_strcat

	xorl	%edx, %edx
	movq	%rax, 8(%rsp)           ## 8-byte Spill
	movl	%edx, %eax
	addq	$72, %rsp
	retq
