.data 
	msg1: .asciiz "Digite o  valor: "
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
	move $t1, $v0
  
	div $t0, $t0, 2
	mfhi $t2
	beq $t2, $0, calcula_par

	addi $t1, $t1, 8
	j mostrar

	calcula_par: 
	addi $t1, $t1, 5
	j mostrar 


	mostrar:
	li $v0, 4 
	la $a0, msg2 
	syscall

	li $v0, 1
	move $a0, $t1
	syscall 

	li $v0, 10
	syscall