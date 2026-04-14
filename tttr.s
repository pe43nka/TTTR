	.file	"tttr.cpp"						# исходный файл с кодом
	.text									# переключение в сегмент кода (тексктовый)
	.globl	exitIni							# объявлние глобальной переменной exitIni
	.bss									# переключение в сегмент неинициализированных данных
	.align 4								# выравнивает следующую ячейку памяти по границе 4 байта
exitIni:
	.space 4								# резервирование 4 байт в BSS
	.globl	b								
	.data									# переключение  в сегмент инициализированных данных
	.align 8								
b:
	.ascii "123456789"						# размещение строки байтов в памяти
	.globl	gEnd
	.bss
	.align 4
gEnd:
	.space 4
	.globl	pTurn
	.data
pTurn:
	.byte	88
	.globl	currTurn
	.align 4
currTurn:
	.long	-1
	.globl	inp
	.bss
	.align 4
inp:
	.space 4
	.text
	.globl	_Z13signalHandleri
	.def	_Z13signalHandleri;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z13signalHandleri
_Z13signalHandleri:
.LFB2203:
	pushq	%rbp							# сохраняет значение регистра rbp в стеке
	.seh_pushreg	%rbp
	movq	%rsp, %rbp						# копирование вершины стека в rbp 
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)					# сохранение 32-битного аргумента в стек по смещению 16 от rbp
	movl	$1, exitIni(%rip)
	nop
	popq	%rbp
	ret										# возврат из функции
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "TicTacToe_Save.txt\0"
.LC1:
	.ascii "\12Game saved. Exiting...\0"
	.text
	.globl	_Z8saveGamev
	.def	_Z8saveGamev;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8saveGamev
_Z8saveGamev:
.LFB2204:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$504, %rsp
	.seh_stackalloc	504
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	.LC0(%rip), %rdx														# загрузка эффективного адреса строки .LC0 в rdx (относительно rip) 
	leaq	-96(%rbp), %rax
	movl	$16, %r8d
	movq	%rax, %rcx
