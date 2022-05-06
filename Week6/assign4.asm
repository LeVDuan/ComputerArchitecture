#Laboratory Exercise 6, Home Assignment 4
.data
A:	.word 	2, 0, 1, 9, 4, 5, 0, 8
.text
main:	la $t0, A
	li $7, 7 # size of A - 1
	li $2, 1 # i = 1
	j InsertionSort 	#sort 
end_main:
# Use $2 to hold firstUnsortedIndex
# Use $3 to hold testIndex
# Use $4 to hold elementToInsert
# Use $5 to hold value of numbers[ .. ]
# Use $6 to calculate the address of numbers[ ... ] in
# Use $7 to hold the value of (length-1)
# Use $8 to hold the base/starting address of the numbers array
InsertionSort:		
forLoop: 	bgt $2, $7, endFor
		sub $3, $2, 1
		mul $6, $2, 4 	# address of A[i]= base addr of numbers + i*(element size)
		add $6, $8, $6
		lw $4, 0($6)
while: 	blt $3, 0, endWhile
	mul $6, $3, 4 # address of numbers[i]= base addr of numbers + i*(element size)
	add $6, $8, $6
	lw $5, 0($6)
	ble $5, $4, endWhile
	sw $5, 4($6)
	sub $3, $3, 1
	j while
endWhile:	mul $6, $3, 4 # address of numbers[i]= base addr of numbers + i*(element size)
		add $6, $8, $6
		sw $4, 4($6)
		addi $2, $2, 1
		j forLoop
endFor:	li $v0, 10 # system call to exit
	syscall