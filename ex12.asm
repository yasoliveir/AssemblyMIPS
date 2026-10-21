.data
        msg1: .asciiz "Digite a altura em centimetros: "
        msg2: .asciiz "\nMenor altura: "
        msg3: .asciiz "\nMaior altura: "

.text
.globl main
main:
        li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 5
        syscall

        move $t0, $v0
        move $t1, $v0
        li $t2, 14

        repetir:
        beq $t2, $zero, mostrar

        li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 5
        syscall
        move $t3, $v0

        slt $t4, $t3, $t0
        beq $t4, $zero, verificarMaior
        move $t0, $t3

        verificarMaior:
        slt $t4, $t1, $t3
        beq $t4, $zero, proximo
        move $t1, $t3

        proximo:
        addi $t2, $t2, -1
        j repetir

        mostrar:
        li $v0, 4
        la $a0, msg2
        syscall
        li $v0, 1
        move $a0, $t0
        syscall

        li $v0, 4
        la $a0, msg3
        syscall
        li $v0, 1
        move $a0, $t1
        syscall

        li $v0, 10
        syscall