.data
      msg1: .asciiz "Digite um número: "
      msg2: .asciiz "Resultado: "

.text 
.globl main
main: 
      li $v0, 4
      la $a0, msg1 
      syscall 

      li $v0, 5
      syscall 
      move $t0, $v0 

      bgtz $t0, positivo
      bltz $t0, negativo 
      j mostrar  

      positivo:
      mul $t0, $t0, 2
      j mostrar

      negativo: 
      mul $t0, $t0, 3

      mostrar:
      li $v0, 4
      la $a0, msg2
      syscall 

      li $v0, 1
      move $a0, $t0 
      syscall 

      li $v0, 10
      syscall