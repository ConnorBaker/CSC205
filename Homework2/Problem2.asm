#  Filename: 			Problem2.asm
#  Author: 				Connor Baker
#  Version: 			0.1c
#  Date created:	February 7th, 2017
#  Last modified: February 9th, 2017
#
#  Description: 	This program calculates (given an positive arugment for $a0)
#                 the (n-1)th element of the Fibonacci sequence (in this case,
#                 just the later portion of it: the set is zero-indexed and
#                 contains {1,2,3,5,...}).



#################################### DATA ####################################
# THIS IS THE DATA SECTION OF THE ASM PROGRAM
.data
varA:			.word	0 # Dummy variable to hold the calculated value



#################################### TEXT ####################################
# THIS IS THE TEXT SECTION OF THE PROGRAM
.text
.globl 	main # must be global
main:

begin:
addi	$t5,$zero,0 # Store F_0 = 0 in $t5
addi	$t6,$zero,1 # Store F_1 = 1 in $t6
addi	$t1,$zero,1 # Store 1 in $t1, which is our iteration counter


loop: # Start loop
slt	$t2,$a0,$t1 # If we've iterated enough time to arrive at the specified
                # Fibonacci number, set $t2 = 1 so that the bne below
                # terminates the program. Otherwise, set $t2 = 0.
bne	$t2,$zero,finish # If $t2 is not equal to zero, terminate.
add	$t7,$t5,$t6 # Set F_n = F_{n-2} + F_{n-1}
# $t7 is now the nth Fibonacci number, where n is the iteration number.
add	$t5,$zero,$t6 # Update F_{n-2} since we have a new F_n.
# $t5 is now the (n-2)th Fibonacci number, where n is the iteration number.
add	$t6,$zero,$t7 # Update F_{n-1} since we have a new F_n.
# $t6 is now the (n-1)th Fibonacci number, where n is the iteration number.
addi	$t1,$t1,1 # Update our iteration counter.
j	loop # Loops back through again.

finish:
add	$v0,$t7,$zero # Now that we've found the (n-1)th element of the Fibonacci sequence, store it in $v0.

# Find out what $v0 contains
sw $v0,varA



################################## PRINTING ##################################
# THIS IS THE SECTION OF THE PROGRAM THAT PRINTS OUTPUT TO ENSURE CORRECTNESS
add	$v0,$zero,1									# Print integer function code
# The number one is the code to trigger printing for an integer for a syscall
lw	$a0,varA										# Pass the product as an argument to print
syscall													# Print the result of our computation

# Correctly exit the program
add	$v0,$zero,10								# graceful exit function code
syscall													# exit program
