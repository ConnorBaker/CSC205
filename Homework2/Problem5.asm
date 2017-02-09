#  Filename: 			Problem5.asm
#  Author: 				Connor Baker
#  Version: 			0.1a
#  Date created:	February 9th, 2017
#  Last modified: February 9th, 2017
#
#  Description: 	MIPS translation of the C statement
#	                B = 25 | A;
#                 Where A (varA) is 5



#################################### DATA ####################################
# THIS IS THE DATA SECTION OF THE ASM PROGRAM
.data
varA: .word 5

msg1: .asciiz "The result of B = 25 | A is: "
msgadr1: .word	msg1 # Store the address of string msg



#################################### TEXT ####################################
# THIS IS THE TEXT SECTION OF THE PROGRAM
.text
.globl main # must be global
main:

addi $t0,$zero,25 # Load 25 into $t1
lw $t1,varA # Load varA into $t0
or $s0,$t0,$t1 # Perform the or on 25 and A



################################## PRINTING ##################################
# THIS IS THE SECTION OF THE PROGRAM THAT PRINTS OUTPUT TO ENSURE CORRECTNESS
# Print out the result
add	$v0,$zero,4 # Print the string function code
# The number four is the code to trigger printing for a string for a syscall
lw $a0,msgadr1 # Get the address of the string "msg2" to print
syscall # Print the string "msg2"
add	$v0,$zero,1 # Print integer function code
# The number one is the code to trigger printing for an integer for a syscall
add $a0,$zero,$s0 # Pass the result as an argument to print
syscall # Print the result of our computation

# Correctly exit the program
add	$v0,$zero,10 # graceful exit function code
syscall # exit program
