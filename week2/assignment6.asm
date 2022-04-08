# Laboratory Exercise 2, Assignment 6
.data			# DECLARE VARIABLES
X:	.word	5	# Variable X, word type, init value = 5
Y:	.word	-1	# Variable Y, word type, init value = -1
Z:	.word		# Variable Z, word type, no init value
.text
	# Load X, Y to regitsters
	la	$t8, X		# Get the address of X in Data segment
	la	$t9, Y		# Get the address of Y in Data segment
	lw	$t1, 0($t8)	# $t1 = X
	lw	$t2, 0($t9)	# $t2 = Y
	
	# Caculate the expression Z = 2X + Y with regiters only
	add	$s0, $t1, $t1	# $s0 = 2X
	add	$s0, $s0, $t2	# $s0 = 2X + Y
	
	# Store result from regiters to variable Z
	la	$t7, Z		# Get the address of Z in Data segment
	sw	$s0, 0($t7)	# Z = $s0 = 2X + Y