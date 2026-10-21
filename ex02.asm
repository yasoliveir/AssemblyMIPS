.data
	p: .asciiz "Quantidade Camisetas P: "
	m: .asciiz "Quantidade Camisetas M: "
	g: .asciiz "Quantidade Camisetas G: "
	resultado: .asciiz "Valor Arrecadado: R$"
.text
.globl main
main:
	li $v0, 4 #imprimir uma string
	la $a0, p
	syscall
	
	li $v0, 5 #Ler o valor digitado pelo usuário
	syscall
	move $t0, $v0 #copia o valor de $v0 para o registrador temporário $t0
	
	li $v0, 4
	la $a0, m
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 4
	la $a0, g
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	mul $t3, $t0, 10 #multiplicando o valor de $t0 por 10 (qtd de camiseta p digitada pelo usuário, por 10 que é o valor) e armazenar o resultado em $t3
	mul $t4, $t1, 12
	mul $t5, $t2, 15
	
	add $t6, $t3, $t4
	add $t6, $t6, $t5
	
	li $v0, 4
	la $a0, resultado
	syscall
	
	li $v0, 1
	move $a0, $t6
	syscall
	
	li $v0, 10
	syscall