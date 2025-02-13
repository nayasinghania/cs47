.data # This is the first step to define data segment
msg:	.asciiz  "hello world"

.text  # This is the first step to define code segment
	#System call code for printing a string
	li	$v0, 4    	# Load Immediate - Pseudo Instruction; load $v0 with 4
	la	$a0, msg   	# Load address - Pseudo Instruction; load $a0 with msg
				# msg is a variable defined in line 2 &
				# contains the beginning address of the string in line 2
	syscall            	# Processor operation to invoke OS routine
				# First checks variable $v0 
				# if the content is 4, string in $a0 will be printed        
				# until it hits a NULL character	

	#System call code to STOP			
	li 	$v0, 10 	# load $v0 with 10 
	syscall			# Processor operation to invoke OS routine
				# First checks variable $v0 
				# if the content is 10 run will STOP 
				# Exit from the program
	
	
	
	
