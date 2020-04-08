	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$0, 20(%rsp)
	leaq	L_.str(%rip), %rax
	movq	%rax, 8(%rsp)
	movq	%rax, (%rsp)
	movq	8(%rsp), %rax
	cmpq	(%rsp), %rax
	jne	LBB0_2
## %bb.1:
	leaq	L_.str.1(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movb	$0, %al
	callq	_printf
LBB0_2:
	movl	$1, %eax
	addq	$24, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"foo"

L_.str.1:                               ## @.str.1
	.asciz	"%s"


.subsections_via_symbols
