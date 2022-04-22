#Laboratory Exercise 3, Home Assignment 4 c 
.text 
	addi	$s1, $0, 4508	# MSSV 20194508 -> i 
	addi	$s2, $0, 2019	# -> j 
	add 	$s3, $s1, $s2	# i + j 
start: 
	sle	$t0,$s3,$0 	# i+j <= 0-> $t0 = 1 else $t0 = 0 
	bne	$t0,$zero,else 	# branch to else if j<i 
	addi	$t1,$t1,1	# then part: x=x+1 
	addi	$t3,$zero,1	# z=1 
	j	endif		# endif 
else: 	
	addi	$t2,$t2,-1	# begin else part: y=y-1 
	add	$t3,$t3,$t3	# z=2*z 
endif: 