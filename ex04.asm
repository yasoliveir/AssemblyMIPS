.data 
   menor: .asciiz "Valor do lado menor: " 
   maior: .asciiz "Valor do lado maior: "
   altura: .asciiz "Valor da altura: "
   area: .asciiz "Area do trapézio: "

.text
.globl main
main:
  li $v0, 4
  la $a0, menor
  syscall
  li $v0, 5 
  syscall
  move $t0, $v0 # $t0 = lado menor
  
  li $v0, 4
  la $a0, maior
  syscall
  li $v0, 5 
  syscall
  move $t1, $v0 # $t1 = lado menor
  
  li $v0, 4
  la $a0, altura
  syscall
  li $v0, 5 
  syscall
  move $t2, $v0 # $t2 = altura
  
  add $t3, $t0, $t1 # $t3 = soma lado menor + maior
  mul $t4, $t2, $t3 # $t4 = mult altura * soma dos lados
  div $t4, $t4, 2 # divide a mult / 2
  
  li $v0, 4
  la $a0, area 
  syscall
  li $v0, 1
  move $a0, $t4
  syscall
  
  li $v0, 10
  syscall
  