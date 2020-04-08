	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$1094795585, 20(%rsp)   ## imm = 0x41414141
	movl	$29477, 16(%rsp)        ## imm = 0x7325
	leaq	16(%rsp), %rax
	movq	%rax, %rdi
	leaq	20(%rsp), %rsi
	movb	$0, %al
	callq	_printf
	xorl	%ecx, %ecx
	movl	%eax, 12(%rsp)          ## 4-byte Spill
	movl	%ecx, %eax
	addq	$24, %rsp
	retq
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
