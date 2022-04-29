#Laboratory Exercise 5, Assignment 5
.data
Message: .asciiz "Nhap tung ki tu"
string: .space 20
.text
init:	add $s0, $zero, $zero		# i = 0
	la $s1, string			# load address of string to $s1
read_str:
read_char:	li $v0, 12			# 12 -> read character
		syscall
		nop
check_char:	beq $v0, 10, print_revert_str	# gap ki tu enter LF = 10 
						# -> ket thuc string -> print
		add $t1, $s0, $s1		# lay dia chi cua string[i]
		sb $v0, 0($t1)			# luu $v0 vao string[i]
		addi $s0, $s0, 1		# i += 1
		slti $t0, $s0, 20		# i < 20? 1 : 0
		beq $t0, $zero, print_revert_str# neu khong thi ket thuc viec doc
		j read_char
		
print_revert_str:	slt $t0, $s0, $zero		# neu i < 0 ? 1 : 0
			bne $t0, $zero, exit		# if true ->string empty-> exit
			add $t1, $s0, $s1		# lay dia chi string[i]
			lb $t2, 0($t1)			# load vao $t2 string[i]
			li $v0, 11			# print character
			add $a0, $zero, $t2		# $a0 = string[i]
			syscall
			addi $s0, $s0, -1		# s0 -= 1
			j print_revert_str
exit: