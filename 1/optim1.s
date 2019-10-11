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
	.text
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
	pushl	%esi
	pushl	%ebx
	andl	$-16, %esp
	subl	$64, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	call	___main
	movl	$0, 60(%esp)
	movl	$LC0, (%esp)
	call	_printf
	leal	60(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	$0, %esi
	movl	$1, %ebx
L2:
	movl	60(%esp), %eax
	movl	$0, %edx
	movl	%eax, 24(%esp)
	movl	%edx, 28(%esp)
	fildq	24(%esp)
	fld	%st(0)
	fsqrt
	fstpl	24(%esp)
	fldz
	fucomp	%st(1)
	fnstsw	%ax
	sahf
	ja	L7
	fstp	%st(0)
L4:
	fnstcw	38(%esp)
	movzwl	38(%esp), %eax
	orb	$12, %ah
	movw	%ax, 36(%esp)
	fldl	24(%esp)
	fldcw	36(%esp)
	fistpl	32(%esp)
	fldcw	38(%esp)
	movl	32(%esp), %eax
	cmpw	%bx, %ax
	jb	L8
	movzwl	%bx, %ecx
	movl	60(%esp), %eax
	movl	$0, %edx
	divl	%ecx
	cmpl	$1, %edx
	adcw	$0, %si
	addl	$1, %ebx
	jmp	L2
L7:
	fstpl	(%esp)
	call	_sqrt
	fstp	%st(0)
	jmp	L4
L8:
	addl	%esi, %esi
	movzwl	%si, %esi
	movl	%esi, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	leal	60(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	$0, %eax
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE52:
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_sqrt;	.scl	2;	.type	32;	.endef
