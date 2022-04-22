#Laboratory 3, Home Assigment 2 

.data 
	A:	.word  3, 8, 2019, 4508 
.text 
	la	$s2, A 	 
	addi	$s1, $0, -1	# khoi tao i = -1 
	addi	$s3, $0, 4	# khoi tao n = 4 -> so ptu cua mang A 
	addi	$s4, $0, 1	# khoi tao step = 1 
	addi	$s5, $0, 0	# khoi tao sum = 0;  

loop: 	
	add	$s1,$s1,$s4	# i=i+step 
	add	$t1,$s1,$s1	# t1 = 2*s1 
	add	$t1,$t1,$t1	# t1 = 2*t1 =4*s1 
	add	$t1,$t1,$s2	# t1 store the address of A[i] 
	lw	$t0,0($t1)	# load value of A[i] in $t0 
	add	$s5,$s5,$t0	# sum= sum+A[i] 
	bne	$s1,$s3,loop	# if i != n, goto loop