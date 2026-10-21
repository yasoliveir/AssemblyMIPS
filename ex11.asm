.data
        msg: .asciiz "Digite um numero (negativo para sair): "
        msg1: .asciiz "\nQuantidade de 0 a 25: "
        msg2: .asciiz "\nQuantidade de 26 a 50: "
        msg3: .asciiz "\nQuantidade de 51 a 75: "
        msg4: .asciiz "\nQuantidade de 76 a 100: "

.text
.globl main
main:
        repetir:
        li $v0, 4
        la $a0, msg
        syscall

        li $v0, 5
        syscall
        move $t0, $v0

        bltz $t0, mostrar
        bgt $t0, 100, repetir

        ble $t0, 25, faixa1
        ble $t0, 50, faixa2
        ble $t0, 75, faixa3
        j faixa4

        faixa1:
        addi $t1, $t1, 1
        j repetir

        faixa2:
        addi $t2, $t2, 1
        j repetir

        faixa3:
        addi $t3, $t3, 1
        j repetir

        faixa4:
        addi $t4, $t4, 1
        j repetir

        mostrar:
        li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 1
        move $a0, $t1
        syscall

        li $v0, 4
        la $a0, msg2
        syscall

        li $v0, 1
        move $a0, $t2
        syscall

        li $v0, 4
        la $a0, msg3
        syscall

        li $v0, 1
        move $a0, $t3
        syscall

        li $v0, 4
        la $a0, msg4
        syscall

        li $v0, 1
        move $a0, $t4
        syscall

        li $v0, 10
        syscall