.data
	h_normal: .asciiz "Horas Normais Trabalhadas: "
	h_extra: .asciiz "Horas Extras Trabalhadas: "
	desc: .asciiz "Valor do Desconto: R$"
	sal_bruto: .asciiz "\nSalário Bruto: R$"
	sal_liq: .asciiz "\nSalário Líquido: R$"
	
	
.text
.globl main
main:
	li $v0, 4
	la $a0, h_normal
	syscall
	li $v0, 5
	syscall
	move $t0, $v0 # $t0 = horas normais
	
	li $v0, 4
	la $a0, h_extra
	syscall
	li $v0, 5
	syscall
	move $t1, $v0 # $t1 = horas extras
	
	li $v0, 4
	la $a0, desc
	syscall
	li $v0, 5
	syscall
	move $t2, $v0 # $t2 = desconto
	
	mul $t3, $t0, 10 #calculo valor hora normal trabalhada 
	mul $t4, $t1, 15 #calculo valor hora extra trabalhada
	add $t5, $t3, $t4 #Soma das horas normais + horas extras trabalhadas
	sub $t6, $t5, $t2 #Subtração das horas recebidas - desconto 
	
	li $v0, 4
	la $a0, sal_bruto
	syscall
	li $v0, 1
	move $a0, $t5
	syscall
	
	li $v0, 4
	la $a0, sal_liq
	syscall
	li $v0, 1
	move $a0, $t6
	syscall
	
	li $v0, 10
	syscall