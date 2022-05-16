#Laboratory Exercise 7 Home Assignment 5
.data
message_max: .asciiz "Largest: "
message_index: .asciiz ", "
message_min: .asciiz "Smallest: "
enter: .asciiz "\n"
.text
load_data: 	li $s0, 2 #MSSV: 20194508
		li $s1, 0
		li $s2, 1
		li $s3, -9
		li $s4, 4
		li $s5, -5
		li $s6, 0
		li $s7, 8
		
		li $t3, 8 # bien dem nguoc lai vi push vao stack thu tu bi dao nguoc
		li $t4, 8 # bien dem nguoc lai vi push vao stack thu tu bi dao nguoc
main: 	jal push
	nop
	jal max
	nop
	jal min 
	nop
print_max:	li $v0, 4 # code for print to console
		la $a0, message_max
		syscall
		li $v0, 1
		add $a0, $zero, $a1 # $a1 = max
		syscall
		li $v0, 4
		la $a0, message_index
		syscall
		li $v0, 1
		add $a0, $zero, $t1 # $t1 -> register containing the max value
		syscall
		li $v0, 4
		la $a0, enter
		syscall
print_min:	li $v0, 4
		la $a0, message_min
		syscall
		li $v0, 1
		add $a0, $zero, $a2 # $t3 = min
		syscall
		li $v0, 4
		la $a0, message_index
		syscall
		li $v0, 1
		add $a0, $0, $t2  # $t4 -> register containing the min value
		syscall
exit: 	li $v0, 10
	syscall
end_main:
#-----------------------------------
push: 	addi $sp, $sp, -32 # stack chua 8 ptu
	sw $s0, 28($sp)
	sw $s1, 24($sp)
	sw $s2, 20($sp)
	sw $s3, 16($sp)
	sw $s4, 12($sp)
	sw $s5, 8($sp)
	sw $s6, 4($sp)
	sw $s7, 0($sp)
push_end:	jr $ra
#----------------------------------------------
max: 	lw $v1, 0($sp)	# pop phan tu dau tien vao $v1
	addi $sp, $sp, 4
	addi $t3, $t3,-1  # index -1, giam sau moi lan lap
	
	beq $t3, 0, max_end # kiem tra xem da den phan tu cuoi hay chua
	slt $t0, $v1, $a1 # $a1 luu gia tri max hien tai
	bne $t0, $zero, max
	add $t1, $zero, $t3 #luu index cua max
	add $a1, $zero, $v1 #luu max vao tu $v1 sang $t5
	j max
max_end:	add $sp, $sp, -32 #adjust stack pointer to the top of stack
		jr $ra
#----------------------------------------------
min: 	lw $v1, 0($sp)	#pop tu stack
	addi $sp, $sp, 4
	addi $t4, $t4, -1 # $t4 -> index = 1, tang sau moi lan lap

	beq $t4, 0, min_end # khi stack rong -> min_end
	slt $t0, $a2, $v1 # so sanh $1 dang chua min hien tai voi $t0 la ptu hien tai
	bne $t0, $zero, min 
	add $t2, $zero, $t4 # luu index cua min
	add $a2, $zero, $v1 # luu gia tri min
	j min
min_end:	add $sp, $sp, -32 #adjust stack pointer to the top of stack 
		jr $ra
