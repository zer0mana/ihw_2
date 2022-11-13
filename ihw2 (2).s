	.file	"ihw2.c"
	.intel_syntax noprefix			# Используем синтаксис в стиле Intel
	.text 					# Начало секции
	.local	res 				# Объявляем символ res, но не экспортируем его
	.comm	res,1000,32 			# Неинициализированный массив
	.globl	solve 				# Объявляем и экспортируем вовне символ `solve`
	.type	solve, @function
solve:
	endbr64
	push	rbp 		# / Пролог функции (1/3). Сохранили предыдущий rbp на стек.
	mov	rbp, rsp 	# | Пролог функции (2/3). Вместо rbp записали rsp.
	sub	rsp, 936 	# \ Пролог функции (3/3). А сам rsp сдвинули на 936 байт
	mov	QWORD PTR -1048[rbp], rdi	# rbp[-1048] := rdi
	mov	DWORD PTR -1052[rbp], esi	# rbp[-1052] := esi
	mov	r13d, 0 			# r13d := 0
	mov	r12d, 0 			# r12d := 0
	mov	r14d, 0 			# r14d := 0
	jmp	.L2 				# Переход в секцию .L2
.L11:
	mov	eax, r14d 			# eax := r14d
	movsx	rdx, eax 			# rdx := eax
	mov	rax, QWORD PTR -1048[rbp] 	# rax := rbp[-1048]
	add	rax, rdx 			# rax := rax + rdx
	movzx	eax, BYTE PTR [rax]		# eax := rax
	mov	BYTE PTR -37[rbp], al 		# rbp[-37] := al
	cmp	BYTE PTR -37[rbp], 96 		# Сравнение операндов (это счетчик цикла)
	jle	.L3				# Переход если меньше .L3
	cmp	BYTE PTR -37[rbp], 122		# Сравнение операндов (это тоже счетчик цикла)
	jg	.L3				# Переход если больше .L3
	mov	eax, r13d			# eax := r13d			
	lea	edx, 1[rax]			# edx := rax[1]
	mov	r13d, edx			# r13d := edx
	cdqe
	movzx	edx, BYTE PTR -37[rbp]
	mov	BYTE PTR -1040[rbp+rax], dl	# *(rbp + rax)[-1040] := dl;
	jmp	.L4				# Переход в L4
.L3:
	mov	DWORD PTR -16[rbp], 1		# rbp[-16] := 1
	mov	DWORD PTR -20[rbp], 0		# rbp[-20] := 0
	jmp	.L5				# Переход в секцию .L5
.L7:
	mov	eax, DWORD PTR -20[rbp]		# eax := rbp[-20]
	cdqe
	movzx	edx, BYTE PTR -1040[rbp+rax]	# edx := *(rbp + rax)[-1040]
	mov	eax, r13d			# edx := r13d
	sub	eax, DWORD PTR -20[rbp]
	sub	eax, 1
	cdqe
	movzx	eax, BYTE PTR -1040[rbp+rax]	# eax := *(rbp + rax)[-1040]
	cmp	dl, al				# Сравнение операндов
	je	.L6				# Переход если больше .L6
	mov	DWORD PTR -16[rbp], 0		# rbp[-16] := 0
.L6:
	add	DWORD PTR -20[rbp], 1		# rbp[-20] += 1
.L5:
	mov	eax, DWORD PTR -20[rbp]		# eax := rbp[-20]
	cmp	eax, r13d			# Сравнение операндов
	jl	.L7				# Переход если больше .L7
	cmp	DWORD PTR -16[rbp], 1		# Сравнение операндов
	jne	.L8
	cmp	r13d, 0				# Сравнение операндов
	je	.L8				# Переход если больше .L8
	mov	DWORD PTR -24[rbp], 0		# rbp[-24] := 0
	jmp	.L9				# Переход в секцию .L9
.L10:
	mov	eax, r12d			# eax := r12d
	lea	edx, 1[rax]			# edx := rax[1]
	mov	r12d, edx			# r12d := edx
	mov	edx, DWORD PTR -24[rbp]		# edx := rbp[-24]
	movsx	rdx, edx			# rdx := edx		
	movzx	edx, BYTE PTR -1040[rbp+rdx]	# edx := *(rbp + rdx)[-1040]
	cdqe
	lea	rcx, res[rip]			# rcx := rip[res]
	mov	BYTE PTR [rax+rcx], dl		# *(rax + rcx) := dl
	add	DWORD PTR -24[rbp], 1		# rbp[-24] += 1
.L9:
	mov	eax, DWORD PTR -24[rbp]		# eax := rbp[-24]
	cmp	eax, r13d			# Сравнение операндов
	jl	.L10				# Переход если больше .L10
	mov	eax, r12d			# eax := r12d
	lea	edx, 1[rax]			# edx := rax[1]
	mov	r12d, edx			# r12d := edx
	cdqe
	lea	rdx, res[rip]			# rdx := rip[res]
	mov	BYTE PTR [rax+rdx], 32		# *(rax + rdx) := 32
