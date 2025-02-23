.macro print_integer($reg)
	li $v0, 1
	move $a0, $reg
	syscall
.end_macro

.macro print_string($reg)
	li $v0, 4
	move $a0, $reg
	syscall
.end_macro

.macro exit	                
	li $v0, 10 	
	syscall			
.end_macro	

.macro print_hi_lo
	.data
	prompt1: .asciiz "Enter an integer: "
	prompt2: .asciiz "Enter another integer: "
	newline: .asciiz "\n"
	value1: .asciiz "Value in hi is: "
	value2: .asciiz "Value in lo is: "

	.text
	li $v0, 4
	la $a0, prompt1
	syscall
	li $v0, 5
	syscall
	mthi $v0
	
	li $v0, 4
	la $a0, prompt2
	syscall
	li $v0, 5
	syscall
	mtlo $v0
	
	mfhi $t0
	mflo $t1
	la $t2, value1
	la $t3, value2
	la $t4, newline
	print_string($t4)
	print_string($t2)
	print_integer($t0)
	print_string($t4)
	print_string($t3)
	print_integer($t1)
	print_string($t4)
	print_string($t4)
	mtlo $t0
	mthi $t1
	mfhi $t0
	mflo $t1
	la $t2, value1
	la $t3, value2
	la $t4, newline
	
	print_string($t2)
	print_integer($t0)
	print_string($t4)
	print_string($t3)
	print_integer($t1)
	exit
.end_macro
	
