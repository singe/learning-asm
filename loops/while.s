	.section	__TEXT,__cstring
L_.str:
	.asciz	"%d"

	.section	__TEXT,__text
  .globl _main
_main:
	pushq	%rax

  movl	$0, (%rsp)            # int main - return 0
	movl	$0, 4(%rsp)           # int i = 0

loop:
	cmpl	$5, 4(%rsp)           # if i = 5
	jge	end                     # jump to end

  # printf
	movl	4(%rsp), %esi         # i
	leaq	L_.str(%rip), %rdi    # %d
	movb	$0, %al
	callq	_printf               # printf("%d",i)

	movl	4(%rsp), %ecx
	addl	$1, %ecx              # i = i + 1
	movl	%ecx, 4(%rsp)

	jmp	loop

end:
	popq	%rax
	retq
