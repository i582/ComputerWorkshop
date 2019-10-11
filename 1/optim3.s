	.file	"main.c"
	.text
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Enter number: \0"
LC1:
	.ascii "%u\0"
LC3:
	.ascii "count = %u\0"
	.section	.text.startup,"x"
	.p2align 4,,15
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB52:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	.cfi_offset 7, -12
	xorl	%edi, %edi
	pushl	%esi
	pushl	%ebx
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	$1, %ebx
	andl	$-16, %esp
	subl	$64, %esp
	call	___main
	movl	$LC0, (%esp)
	movl	$0, 60(%esp)
	call	_printf
	leal	60(%esp), %eax
	movl	$LC1, (%esp)
	movl	%eax, 4(%esp)
	call	_scanf
	movl	60(%esp), %ecx
	jmp	L2
	.p2align 4,,10
L5:
	movl	60(%esp), %ecx
	movzwl	%bx, %esi
	xorl	%edx, %edx
	movl	%ecx, %eax
	divl	%esi
	cmpl	$1, %edx
	adcw	$0, %di
	addl	$1, %ebx
L2:
	movl	%ecx, 24(%esp)
	movl	$0, 28(%esp)
	fildq	24(%esp)
	fld	%st(0)
	fsqrt
	fldz
	fucomp	%st(2)
	fnstsw	%ax
	sahf
	ja	L8
	fstp	%st(1)
L4:
	fnstcw	38(%esp)
	movzwl	38(%esp), %eax
	orb	$12, %ah
	movw	%ax, 36(%esp)
	fldcw	36(%esp)
	fistpl	32(%esp)
	fldcw	38(%esp)
	movl	32(%esp), %eax
	cmpw	%bx, %ax
	jnb	L5
	addl	%edi, %edi
	movl	$LC3, (%esp)
	movzwl	%di, %edi
	movl	%edi, 4(%esp)
	call	_printf
	leal	60(%esp), %eax
	movl	$LC1, (%esp)
	movl	%eax, 4(%esp)
	call	_scanf
	leal	-12(%ebp), %esp
	xorl	%eax, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
L8:
	.cfi_restore_state
	fstpl	24(%esp)
	fstpl	(%esp)
	call	_sqrt
	fstp	%st(0)
	fldl	24(%esp)
	jmp	L4
	.cfi_endproc
LFE52:
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_sqrt;	.scl	2;	.type	32;	.endef
