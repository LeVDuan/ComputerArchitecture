#Laboratory Assignment 2
.text
li $s0,0x20194508 # test value MSSV
andi $t0,$s0,0xff000000 # extract MSB
andi $t1,$s0,0xffffff00 # clear LSB
ori $t2,$s0,0x00000040 # OR with bit 7 = 1
andi $t3,$s0,0x0 # clear s0 = 0