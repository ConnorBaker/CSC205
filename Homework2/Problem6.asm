#  Filename: 			Problem6.asm
#  Author: 				Connor Baker
#  Version: 			0.1a
#  Date created:	February 9th, 2017
#  Last modified: February 9th, 2017
#
#  Description: 	for (I = 0; I < N; I++)
#                 		if (list[I] == key)
#			                    break;		// immediate for loop exit
#	                key = I;



#################################### DATA ####################################
# THIS IS THE DATA SECTION OF THE ASM PROGRAM
.data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
arrayAddress: .word array
iteration: .word 0
maxIteration: .word 11
key: .word 7

msg1: .asciiz "The key is: "
msgadr1: .word	msg1 # Store the address of string msg



#################################### TEXT ####################################
# THIS IS THE TEXT SECTION OF THE PROGRAM
.text
.globl main # must be global


main:
lw	$s0, iteration # $s0 holds the iteration
lw	$s1, maxIteration # $s1 holds the maximum number of iterations
lw	$s2, key # $s2 holds the key
lw	$s3, array # $s3 holds the beginning of the array
lw  $s4, arrayAddress # $s3 holds the array's address


loop: # Start loop
### CHECK THE ITERATION CONDITION OF THE FOR STATEMENT HOLDS ###
slt	$t0, $s1, $s0 # Set $t0 = 1 if maxIteration < iteration so that the bne
                  # below terminates the program. Otherwise, set $t2 = 0.
bne	$t0, $zero, finish # If $t0 is not equal to zero (implying that iteration is
                     # greater than maxIteration), terminate.

### GET THE I-TH ELEMENT OF THE ARRAY ###
sll $t1, $s0, 2	# Calculate the address in memory of the i-th element
add $t1, $t1, $s4
lw	$t2, 0($t1)	# $t3 gets the var in A[i]

### COMPARE THE I-TH ELEMENT WITH THE KEY ###
beq  $s2, $t2, finish # If the i-the element of the array is the key, terminate.
addi $s0, $s0, 1 # increment the counter
sw   $s0, iteration # update the counter

j	loop # Loops back through again.


finish:
sw $s0,key



################################## PRINTING ##################################
# THIS IS THE SECTION OF THE PROGRAM THAT PRINTS OUTPUT TO ENSURE CORRECTNESS
# Print out the result
add	$v0,$zero,4 # Print the string function code
# The number four is the code to trigger printing for a string for a syscall
lw $a0,msgadr1 # Get the address of the string "msg2" to print
syscall # Print the string "msg2"
add	$v0,$zero,1 # Print integer function code
# The number one is the code to trigger printing for an integer for a syscall
lw $a0,key # Pass the result as an argument to print
syscall # Print the result of our computation

# Correctly exit the program
add	$v0,$zero,10 # graceful exit function code
syscall # exit program
