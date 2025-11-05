// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Declaração de variáveis

@8192
D=A
@n
M=D // n = 8192 (Número de palavras de 16-bit na SCREEN, tela)

(LOOP_KBD)
    @SCREEN
    D=A
    @addr
    M=D // addr = 16384 (Endereço inicial do SCREEN)

    @i
    M=0 // i = 0 (contador de iteração)

    // Checa o teclado
    @KBD
    D=M
    @FUNDO_BRANCO
    D;JEQ // if RAM[KBD] == 0, goto FUNDO_BRANCO

    // Se KBD != 0, cai aqui (FUNDO_PRETO)

// Loop de atualização de todos os pixels para preto (while i < n)
(FUNDO_PRETO)
    @i
    D=M
    @n
    D=M-D
    @LOOP_KBD
    D;JEQ // if i == n (terminou de pintar), goto LOOP_KBD

    @addr
    A=M
    M=-1 // RAM[addr]=1111111111111111 (preto)
    
    @addr
    M=M+1 // addr = addr + 1
    
    @i
    M=M+1 // i = i + 1 (incremento de i)

    @FUNDO_PRETO
    0;JMP

// Loop de atualização de todos os pixels para branco (while i < n)
(FUNDO_BRANCO)
    @i
    D=M
    @n
    D=M-D
    @LOOP_KBD
    D;JEQ // if i == n (terminou de pintar), goto LOOP_KBD

    @addr
    A=M
    M=0 // RAM[addr]=0000000000000000 (branco)
    
    @addr
    M=M+1 // addr = addr + 1
    
    @i
    M=M+1 // i = i + 1 (incremento de i)

    @FUNDO_BRANCO
    0;JMP