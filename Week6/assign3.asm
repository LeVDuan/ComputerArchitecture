#Laboratory Exercise 6, Home Assignment 3
.data
A:	.word	2, 0 , 1, 9, 4, 5, 0, 8
.text
main: 	la $a0,A 	#$a0 = Address(A[0])
	add $a1, $0, 8	# size of A = n
	j BubbleSort 	#sort 
end_main:

BubbleSort:	add 	$t0,$0,$0	# i = 0
loop1:	addi	$t0,$t0,1	# i++
	slt	$t5, $t0, $a1	# if i < n set $t5 = 1
	beq	$t5, $zero, endloop1
	
	add	$t1, $0,$a1	# j = n
loop2:	slt	$t6, $t1, $t0	# set $t6 = 0 if j <= i
	bne	$t6, $zero, loop1 # j <= i -> loop1

	add 	$t1,$t1,-1	# j--
	mul	$t4,$t1,4	# $t4 = 4j
	addi 	$t3,$t4,-4	# $t3 = 4j - 4
	add 	$t7,$t4,$a0	# $t7 = 4j + $a0 = address A[j]
	add 	$t8,$t3,$a0	# $t8 = 4j - 4 + $a0 = address A[j-1]
	lw	$t5,0($t7)	# load word A[j] to $t5
	lw	$t6,0($t8)	# load word A[j-1] to $t6
	
	slt 	$t9,$t6,$t5	# if A[j-1] < A[j] set $t9 = 1
	bne 	$t9,$zero,loop2 # if A[j-1] < A[j] -> countinue loop
	
	# $t9 = 0 or if A[j-1] > A[j]
	# swap A[j-1] and A[j]
	sw	$t5,0($t8)	
	sw	$t6,0($t7)
	j	loop2
endloop1:	li $v0, 10 #exit 
		syscall