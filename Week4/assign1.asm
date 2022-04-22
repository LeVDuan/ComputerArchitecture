#Laboratory Assignment 1
.text
	li	$s1, -2019
	li	$s2, 4508
start:
	li	$t0, 0		# default status
	addu	$s3, $s1, $s2	# s3 = s1 + s2
	xor	$t1, $s1, $s2	# test if $s1 and $s2 have the same sign

	bltz	$t1,EXIT	# If not, exit
	slt	$t2,$s3,$s1	
	bltz	$s1,NEGATIVE	# test if $s1 and $s2 is negative?
	beq	$t2,$0,EXIT	# s1 and s2 are positive

		# if $s3 > $s1 then the result is overflow
	j	OVERFLOW
NEGATIVE:
	bne	$t2,$0,EXIT
		# if $s3 < $s1 the the result is not overflow
OVERFLOW:
	li $t0,1		# the result is overflow
EXIT: