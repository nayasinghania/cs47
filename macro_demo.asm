#<------------------ MACRO DEFINITIONS ---------------------->#
# Macro : print_string
.macro print_string($arg)	# Usage: print_string(<address of the string>)
				# pass the address of the string to print as argument $arg
	li	$v0, 4		# load $v0 with 4; to print a string  
	la	$a0, $arg	# load $a0 with the address of the string to print
	syscall			# Syscall to print the string        
.end_macro			# End of Macro
	
# Macro : print_int		
.macro print_integer($arg)	# Usage: print_int(<val>)
				# pass the integer to print as argument $arg
	li 	$v0, 1    	# load $v0 with 1; to print an integer
	li	$a0, $arg  	# load $a0 with $arg
	syscall            	# syscall to print the integer
.end_macro			# End of Macro
 
# Macro : EXIT
.macro exit	                # Usage: exit
	li 	$v0, 10 	# load $v0 with 10; to STOP execution
	syscall			# syscall to END
.end_macro			# End of Macro
	
#<------------------ APPLICATION PROGRAM---------------------->#
#<------------------ DATA SEGMENT DEFINITION------------------>#
.data
string:	.asciiz  "This is my program #"

#<------------------ CODE SEGMENT DEFINITION------------------>#
.text
.globl main
#notmain:   print_integer(47) # for demo
main:	print_string(string)
        print_integer(2)
	exit
	
	
	
	

