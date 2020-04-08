	.section	__TEXT,__cstring
L___const.main.hello:
	.asciz	"Hello"

L___const.main.world:
	.asciz	"World"

L_.str:
	.asciz	"%s"

	.section	__TEXT,__text
	.globl	_main
_main:

	subq	$56, %rsp

	movq	___stack_chk_guard@GOTPCREL(%rip), %rax # put stack canary in rax
	movq	(%rax), %rax                            # deref rax
	movq	%rax, 48(%rsp)                          # store stack canary in 48(rsp)

	movl	$0, 32(%rsp)

	movl	L___const.main.hello(%rip), %ecx
	movl	%ecx, 26(%rsp)
	movw	L___const.main.hello+4(%rip), %dx
	movw	%dx, 30(%rsp)

	movl	L___const.main.world(%rip), %ecx
	movl	%ecx, 20(%rsp)
	movw	L___const.main.world+4(%rip), %dx
	movw	%dx, 24(%rsp)

	movl	$0, 16(%rsp)          # i = 0
	movl	$0, 12(%rsp)          # j = 0

  # for loop 1
	movl	$0, 16(%rsp)          # i = 0
for1_start:

  # hello[i] != "\0"
	movslq	16(%rsp), %rax      # i into rax
	movsbl	26(%rsp,%rax), %ecx # hello[i] into ecx
	cmpl	$0, %ecx              # if ecx == \0
	je	for1_end                # break

	movslq	16(%rsp), %rax      # i into rax
	movb	26(%rsp,%rax), %cl    # hello[i] into cl
	movslq	12(%rsp), %rax      # j into rax
	movb	%cl, 37(%rsp,%rax)    # cl into buf[j]

	movl	12(%rsp), %edx        # j++
	addl	$1, %edx
	movl	%edx, 12(%rsp)

	movl	16(%rsp), %eax        # i++
	addl	$1, %eax
	movl	%eax, 16(%rsp)

	jmp for1_start
for1_end:

  # for loop 2
	movl	$0, 16(%rsp)          # i = 0
for2_start:
	movslq	16(%rsp), %rax      # i into rax
	movsbl	20(%rsp,%rax), %ecx # world[i] into ecx
	cmpl	$0, %ecx              # if ecx == \0
	je	for2_end                # break

	movslq	16(%rsp), %rax      # i into rax
	movb	20(%rsp,%rax), %cl    # world[i] into cl
	movslq	12(%rsp), %rax      # j into rax
	movb	%cl, 37(%rsp,%rax)    # cl into buf[j]

	movl	12(%rsp), %edx        # j++
	addl	$1, %edx
	movl	%edx, 12(%rsp)

	movl	16(%rsp), %eax        # i++
	addl	$1, %eax
	movl	%eax, 16(%rsp)

	jmp	for2_start
for2_end:

	movslq	12(%rsp), %rax      # j into rax
	movb	$0, 37(%rsp,%rax)     # buf[j] set to \0

	leaq	37(%rsp), %rsi        # printf second arg buf
	leaq	L_.str(%rip), %rdi    # printf first arg %s
	movb	$0, %al
	callq	_printf

	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx # put stack canary in rcx
	movq	(%rcx), %rcx                            # deref rcx
	movq	48(%rsp), %rdx                          # fetch initial stack canary
	cmpq	%rdx, %rcx                              # make sure they match
	jne	stackguard_fail

	xorl	%eax, %eax            # return code 0
	addq	$56, %rsp
	retq

stackguard_fail:
	callq	___stack_chk_fail
	ud2
