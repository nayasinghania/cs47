.data
	input: .space 256
	output: .space 256
	promptinput: .asciiz "Enter a string (256 or less characters): "
	promptoutput: .asciiz "Reversed string: "
.text
	main:
		li $v0, 4
		la $a0, promptinput
		syscall
	
		li $v0, 8
		la $a0, input
		li $a1, 256
		syscall
		
		jal strlen
		jal reverse
		
		li $v0, 4
		la $a0, promptoutput
		syscall
		
		li $v0, 4
		la $a0, output
		syscall
	exit:  
		li  $v0, 10
		syscall
	strlen:
		strlen_loop: 
			lb $t1, 0x10010000($t0)
			beqz $t1, strlen_loop_exit
			addi $t0, $t0, 1
			subu $sp, $sp, 1
			sb $t1, ($sp)
			j strlen_loop
		strlen_loop_exit: 
			addu $sp, $sp, 1
			jr $ra
	reverse:
		la $t1, output
		reverse_loop:
			lb $t2, ($sp)
			sb $t2, ($t1)
			addu $sp, $sp, 1
			addu $t1, $t1, 1
			subu $t0, $t0, 1
			beqz $t0, reverse_loop_exit
			j reverse_loop
		reverse_loop_exit:
			jr $ra