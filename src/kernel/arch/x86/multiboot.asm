.section .text

.global multiboot_validate
multiboot_validate:
	pushl %eax
	movl stack_bottom,%eax
	movl magic, %ebx
	cmpl %eax, %ebx
	jne .not_found
	popl %eax
	movl stack_bottom+4, %ebx
	ret
.not_found:
	pushl $0
	call panic

.section .rodata

magic: .long 0x2BADB002
