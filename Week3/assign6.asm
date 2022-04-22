#Assignment 6

.data
array:	.word -3, 8, -21, 194508, 2022, -2001

.text 
	li $s3, 1 # step  = 1
	li $s1, -1 # i = -1
	la $s2, array # load address of array to s2
	lw $t4, 0($s2) # t4 = array[0]
	abs $s4, $t4	   # s4 = max = |array[0]|
loop:
	add $s1, $s1, $s3 # i = i + step
	add $t1, $s1, $s1 # t1 = 2*s1
	add $t1, $t1, $t1 # t1 = 2*t1 = 4*s1
	
	add $t1, $t1, $s2 # t1 = t1 + s2 -> t1 store address of array[i]
	lw  $t4, 0($s1)   # load value of element array[i] to t0
	abs $t2, $t0	  # load |array[i]| to t2
start:	slt $t3, $s4, $t2 # max < |array[i]|
	beq $t3, $0, endif # if max >= |array[i]| -> endif
	add $s4, $0, $t2 # max = |array[i]|
endif:	bne $s1, 6, loop # end loop