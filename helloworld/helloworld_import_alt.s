.section __DATA,__cstring
fmt:
  .asciz "%s"
hw:
  .asciz "Hello world!\n"

.section __TEXT,__text
.globl _main
_main:
  pushq %rbp
  movq  %rsp, %rbp
  movq fmt@GOTPCREL(%rip), %rdi
  movq hw@GOTPCREL(%rip), %rsi
  movb  $0x0, %al
  call _printf_stub
  pop  %rbp
  retq

.section __IMPORT,__jump_table,symbol_stubs,self_modifying_code+pure_instructions,5
_printf_stub:
	.indirect_symbol _printf
	hlt ; hlt ; hlt ; hlt ; hlt