.LEHB0:
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode 		# вызов конструктора класса ofstream 
.LEHE0:
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEE7is_openEv
	testb	%al, %al
	je	.L3																			# переход при нуле
	movzbl	b(%rip), %eax															# загрузка байта из переменной b в eax с расширенным нулем 
	movsbl	%al, %edx
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
.LEHB1:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	movzbl	1+b(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	movzbl	2+b(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	movzbl	3+b(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	movzbl	4+b(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	movzbl	5+b(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	movzbl	6+b(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	movzbl	7+b(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	movzbl	8+b(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movzbl	pTurn(%rip), %eax
	movsbl	%al, %edx
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	movl	currTurn(%rip), %eax
	movl	%eax, %edx
	call	_ZNSolsEi
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEE5closeEv
	movl	exitIni(%rip), %eax
	cmpl	$1, %eax
	sete	%al
	testb	%al, %al
	je	.L3
	movl	$1, gEnd(%rip)
	leaq	.LC1(%rip), %rdx
	movq	.refptr._ZSt4cout(%rip), %rax
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movq	.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%rip), %rax
	movq	%rax, %rdx
	call	_ZNSolsEPFRSoS_E
.LEHE1:
.L3:
	movl	currTurn(%rip), %eax
	subl	$1, %eax
	movl	%eax, currTurn(%rip)
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev
	jmp	.L6																			# безусловный переход
.L5:
	movq	%rax, %rbx
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev
	movq	%rbx, %rax
	movq	%rax, %rcx
.LEHB2:
	call	_Unwind_Resume															# вызов механизма раскрутки стека при исключении
	nop
.LEHE2:
.L6:
	addq	$504, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA2204:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2204-.LLSDACSB2204
.LLSDACSB2204:
	.uleb128 .LEHB0-.LFB2204
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB2204
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L5-.LFB2204
	.uleb128 0
	.uleb128 .LEHB2-.LFB2204
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
.LLSDACSE2204:
	.text
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "Game loaded.\0"
.LC3:
	.ascii "No save file found.\0"
	.text
	.globl	_Z8loadGamev
	.def	_Z8loadGamev;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8loadGamev														# директива SEH (структурированная обработка исключений) для функции loadGame
_Z8loadGamev:
.LFB2205:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$520, %rsp																# выделение 520 байт в стеке (уменьшение указателя стека)
	.seh_stackalloc	520
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	.LC0(%rip), %rdx
	leaq	-96(%rbp), %rax															# загрузка адреса локальной переменной (смещение -96 от rbp) в rax
	movl	$8, %r8d
	movq	%rax, %rcx
.LEHB3:
	call	_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode
.LEHE3:
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt14basic_ifstreamIcSt11char_traitsIcEE7is_openEv
	testb	%al, %al
	je	.L8
	leaq	b(%rip), %rdx
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
.LEHB4:
	call	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_RS3_
	movq	%rax, %rcx
	leaq	1+b(%rip), %rax
	movq	%rax, %rdx
	call	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_RS3_
	movq	%rax, %rcx
	leaq	2+b(%rip), %rax
	movq	%rax, %rdx
	call	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_RS3_
	movq	%rax, %rcx
	leaq	3+b(%rip), %rax
	movq	%rax, %rdx
	call	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_RS3_
	movq	%rax, %rcx
	leaq	4+b(%rip), %rax
	movq	%rax, %rdx
	call	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_RS3_
	movq	%rax, %rcx
	leaq	5+b(%rip), %rax
	movq	%rax, %rdx
	call	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_RS3_
	movq	%rax, %rcx
	leaq	6+b(%rip), %rax
	movq	%rax, %rdx
	call	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_RS3_
	movq	%rax, %rcx
	leaq	7+b(%rip), %rax
	movq	%rax, %rdx
	call	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_RS3_
	movq	%rax, %rcx
	leaq	8+b(%rip), %rax
	movq	%rax, %rdx
	call	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_RS3_
	leaq	pTurn(%rip), %rdx
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_RS3_
	movq	%rax, %rcx
	leaq	currTurn(%rip), %rax
	movq	%rax, %rdx
	call	_ZNSirsERi
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt14basic_ifstreamIcSt11char_traitsIcEE5closeEv
	leaq	.LC2(%rip), %rdx
	movq	.refptr._ZSt4cout(%rip), %rax
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movq	.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%rip), %rax
	movq	%rax, %rdx
	call	_ZNSolsEPFRSoS_E
	jmp	.L9
.L8:
	leaq	.LC3(%rip), %rdx
	movq	.refptr._ZSt4cout(%rip), %rax
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movq	.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%rip), %rax
	movq	%rax, %rdx
	call	_ZNSolsEPFRSoS_E
.LEHE4:
.L9:
	movl	currTurn(%rip), %eax
	subl	$1, %eax
	movl	%eax, currTurn(%rip)
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev
	jmp	.L12
.L11:
	movq	%rax, %rbx
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev
	movq	%rbx, %rax
	movq	%rax, %rcx
.LEHB5:
	call	_Unwind_Resume
	nop
.LEHE5:
.L12:
	addq	$520, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA2205:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2205-.LLSDACSB2205
.LLSDACSB2205:
	.uleb128 .LEHB3-.LFB2205
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB4-.LFB2205
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L11-.LFB2205
	.uleb128 0
	.uleb128 .LEHB5-.LFB2205
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
.LLSDACSE2205:
	.text
	.seh_endproc
	.globl	_Z9gameResetv
	.def	_Z9gameResetv;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9gameResetv
_Z9gameResetv:
.LFB2206:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movb	$88, pTurn(%rip)
	movl	$-1, currTurn(%rip)
	movl	$0, -4(%rbp)
	jmp	.L14
.L15:
	movl	-4(%rbp), %eax
	addl	$49, %eax
	movl	%eax, %ecx
	movl	-4(%rbp), %eax
	cltq
	leaq	b(%rip), %rdx
	movb	%cl, (%rax,%rdx)										# запись байта из cl в память по адресу rax+rdx 
	addl	$1, -4(%rbp)
.L14:
	cmpl	$8, -4(%rbp)											# сравнение 32-битного значения по адресу rbp-4 с числом 8
	jle	.L15
	nop
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC4:
	.ascii "\11\12\0"
.LC5:
	.ascii " \0"
.LC6:
	.ascii "\12\0"
	.align 8
.LC7:
	.ascii "------------------------------------------\0"
	.text
	.globl	_Z9drawBoardv
	.def	_Z9drawBoardv;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9drawBoardv
_Z9drawBoardv:
.LFB2207:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	.LC4(%rip), %rdx
	movq	.refptr._ZSt4cout(%rip), %rax
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movzbl	b(%rip), %eax
	movsbl	%al, %eax                      													# загрузка байта al в eax со знаком 
	movl	%eax, %edx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movzbl	1+b(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movzbl	2+b(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movzbl	3+b(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movzbl	4+b(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movzbl	5+b(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movzbl	6+b(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movzbl	7+b(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movzbl	8+b(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movq	.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%rip), %rax
	movq	%rax, %rdx
	call	_ZNSolsEPFRSoS_E
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z15changeBoardTypev
	.def	_Z15changeBoardTypev;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z15changeBoardTypev
_Z15changeBoardTypev:
.LFB2208:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	currTurn(%rip), %eax
	subl	$1, %eax
	movl	%eax, currTurn(%rip)
	movl	$0, -4(%rbp)
	jmp	.L18
.L21:
	movl	-4(%rbp), %eax
	cltq
	leaq	b(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	cmpb	$46, %al
	je	.L19
	movl	-4(%rbp), %eax
	cltq
	leaq	b(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	cmpb	$88, %al
	je	.L20
	movl	-4(%rbp), %eax
	cltq
	leaq	b(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	cmpb	$79, %al
	je	.L20
	movl	-4(%rbp), %eax
	cltq
	leaq	b(%rip), %rdx
	movb	$46, (%rax,%rdx)
	jmp	.L20
.L19:
	movl	-4(%rbp), %eax
	cltq
	leaq	b(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	cmpb	$88, %al
	je	.L20
	movl	-4(%rbp), %eax
	cltq
	leaq	b(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	cmpb	$79, %al
	je	.L20
	movl	-4(%rbp), %eax
	addl	$49, %eax
	movl	%eax, %ecx
	movl	-4(%rbp), %eax
	cltq
	leaq	b(%rip), %rdx
	movb	%cl, (%rax,%rdx)
.L20:
	addl	$1, -4(%rbp)
.L18:
	cmpl	$8, -4(%rbp)
	jle	.L21
	nop
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC8:
	.ascii " won!\0"
	.align 8
.LC9:
	.ascii "--------------------------------------------------\12Game Ended. Enter 1 to reset the board and play again, enter 0 to exit: \0"
	.align 8
.LC10:
	.ascii "--------------------------------------------------\12Tie! Enter 1 to reset the board and play again, enter 0 to exit: \0"
	.text
	.globl	_Z8winCheckv
	.def	_Z8winCheckv;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8winCheckv
_Z8winCheckv:
.LFB2209:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzbl	b(%rip), %eax
	cmpb	$46, %al
	je	.L23
	movzbl	b(%rip), %edx
	movzbl	1+b(%rip), %eax
	cmpb	%al, %dl
	jne	.L23
	movzbl	1+b(%rip), %edx
	movzbl	2+b(%rip), %eax
	cmpb	%al, %dl
	je	.L24
.L23:
	movzbl	3+b(%rip), %eax
	cmpb	$46, %al
	je	.L25
	movzbl	3+b(%rip), %edx
	movzbl	4+b(%rip), %eax
	cmpb	%al, %dl
	jne	.L25
	movzbl	4+b(%rip), %edx
	movzbl	5+b(%rip), %eax
	cmpb	%al, %dl
	je	.L24
.L25:
	movzbl	6+b(%rip), %eax
	cmpb	$46, %al
	je	.L26
	movzbl	6+b(%rip), %edx
	movzbl	7+b(%rip), %eax
	cmpb	%al, %dl
	jne	.L26
	movzbl	7+b(%rip), %edx
	movzbl	8+b(%rip), %eax
	cmpb	%al, %dl
	je	.L24
.L26:
	movzbl	b(%rip), %eax
	cmpb	$46, %al
	je	.L27
	movzbl	b(%rip), %edx
	movzbl	4+b(%rip), %eax
	cmpb	%al, %dl
	jne	.L27
	movzbl	4+b(%rip), %edx
	movzbl	8+b(%rip), %eax
	cmpb	%al, %dl
	je	.L24
.L27:
	movzbl	2+b(%rip), %eax
	cmpb	$46, %al
	je	.L28
	movzbl	2+b(%rip), %edx
	movzbl	4+b(%rip), %eax
	cmpb	%al, %dl
	jne	.L28
	movzbl	4+b(%rip), %edx
	movzbl	6+b(%rip), %eax
	cmpb	%al, %dl
	je	.L24
.L28:
	movzbl	b(%rip), %eax
	cmpb	$46, %al
	je	.L29
	movzbl	b(%rip), %edx
	movzbl	3+b(%rip), %eax
	cmpb	%al, %dl
	jne	.L29
	movzbl	3+b(%rip), %edx
	movzbl	6+b(%rip), %eax
	cmpb	%al, %dl
	je	.L24
.L29:
	movzbl	1+b(%rip), %eax
	cmpb	$46, %al
	je	.L30
	movzbl	1+b(%rip), %edx
	movzbl	4+b(%rip), %eax
	cmpb	%al, %dl
	jne	.L30
	movzbl	4+b(%rip), %edx
	movzbl	7+b(%rip), %eax
	cmpb	%al, %dl
	je	.L24
.L30:
	movzbl	2+b(%rip), %eax
	cmpb	$46, %al
	je	.L31
	movzbl	2+b(%rip), %edx
	movzbl	5+b(%rip), %eax
	cmpb	%al, %dl
	jne	.L31
	movzbl	5+b(%rip), %edx
	movzbl	8+b(%rip), %eax
	cmpb	%al, %dl
	jne	.L31
.L24:
	call	_Z9drawBoardv
	movzbl	pTurn(%rip), %eax
	movsbl	%al, %eax
	cmpl	$79, %eax
	je	.L32
	cmpl	$88, %eax
	jne	.L38
	movb	$79, pTurn(%rip)
	jmp	.L34
.L32:
	movb	$88, pTurn(%rip)
	jmp	.L34
.L38:
	nop
.L34:
	movzbl	pTurn(%rip), %eax
	movsbl	%al, %edx
	movq	.refptr._ZSt4cout(%rip), %rax
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movq	.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%rip), %rax
	movq	%rax, %rdx
	call	_ZNSolsEPFRSoS_E
	leaq	.LC9(%rip), %rdx
	movq	.refptr._ZSt4cout(%rip), %rax
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movq	.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%rip), %rax
	movq	%rax, %rdx
	call	_ZNSolsEPFRSoS_E
	leaq	inp(%rip), %rdx
	movq	.refptr._ZSt3cin(%rip), %rax
	movq	%rax, %rcx
	call	_ZNSirsERi
	movl	inp(%rip), %eax
	cmpl	$1, %eax
	jne	.L35
	call	_Z9gameResetv
	jmp	.L31
.L35:
	movl	inp(%rip), %eax
	testl	%eax, %eax
	jne	.L31
	movl	$1, gEnd(%rip)
.L31:
	movl	currTurn(%rip), %eax
	cmpl	$8, %eax
	jne	.L39
	call	_Z9drawBoardv													# вызов функции отрисовки игрового поля
	leaq	.LC10(%rip), %rdx
	movq	.refptr._ZSt4cout(%rip), %rax
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	leaq	inp(%rip), %rdx
	movq	.refptr._ZSt3cin(%rip), %rax
	movq	%rax, %rcx
	call	_ZNSirsERi
	movl	inp(%rip), %eax
	cmpl	$1, %eax
	jne	.L37
	call	_Z9gameResetv
	jmp	.L39
.L37:
	movl	inp(%rip), %eax
	testl	%eax, %eax
	jne	.L39
	movl	$1, gEnd(%rip)
.L39:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC11:
	.ascii "Player Turn: \0"
.LC12:
	.ascii " | Current Turn: \0"
	.align 8
.LC13:
	.ascii "\12Enter 10 to change the board look, 11 to load game, 12 to save game\12Press Ctrl + C to exit and save\0"
	.align 8
.LC14:
	.ascii "Enter any number between 1-9 to put a shape: \0"
	.align 8
.LC15:
	.ascii "\12-----------------------------------------------\12Incorrect Turn. Check if your input is withing 1-9 and the tile is unoccupied!\12Procceeding in 2 seconds...\12-----------------------------------------------\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB2210:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	call	__main
	leaq	_Z13signalHandleri(%rip), %rax
	movq	%rax, %rdx
	movl	$2, %ecx
	call	signal
	jmp	.L41
.L54:
	movl	$0, inp(%rip)
	call	_Z9drawBoardv
	movl	currTurn(%rip), %eax
	addl	$1, %eax
	movl	%eax, currTurn(%rip)
	leaq	.LC11(%rip), %rdx
	movq	.refptr._ZSt4cout(%rip), %rax
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movzbl	pTurn(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rcx
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movl	currTurn(%rip), %eax
	movl	%eax, %edx
	call	_ZNSolsEi
	movq	%rax, %rcx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movq	.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%rip), %rax
	movq	%rax, %rdx
	call	_ZNSolsEPFRSoS_E
	leaq	.LC14(%rip), %rdx
	movq	.refptr._ZSt4cout(%rip), %rax
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	leaq	inp(%rip), %rdx
	movq	.refptr._ZSt3cin(%rip), %rax
	movq	%rax, %rcx
	call	_ZNSirsERi
	movl	exitIni(%rip), %eax
	cmpl	$1, %eax
	sete	%al
	testb	%al, %al
	je	.L42
	call	_Z8saveGamev
	jmp	.L43
.L42:
	movl	inp(%rip), %eax
	cmpl	$12, %eax
	je	.L44
	cmpl	$12, %eax
	jg	.L56
	cmpl	$10, %eax
	je	.L46
	cmpl	$11, %eax
	je	.L47
	jmp	.L56
.L46:
	call	_Z15changeBoardTypev
	jmp	.L48
.L47:
	call	_Z8loadGamev
	jmp	.L48
.L44:
	call	_Z8saveGamev
	jmp	.L48
.L56:
	nop
.L48:
	movl	inp(%rip), %eax
	testl	%eax, %eax
	jle	.L49
	movl	inp(%rip), %eax
	cmpl	$9, %eax
	jg	.L49
	movl	inp(%rip), %eax
	subl	$1, %eax
	cltq
	leaq	b(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	cmpb	$88, %al
	je	.L49
	movl	inp(%rip), %eax
	subl	$1, %eax
	cltq
	leaq	b(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	cmpb	$79, %al
	je	.L49
	movzbl	pTurn(%rip), %eax
	movsbl	%al, %eax
	cmpl	$79, %eax
	je	.L50
	cmpl	$88, %eax
	jne	.L57
	movl	inp(%rip), %eax
	subl	$1, %eax
	cltq
	leaq	b(%rip), %rdx
	movb	$88, (%rax,%rdx)
	movb	$79, pTurn(%rip)
	jmp	.L52
.L50:
	movl	inp(%rip), %eax
	subl	$1, %eax
	cltq
	leaq	b(%rip), %rdx
	movb	$79, (%rax,%rdx)
	movb	$88, pTurn(%rip)
	jmp	.L52
.L57:
	nop
.L52:
	jmp	.L53
.L49:
	movl	currTurn(%rip), %eax
	subl	$1, %eax
	movl	%eax, currTurn(%rip)
	leaq	.LC15(%rip), %rdx
	movq	.refptr._ZSt4cout(%rip), %rax
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movq	.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%rip), %rax
	movq	%rax, %rdx
	call	_ZNSolsEPFRSoS_E
	movl	$2, %ecx
	call	sleep                                   # вызов системной функции sleep (задержка в секундах)
.L53:
	movl	exitIni(%rip), %eax
	testl	%eax, %eax
	sete	%al
	testb	%al, %al
	je	.L41
	call	_Z8winCheckv
.L41:
	movl	gEnd(%rip), %eax
	testl	%eax, %eax
	je	.L54
.L43:
	movl	$0, %eax								# обнуление регистра eax 
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc									# завершение SEH процедуры для текущей функции
	.def	__main;	.scl	2;	.type	32;	.endef
	.def	__gxx_personality_seh0;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (GNU) 15.2.0"																								# директива, записывающая идентификатор в строку компилятора
	.def	_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode;	.scl	2;	.type	32;	.endef
	.def	_ZNSt14basic_ofstreamIcSt11char_traitsIcEE7is_openEv;	.scl	2;	.type	32;	.endef
	.def	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEi;	.scl	2;	.type	32;	.endef
	.def	_ZNSt14basic_ofstreamIcSt11char_traitsIcEE5closeEv;	.scl	2;	.type	32;	.endef
	.def	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEPFRSoS_E;	.scl	2;	.type	32;	.endef
	.def	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
	.def	_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode;	.scl	2;	.type	32;	.endef
	.def	_ZNSt14basic_ifstreamIcSt11char_traitsIcEE7is_openEv;	.scl	2;	.type	32;	.endef
	.def	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_RS3_;	.scl	2;	.type	32;	.endef
	.def	_ZNSirsERi;	.scl	2;	.type	32;	.endef
	.def	_ZNSt14basic_ifstreamIcSt11char_traitsIcEE5closeEv;	.scl	2;	.type	32;	.endef
	.def	_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev;	.scl	2;	.type	32;	.endef
	.def	signal;	.scl	2;	.type	32;	.endef
	.def	sleep;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZSt3cin, "dr"                        													    # начало секции с данными для ссылки на std::cin
	.p2align	3, 0
	.globl	.refptr._ZSt3cin
	.linkonce	discard
.refptr._ZSt3cin:
	.quad	_ZSt3cin
	.section	.rdata$.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, "dr"
	.p2align	3, 0
	.globl	.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	.linkonce	discard
.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_:
	.quad	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.p2align	3, 0
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
