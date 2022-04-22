#Laboratory Assignment 3 
.text 
abs: 
	li	$s0, -38 
	bltz	$s0, NEGATIVE 
	nop 
	add	$t0,$0,$s0 
	j	EXIT 
NEGATIVE: 
	nor	$t0,$s0,$0 # t0 = not(s0) 
	add	$t0,$t0,1 
EXIT: 
move: 
	li	$s0,3 
	li	$s1,8 
	add	$s0,$0,$s1 # move s1 to s0 -> s0 = 8 
not: 
	li	$s0,4508 
	nor	$t0,$s0,$0 # t0 = not(s0) 
ble: 
	li	$s1, -4508 
	li	$s2, 308 
	sle	$t0, $t1, $s2 
	beq	$t0, 1, CASE 
	nop 
	addi	$s2,$0,2 
	j EXIT 
CASE: 
	addi	$s1, $s1, 2 