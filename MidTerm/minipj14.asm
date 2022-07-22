.data

    s1: .space 100

    s2: .space 100

    message1:  .asciiz "Enter string: "

    mess_result:  .asciiz "Common characters of Strings: "

.text

main:	la	$t1, s1

   	jal	get_input 	#get_input($t1) -> return $t2 (chua dia chi chuoi vua nhap)

   	add 	$s1, $t2, $0	# dia chi chuoi s1 -> $s1



	la	$t1, s2

   	jal	get_input 	# get_input($t1) -> return $t2

   	add 	$s2, $t2, $0	# dia chi chuoi s2 -> $s2

   	

   	add	$a0, $s1, $0	# gan dia chi s1 vao $a0 de dung ham

   	add	$a1, $s2,$0	# gan dia chi s2 vao $a1 de dung ham

   	jal 	common_char	#common_char($a0, $a1) tim cac ki tu chung va luu vao stack 

   				#a0 -> string1, a1 -> string2 

   				#-> return $k1 so phan tu, stack $sp chua các kí tu chung

	jal	count_common	#count_common($a0, $a1, $k1) dem so lan lap cua cac ki tu chung

				# $sp con tro stack, k1 -> so phan tu cua stack

				# return  ket qua tai $s7 

end_main:	li $v0, 10      # end program

		syscall

###########################################

get_input: 	la $a0, message1    # Load and print string asking for string

    	li $v0, 4

    	syscall



   	li $v0, 8       # take in input

    	add $a0, $t1, $0  # load byte space into address

    	li $a1, 100      # allot the byte space for string



    	move $t2, $a0   # luu dia chi string vua nhap vao $t2

    	syscall

	jr $ra

##########################################

common_char: 	li $t0, 0	# i

		li $k1, 0	# luu so common char 

loop1:		add $t2, $a0, $t0	# t2 = a0 + i = address string1[i]

		lb $t3, 0($t2)		# t3 = string1[i]

		beq $t3, 10, end_common_char #  neu la ki tu '\0' = 10 thi dung 

		nop

		li $t1, 0	# j

loop2:		add $t4, $a1, $t1	# t4 = a1 + j = address string2[j]

		lb $t5, 0($t4)		# t5 = string2[j]

		beq $t5, 10, countinue_loop1	# neu la ki tu '\0' = 10 thi dung 

		nop

		beq $t3, $t5, push_to_stack	# neu string1[i] == string2[j]

		nop

		addi $t1,$t1,1		# j++

		j loop2



countinue_loop1:	addi $t0, $t0, 1	# i++

			j loop1

end_common_char: 	jr $ra



push_to_stack:	li $t6, 0	# k = 0

check_loop:	beq $t6, $k1, push # kiem tra su ton tai cua String1[i] trong stack

		nop		   # neu da ton tai -> thoat vong lap nay

		sll $t7, $t6, 2  # t7 = t6 * 4

		add $t7, $t7, $sp # t7 = sp + k*4 = address phan tu thu k cua stack

		lb $t8, 0($t7)	# lay phan tu thu k cua stack

		beq $t8, $t3, countinue_loop1 # neu (i*4)(sp) == string1[i] -> da ton tai -> ko push

		nop

		addi $t6, $t6, 1 #k++

		j check_loop

push: 		addi $sp, $sp, -4

		sw   $t3, 0($sp)

		addi $k1, $k1, 1

		j countinue_loop1

#############################################	

count_common:	li $t1, 0	 # i

		add $t9, $ra, $0 # luu dia chi tra ve tai $t9

loop_stack:	beq $t1, $k1, print_result # duyet cac ptu trong stack de dem so lan xuat hien trong chuoi

		nop

		sll $t2, $t1, 2  # t2 = t1 * 4 = 4i

		add $t2, $t2, $sp # t2 = sp + i*4 = address phan tu thu i cua stack

		lb $s3, 0($t2)	# lay ptu thu i cua stack

		

		add $a2, $s1, $0 # gan dia chi s1 vao $a2 de dung ham

		jal count_in_string	#count_in_string($s3, $a2) dem so ki tu s4 trong string a2		

					# return ket qua ra $k0

		add $s5, $k0, $0 	# gan count cho string s1 vao s5

		

		add $a2, $s2, $0

		jal count_in_string

		add $s6, $k0, $0 	# gan count cho string s2 vao s6

result:		slt  $t3, $s5, $s6

		beqz $t3, update

		add $s7, $s7, $s5

countinue_loop:	addi $t1, $t1, 1 #i++

		j loop_stack

print_result: 	li, $v0, 4

		la $a0, mess_result

		syscall

		

		li $v0, 1

		add $a0, $s7, $0

		syscall

		

		add $ra, $t9, $0 # khoi phuc dia chi tra ve

		jr $ra

update:		add $s7, $s7, $s6

		j countinue_loop

###########################

count_in_string:	li $t3, 0 # i

			li $k0, 0 # thanh ghi chua ket qua tra ve

loop_string:		add $t4, $a2, $t3	# t4 = a2 + i = address string[i]

			lb $t5, 0($t4)		# t5 = string[i]

			beq $t5, 10, end_count_in_string # neu ki tu la '\0' thi dung

			bne $s3, $t5, countinue_count # kiem tra su xem ki tu nay co phai la s3 lay tu stack ko 

			addi $k0, $k0,1 # count++

countinue_count:	addi $t3, $t3,1 # i++

			j loop_string

end_count_in_string: 	jr $ra