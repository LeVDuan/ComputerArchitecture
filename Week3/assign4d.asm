#Laboratory Exercise 3, Home Assignment 4 d 
.text  
	addi	$s1, $0, 4508	# MSSV 20194508 -> i  
	addi	$s2, $0, 2019	# -> j  
	li	$s3, 3		# m = 3 
	li	$s4, 8		# n = 8 
start:  
	add 	$s5,$s3,$s4	# m + n  
	add	$s6,$s1,$s2	# i + j 
	slt 	$t0,$s5,$s6 	# m + n < i+j -> $t0 = 1 else $t0 = 0  
	bne	$t0,$zero,else 	# branch to else if j<i  
	addi	$t1,$t1,1	# then part: x=x+1  
	addi	$t3,$zero,1	# z=1  
	j	endif		# endif  
else: 	
	addi	$t2,$t2,-1	# begin else part: y=y-1  
	add	$t3,$t3,$t3	# z=2*z  
endif: 