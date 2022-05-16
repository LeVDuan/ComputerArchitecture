#Laboratory Exercise 7 Home Assignment 2
.text
main: 	li $a0,5 #load test input (20194)508
	li $a1,0
	li $a2,8
	jal max #call max procedure
	nop
	li $v0,10 #terminate
	syscall
endmain:
#---------------------------------------------------------------------
#Procedure max: find the largest of three integers
#param[in] $a0 integers
#param[in] $a1 integers
#param[in] $a2 integers
#return $v0 the largest value
#---------------------------------------------------------------------
max: 	add $v0,$a0,$zero #copy (a0) in v0; largest so far
	sub $t0,$a1,$v0 #compute t0 = (a1)-(v0) = (a1) - (a0)
	bltz $t0,okay #if (a1)-(a0)<0 then no change
	nop
	add $v0,$a1,$zero #else (a1) is largest thus far
okay: 	sub $t0,$a2,$v0 #compute (a2)-(v0)
	bltz $t0,done #if (a2)-(v0)<0 then no change
	nop
	add $v0,$a2,$zero #else (a2) is largest overall
done: 	jr $ra #return to calling program