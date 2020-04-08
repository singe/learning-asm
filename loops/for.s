	.section	__TEXT,__cstring
L_.str:
	.asciz	"%d"

	.section	__TEXT,__text
	.globl	_main
_main:
	pushq	%rax

	movl	$0, 4(%rsp)         # int main return 0
	movl	$0, (%rsp)          # int i = 0

loop:
	cmpl	$5, (%rsp)          # while i < 5
	jge	end

	movl	(%rsp), %esi        # printf("%d", i)
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf

	movl	(%rsp), %eax        # i++
	addl	$1, %eax
	movl	%eax, (%rsp)

	jmp	loop                  # loop

end:
	xorl	%eax, %eax
	popq	%rcx
	retq
