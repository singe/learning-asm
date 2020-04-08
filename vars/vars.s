	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
_main:
	#movl	$0, -4(%rsp)    # ?
	movl	$1, -4(%rsp)    # a = 1
	movl	$2, -8(%rsp)   # b = 2
	movl	$3, -12(%rsp)   # c = 3

                        # d = a + b
	movl	-4(%rsp), %eax  # a into eax 
	addl	-8(%rsp), %eax # add b to eax
	movl	%eax, -16(%rsp) # d = result

                        # e = b + c
	movl	-8(%rsp), %eax # b to eax
	addl	-12(%rsp), %eax # add c to eax
	movl	%eax, -20(%rsp) # e = result

                        # a = a + b
	movl	-4(%rsp), %eax  # a to eax
	addl	-8(%rsp), %eax # add b to a
	movl	%eax, -4(%rsp)  # a = result

	movl	-4(%rsp), %eax  # return a
	retq
