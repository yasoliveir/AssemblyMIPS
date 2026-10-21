.data 
	a1: .asciiz "Digite o valor de A: "
	b1: .asciiz "Digite o valor de B: "
	c1: .asciiz "O resultado de C é: "
      
.text
.globl main
main:
	li $v0, 4
	la $a0, a1
	syscall
	li $v0, 5 
	syscall
	move $t0, $v0
    
	li $v0,  4
	la $a0, b1
	syscall
	li $v0, 5 
	syscall
	move $t1, $v0
    
	beq $t0, $t1, iguais 
    	mul $t2, $t1, $t0
	j mostrar  
         
	iguais:
	add $t2, $t1, $t0   
     
	mostrar:
	li  $v0, 4
	la $a0, c1
	syscall        
    
	li  $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 10
	syscall