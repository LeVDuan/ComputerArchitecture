#Laboratory Assignment 4
.text
	li $s0, 0x8fffffff
	li $s1, 0x80194508
start:
	li $t0, 0 # default status
	add $s3, $s1, $s2 # s3 = s1 + s2
	xor $t1, $s3, $s2# test if $s3 and $s2 have the same sign
	bltz $t1,OVERFLOW # If not, OVERFLOW
OVERFLOW:
	li $t0,1 # the result is overflow