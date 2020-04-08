	.section	__TEXT,__cstring
L_.str:
	.asciz	"foo"

L_.str.1:
	.asciz	"%s"

	.section	__TEXT,__text
	.globl	_main
_main:
	subq	$24, %rsp             # allocate local variable space

	movl	$0, 20(%rsp)

	leaq	L_.str(%rip), %rax    # fetch "foo"
	movq	%rax, 8(%rsp)         # char* a = "foo"
	movq	%rax, (%rsp)          # char* b = "foo"

	movq	8(%rsp), %rax         # copy a to rax
	cmpq	(%rsp), %rax          # a == b
	jne	end

	leaq	L_.str.1(%rip), %rdi  # printf("%s","foo")
	leaq	L_.str(%rip), %rsi
	movb	$0, %al
	callq	_printf

end:
	xorl	%eax, %eax            # set return to 0
	addq	$24, %rsp             # dealloc local variable space?
	retq
