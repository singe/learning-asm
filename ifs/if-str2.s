	.section	__TEXT,__cstring
L_.str:
	.asciz	"foo"
L_.str.1:
	.asciz	"bar"
L_.str.2:
	.asciz	"%s"
L_.str.3:
	.asciz	"baz"

	.section	__TEXT,__text
	.globl	_main
_main:
	subq	$24, %rsp             # allocate

	movl	$0, 20(%rsp)          # return value

	leaq	L_.str(%rip), %rax    # a = "foo"
	movq	%rax, 8(%rsp)

	leaq	L_.str.1(%rip), %rax  # b = "bar"
	movq	%rax, (%rsp)

	movq	8(%rsp), %rax         # if a == b
	cmpq	(%rsp), %rax
	jne	end

	leaq	L_.str.2(%rip), %rdi  # printf("%s","baz")
	leaq	L_.str.3(%rip), %rsi
	movb	$0, %al
	callq	_printf

end:
	xorl	%eax, %eax
	addq	$24, %rsp
	retq
