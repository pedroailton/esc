// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Declaracao de variaveis
@R0
D=M
@n0
M=D // n0 = R0

@R1
D=M
@n1
M=D // n1 = R1

@R2
M=0 // set R2 = 0

@multi
M=0 // multi = 0

@i
M=0 // i = 0

// Processo: n1 somas de n0
(LOOP)
	@i
	D=M
	@n1
	D=D-M
	@STOP
	D;JGE // if i >= n1 goto STOP (if i-n >= 0)

	@multi
	D=M
	@n0
	D=D+M
	@multi
	M=D // multi = multi + n0

	@i
	M=M+1 // i= i + 1 (incremento do contador)

	@LOOP
	0;JMP // goto LOOP

// Atribuicao de multi a R2
(STOP)
	@multi
	D=M
	@R2
	M=D // R2 = multi

// Loop final
(END)
	@END
	0;JMP