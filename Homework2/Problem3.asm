#  Filename: 			Problem3.asm
#  Author: 				Connor Baker
#  Version: 			0.1d
#  Date created:	February 5th, 2017
#  Last modified: February 9th, 2017
#
#  Description: 	MIPS translation of the mathematical statement
#									A = (B - 210) * C.
#
#									Here, A (varA) is dependent on B (varB) and C (varC).
#									varB = 356, varC = 2.



#################################### DATA ####################################
# THIS IS THE DATA SECTION OF THE ASM PROGRAM
.data
varA: .word 0
varB:	.word	356
varC:	.word	2

msg: .asciiz "(356 - 210) * 2 = "
msgadr: .word	msg # Store the address of string msg
# Avoid the use of the "la" pseudo-instruction



#################################### TEXT ####################################
# THIS IS THE TEXT SECTION OF THE PROGRAM
.text
.globl main # must be global
main:
lw $t0,varB # Load varB into $t0
addi $t1,$t0,-210 # Calculate the difference of varB - 210 for $t1
# We no longer need $t0. The next step uses $t0
lw $t0,varC # Load varC in $t1 since we're done with varB
mult $t1,$t0 # Multiply the difference of varB and varD by
# varC and store in $t2
# We no longer need $t0, $t1.
mflo $s0 # Store the product in $s0
sw $s0,varA # Set varA equal to the product



################################## PRINTING ##################################
# THIS IS THE SECTION OF THE PROGRAM THAT PRINTS OUTPUT TO ENSURE CORRECTNESS
add	$v0,$zero,4 # Print the string function code
# The number four is the code to trigger printing for a string for a syscall
lw $a0,msgadr # Get the address of the string "msg" to print
syscall # Print the string "msg"
add	$v0,$zero,1 # Print integer function code
# The number one is the code to trigger printing for an integer for a syscall
lw $a0,varA # Pass the product as an argument to print
syscall	# Print the result of our computation

# Correctly exit the program
add	$v0,$zero,10 # graceful exit function code
syscall # exit program
