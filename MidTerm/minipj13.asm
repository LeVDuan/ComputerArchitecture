.data

message_input: .asciiz "Nhap so tren ve: "

error_input: .asciiz "\nLoi dau vao!\nSo qua lon/ so chu so la so le/ so am!"

lucky: .asciiz "Lucky"

not_lucky: .asciiz "Not lucky"	

.text

main: 	li $v0, 4

	la $a0, message_input

	syscall

	

	li $v0, 5 # read integer

	syscall 

	

	add $s0, $v0, $0 # stick number n -> s0



	jal check_input #check_input($s0) -> return so chu so luu o $k0

	nop

	

	jal is_lucky # is_lucky(n) -> kiem tra xem n lucky hay ko va in ket qua

	nop

end_main: 	li $v0, 10

		syscall

		

check_input: 	addi $t1, $0, 10  # $t1 = 10

		add  $s1, $s0, $0 # $s1 = $s0 = n

		add  $k0, $0, $0  # $k0 = 0

				

loop:		beq $s1, 0, end_check # if ($s1) == 10 -> dung 

				      # sau khi chia dan cho 10

		nop

		divu $s1, $t1 	# chia n cho 10 lay thuong va so du o lo, hi

		mfhi $t2	# so du

		mflo $t3	# thuong

		add $s1, $t3, $0	# n = n / 10



push:		addi $sp, $sp, -4 # danh stack cho 1 muc vi stack follow nguoc

		sw $t2, 0($sp)	  # luu so du hay cac chu cai cua n vao stack

		add $k0, $k0, 1   # $k0++

		j loop

			

end_check: 	addi $t4, $0, 2	# gan t4 = 2

		divu $k0, $t4	# chi k0 cho 2 de kiem tra xem n co so chu so chan hay ko

		mfhi $t4	# lay so du cua phep chia

		mflo $k1	# thuong la 1/2 so chu so cua n

		bne $t4, 0, error	# neu ko chia het -> bao loi dau vao

		jr $ra			# nguoc lai -> tiep tuc

		

error:	li $v0, 4

	la $a0, error_input

	syscall

	j end_main

	

print_not_lucky:

	li $v0, 4

	la $a0, not_lucky

	syscall

	j end_main

##########################################

is_lucky: addi $t1, $0, 0	# i = 0

	  addi $t2, $0, 0	# j = 0

	  add $s2, $0, $0	# sum cua nua dau

	  add $s3, $0, $0	# sum cua nua sau

loop1:	beq	$t1, $k1, loop2	# k1-> (so chu so cua n) /2

	

pop1:	lw 	$t3, 0($sp) 	#pop chu so ra khoi stack

	addi 	$sp, $sp, 4 	# xoa 1 muc ra khoi stack

	

	add 	$s2, $s2, $t3	# sum += chu so vua pop ra

	addi 	$t1, $t1, 1

	j loop1

loop2:	beq	$t2, $k1, check_lucky

	

pop2:	lw 	$t3, 0($sp) 	#pop chu so ra khoi stack

	addi 	$sp, $sp, 4 	# xoa 1 muc ra khoi stack

	

	add 	$s3, $s3, $t3	# sum += chu so vua pop ra

	addi 	$t2, $t2, 1

	j loop2

check_lucky: 	bne $s2, $s3, print_not_lucky

		li $v0, 4

		la $a0, lucky

		syscall

end_is_lucky:	jr $ra
