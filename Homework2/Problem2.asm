#  Filename: 			Problem2.asm
#  Author: 				Connor Baker
#  Version: 			0.1a
#  Date created:	February 7th, 2017
#  Last modified: February 7th, 2017
#
#  Description: 	Adding comments to the following program

################################### DATA ###################################
.data
varA:			.word	0

################################### TEXT ###################################
.text
.globl 	main										# must be global
main:


begin:
addi	$t5,$zero,0 # Store 0 in $t5
addi	$t6,$zero,1 # Store 1 in $t6
addi	$t1,$zero,1 # Store 1 in $t1

loop: # Start loop
slt	$t2,$a0,$t1 # returns 1 if true, 0 if false. $a0 defaults to 1 in QtSPim.
								#	As such, this returns 0.
bne	$t2,$zero,finish # If $t2 is not equal to zero, terminate. However, $t2 is
										 # one because of the above slt operation.
add	$t7,$t5,$t6 # Add zero to one and store in $t7
# $t7 is now one.
add	$t5,$zero,$t6 # Add zero to one and store in $t5
# $t5 is now one.
add	$t6,$zero,$t7 # Add zero to one and store in $t6
# $t6 is now one.
addi	$t1,$t1,1 # Add one to one and store in $t1
# $t1 is now two.
j	loop # Loops back through again.
# On this next iteration, the slt will return 1, which will cause the bne to
# fall through because one is not equal to zero. As such, the loop will
# terminate.


finish:
add	$v0,$t7,$zero # $t7 was only touched once, so it's still one. One plus zero
# is one, which is stored in $v0.

# Find out what $v0 contains
sw $v0,varA

add	$v0,$zero,1									# Print integer function code
# The number one is the code to trigger printing for an integer for a syscall
lw	$a0,varA										# Pass the product as an argument to print
syscall													# Print the result of our computation

# Correctly exit the program
add	$v0,$zero,10								# graceful exit function code
syscall													# exit program