.L8:
	mov	r13d, 0				# r13d := 0
.L4:
	add	r14d, 1				# r14d += 1
.L2:
	mov	eax, r14d			# eax := r14d
	cmp	eax, DWORD PTR -1052[rbp]	# Сравнение операндов
	jl	.L11
	mov	DWORD PTR -28[rbp], 1		# rbp[-28] := 1
	mov	DWORD PTR -32[rbp], 0		# rbp[-32] := 0
	jmp	.L12
.L14:
	mov	eax, DWORD PTR -32[rbp]		# eax := rbp[-32]
	cdqe
	movzx	edx, BYTE PTR -1040[rbp+rax]	# edx := *(rbp + rax)[-1040]
	mov	eax, r13d			# eax := r13d
	sub	eax, DWORD PTR -32[rbp]		# eax := rbp[-32]
	sub	eax, 1				# eax := 1
	cdqe
	movzx	eax, BYTE PTR -1040[rbp+rax]	# eax := *(rbp + rax)[-1040]
	cmp	dl, al				# Сравнение операндов
	je	.L13
	mov	DWORD PTR -28[rbp], 0		# rbp[-28] := 0
.L13:
	add	DWORD PTR -32[rbp], 1		# rbp[-32] += 1
.L12:
	mov	eax, DWORD PTR -32[rbp]		# eax := rbp[-32]
	cmp	eax, r13d			# Сравнение операндов
	jl	.L14
	cmp	DWORD PTR -28[rbp], 1		# Сравнение операндов
	jne	.L18
	mov	DWORD PTR -36[rbp], 0		# rbp[-36] := 0
	jmp	.L16				# Переход в секцию .L16
.L17:
	mov	eax, r12d			# eax := r12d
	lea	edx, 1[rax]			# edx := rax[1]
	mov	r12d, edx			# r12d := edx
	mov	edx, DWORD PTR -36[rbp]		# edx := rbp[-36]
	movsx	rdx, edx			# rdx := edx
	movzx	edx, BYTE PTR -1040[rbp+rdx]	# edx := *(rbp + rdx)[-1040]
	cdqe
	lea	rcx, res[rip]			# rcx := rip[res]
	mov	BYTE PTR [rax+rcx], dl		# *(rax + rcx) := dl
	add	DWORD PTR -36[rbp], 1		# rbp[-36] := 1
.L16:
	mov	eax, DWORD PTR -36[rbp]		# eax := rbp[-36]
	cmp	eax, r13d			# Сравнение операндов
	jl	.L17
.L18:
	nop
	leave
	ret
	.size	solve, .-solve
	.section	.rodata
.LC0:
	.string	"%s"
	.text					# Начало секции
	.globl	main				# Объявляем и экспортируем вовне символ `main`
	.type	main, @function
main:
	push	rbp		# / Пролог функции (1/3). Сохранили предыдущий rbp на стек.
	mov	rbp, rsp	# | Пролог функции (2/3). Вместо rbp записали rsp.
	sub	rsp, 1008	# \ Пролог функции (3/3). А сам rsp сдвинули на 1008 байт
	mov	r13d, 0		# r13d := 0
.L20:
	mov	rax, QWORD PTR stdin[rip]	# rax := rip[stdin]
	mov	rdi, rax			# rdi := rax
	call	fgetc@PLT
	mov	BYTE PTR -5[rbp], al		# rbp[-5] := al
	mov	eax, r13d			# eax := r13d
	lea	edx, 1[rax]			# edx := rax[1]
	mov	r13d, edx			# r13d := edx
	cdqe
	movzx	edx, BYTE PTR -5[rbp]		# edx := rbp[-5]
	mov	BYTE PTR -1008[rbp+rax], dl	# *(rbp + rax)[-1008] := dl
	cmp	BYTE PTR -5[rbp], 10		# Сравнение операндов
	jne	.L20				# Переход если больше .L10	
	mov	eax, r13d			# eax := r13d
	lea	edx, -1[rax]			# edx := rax[-1]
	lea	rax, -1008[rbp]			# rax := rbp[-1008]
	mov	esi, edx			# esi := edx
	mov	rdi, rax			# rdi := rax
	call	solve				# Вызываем функцию 'solve'
	lea	rax, res[rip]			# rax := rip[res]
	mov	rsi, rax			# rsi := rax
	lea	rax, .LC0[rip]			# rax := rip
	mov	rdi, rax			# rdi := rax
	mov	eax, 0				# eax := 0
	call	printf@PLT			# Вызываем функцию 'printf@PLT'
	mov	eax, 0				# eax := 0
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
