.macro read_int($reg)
	.data
		prompt: .asciiz "Enter an integer\n"
	.text
		li $v0, 4
		la $a0, prompt
		syscall
		li $v0, 5
		syscall
		move $reg, $v0
.end_macro

.macro print_reg_int($reg)
	li $v0, 1
	move $a0, $reg
	syscall
.end_macro

.macro exit	                
	li 	$v0, 10 	
	syscall			
.end_macro	


	