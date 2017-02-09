#  Filename: 			Problem4.asm
#  Author: 				Connor Baker
#  Version: 			0.1b
#  Date created:	February 8th, 2017
#  Last modified: February 9th, 2017
#
#  Description: 	MIPS translation of the C statement
#	                if  (q == r)
#                   r = r + q;
#                  else
#                   q = r - q;
#                 Where q (varQ) is 5 and r (varR) is 3



#################################### DATA ####################################
# THIS IS THE DATA SECTION OF THE ASM PROGRAM
.data
varQ: .word 5
varR:	.word	3

msg1: .asciiz "q is "
msgadr1: .word	msg1 # Store the address of string msg

msg2: .asciiz "\nr is "
msgadr2: .word	msg2 # Store the address of string msg
# Avoid the use of the "la" pseudo-instruction



#################################### TEXT ####################################
# THIS IS THE TEXT SECTION OF THE PROGRAM
.text
.globl main # must be global
main:

lw $t0,varQ # Load varQ into $t0
lw $t1,varR # Load varR into $t1

bne $t0,$t1,else # Look for equality between q and r. If this fails, goto else
add $s0,$t1,$t0 # r += q
sw $s0,varR # Update the value of varR
j endif

else: # If q is not equal to r
sub $s0,$t1,$t0 # q = r - q
sw $s0,varQ # Update the value of varQ

endif: # Do nothing



################################## PRINTING ##################################
# THIS IS THE SECTION OF THE PROGRAM THAT PRINTS OUTPUT TO ENSURE CORRECTNESS
# Print out q
add	$v0,$zero,4 # Print the string function code
# The number four is the code to trigger printing for a string for a syscall
lw $a0,msgadr1 # Get the address of the string "msg1" to print
syscall # Print the string "msg1"
add	$v0,$zero,1 # Print integer function code
# The number one is the code to trigger printing for an integer for a syscall
lw	$a0,varQ # Pass the product as an argument to print
syscall # Print the result of our computation

# Print out r
add	$v0,$zero,4 # Print the string function code
# The number four is the code to trigger printing for a string for a syscall
lw $a0,msgadr2 # Get the address of the string "msg2" to print
syscall # Print the string "msg2"
add	$v0,$zero,1 # Print integer function code
# The number one is the code to trigger printing for an integer for a syscall
lw	$a0,varR # Pass the product as an argument to print
syscall # Print the result of our computation

# Correctly exit the program
add	$v0,$zero,10 # graceful exit function code
syscall # exit program
