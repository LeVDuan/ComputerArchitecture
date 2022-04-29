#Laboratory Exercise 5, Home Assignment 2
.data
Mess1: .asciiz "The sum of " 
Mess2: .asciiz " and "
Mess3: .asciiz " is "
.text
	li $s1, 2019  # 4 so dau MSSV
	li $s2, 4508  # 4 so sau MSSV
	
	li $v0, 4
	la $a0, Mess1
	syscall
	
	li $v0, 1
	add $a0,$zero, $s1  # 2019
	syscall
	
	li $v0, 4
	la $a0, Mess2
	syscall
	
	li $v0, 1
	add $a0, $zero, $s2  # 4508
	syscall
	
	li $v0, 4
	la $a0, Mess3
	syscall
	
	li $v0, 1
	add $a0, $s1, $s2
	syscall