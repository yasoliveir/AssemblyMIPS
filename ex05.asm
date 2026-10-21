.data
       cat1: .asciiz "Cateto 1 (Adjacente): "
       cat2: .asciiz "Cateto 2 (Oposto): "
       hip: .asciiz "Valor da Hipotenusa: "

.text     
.globl main
main:
    li $v0, 4
    la $a0, cat1
    syscall
    li $v0, 6 #o 5 serve para o usuario digitar numero inteiro, o 6 é pra digitar numero decimal
    syscall
    mov.s  $f1, $f0 #copia o conteudo de $f1 para $f4 sem alterar o conteudo. mov.s é usado para decimais de precisao simples
    
    
    li $v0, 4
    la $a0, cat2
    syscall
    li $v0, 6
    syscall
    mov.s  $f2, $f0
    
    mul.s $f1, $f1, $f1
    mul.s $f2, $f2, $f2
    add.s $f3, $f1, $f2
    sqrt.s $f4, $f3 #calculo de raiz quad
    
    li $v0, 4
    la $a0, hip
    syscall
    
   li $v0, 2 #imprimir numero flutuante
   mov.s $f12, $f4
   syscall
   
   li $v0, 10
   syscall