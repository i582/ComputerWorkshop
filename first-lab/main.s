	.file	"main.c"
	.text
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Enter number: \0"
LC1:
	.ascii "%u\0"
LC2:
	.ascii "count = %u\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$64, %esp
	call	___main
	movl	$0, 56(%esp)
	movw	$1, 62(%esp)
	movw	$0, 60(%esp)
	movl	$LC0, (%esp)
	call	_printf
	leal	56(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	jmp	L2
L4:
	movl	56(%esp), %eax
	movzwl	62(%esp), %ecx
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	testl	%eax, %eax
	jne	L3
	movzwl	60(%esp), %eax
	addl	$1, %eax
	movw	%ax, 60(%esp)
L3:
	movzwl	62(%esp), %eax
	addl	$1, %eax
	movw	%ax, 62(%esp)
L2:
	movl	56(%esp), %eax
	movl	%eax, 24(%esp)
	movl	$0, 28(%esp)
	fildq	24(%esp)
	fstpl	40(%esp)
	fldl	40(%esp)
	fstpl	(%esp)
	call	_sqrt
	fnstcw	38(%esp)
	movzwl	38(%esp), %eax
	orb	$12, %ah
	movw	%ax, 36(%esp)
	fldcw	36(%esp)
	fistpl	32(%esp)
	fldcw	38(%esp)
	movl	32(%esp), %eax
	cmpw	%ax, 62(%esp)
	jbe	L4
	salw	60(%esp)
	movzwl	60(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	leal	56(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_sqrt;	.scl	2;	.type	32;	.endef
