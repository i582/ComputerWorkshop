	.file	"main.c"
	.text
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC4:
	.ascii "Result = %lf\0"
LC5:
	.ascii "%lf\0"
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
	subl	$32, %esp
	call	___main
	fldz
	fstpl	16(%esp)
	fld1
	fstpl	24(%esp)
	jmp	L2
L3:
	fldl	24(%esp)
	fstpl	(%esp)
	call	_sin
	fldl	16(%esp)
	faddp	%st, %st(1)
	fstpl	16(%esp)
	fldl	24(%esp)
	fldl	LC2
	faddp	%st, %st(1)
	fstpl	24(%esp)
L2:
	fldl	LC3
	fcompl	24(%esp)
	fnstsw	%ax
	sahf
	jnb	L3
	fldl	16(%esp)
	fstpl	4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	leal	16(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_scanf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
	.align 8
LC2:
	.long	-1717986918
	.long	1069128089
	.align 8
LC3:
	.long	0
	.long	1073741824
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_sin;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
