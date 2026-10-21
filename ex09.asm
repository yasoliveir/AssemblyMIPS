.data 
      msg1: .asciiz "Primeiro número: "
      msg2: .asciiz "Segundo número: "
      msg3: .asciiz "Resultado: "

.text 
.globl main
main: 
      li $v0, 4
      la $a0, msg1
      syscall 

      li $v0, 5
      syscall
      move $t0, $v0

      repetir:
      li $v0, 4
      la $a0, msg2
      syscall 

      li $v0, 5
      syscall
      move $t1, $v0
      beq $t1, $0, repetir

      div $t0, $t1
      mflo $t2

      li $v0, 4
      la $a0, msg3
      syscall 

      li $v0, 1
      move $a0, $t2
      syscall
      
      li $v0, 10
      syscall
       