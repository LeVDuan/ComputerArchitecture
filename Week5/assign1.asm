#Laboratory Exercise 5, Home Assignment 1
.data
test: .asciiz "LeVDuan 20194508"
.text
	li $v0, 4
	la $a0, test
	syscall