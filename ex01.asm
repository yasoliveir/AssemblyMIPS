.data
	largura: .asciiz "Informe a Largura: "
	comp: .asciiz "Informe o Comprimento: "
	area: .asciiz "Área do Terreno: "
.text
.globl main
main:
	li $v0, 4 #Load Immediate / cod 4: imprimir uma string
	la $a0, largura #Load address
	syscall
	
	li $v0, 5 #cod 5: Ler o valor digitado pelo usuário
	syscall
	move $t0, $v0 #copia o valor de $v0 para o registrador temporário $t0
	
	li $v0, 4 
	la $a0, comp
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	mul $t2, $t0, $t1 #A multiplicação de $t0 por $t1 será armazenada no registrador $t2
	
	li $v0, 4 #imprimir a string area
	la $a0, area
	syscall
	
	li $v0, 1 #imprimir o resultado de um número inteiro
	move $a0, $t2 #copiar o resultado de $t2 no registrador $a0 para ser printado
	syscall
	
	li $v0, 10 #codigo de finalização
	syscall
	
	
	