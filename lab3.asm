.macro calculate
	.data
		promptx: .asciiz "Enter a value for x: "
		prompty: .asciiz "Enter a value for y: "
		expression: .asciiz "x^2 + 2xy + y^2 = "
		
		x: .word 0
		y: .word 0
		result: .word 0 
	.text
		li $v0, 4
		la $a0, promptx
		syscall
		
		li $v0, 5
		syscall
		sw $v0, x
		
		li $v0, 4
		la $a0, prompty
		syscall
		
		li $v0, 5
		syscall
		sw $v0, y
		
		lw $t1, x
		lw $t2, y
		
		multu $t1, $t1
		mflo $t0
		subu $sp, $sp, 4
		sw $t0, ($sp)
		
		li $t0, 2
		multu $t0, $t1
		mflo $t0
		
		multu $t0, $t2
		mflo $t0
		subu $sp, $sp, 4
		sw $t0, ($sp)
		
		multu $t2, $t2
		mflo $t0
		subu $sp, $sp, 4
		sw $t0, ($sp)
		
		lw $t3, ($sp)
		addu $sp, $sp, 4
		
		lw $t4, ($sp)
		addu  $sp, $sp, 4
		
		lw $t5, ($sp)
		addu  $sp, $sp, 4
		
		li $t0, 0
		addu $t0, $t3, $t4
		addu $t0, $t0, $t5
		sw $t0, result
		
		li $v0, 4
		la $a0, expression
		syscall
		
		li $v0, 1
		lw $a0, result
		syscall
		
		
.end_macro

.macro exit
	.text
		li $v0, 10
		syscall
.end_macro 

.text
	calculate
	exit