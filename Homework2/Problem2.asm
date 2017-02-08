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
addi	$t5,$zero,0
addi	$t6,$zero,1
addi	$t1,$zero,1

loop:
slt	$t2,$a0,$t1
bne	$t2,$zero,finish
add	$t7,$t5,$t6
add	$t5,$zero,$t6
add	$t6,$zero,$t7
addi	$t1,$t1,1
j	loop

finish:
add	$v0,$t7,$zero

# Find out what $v0 contains
sw $v0,varA

add	$v0,$zero,1									# Print integer function code
# The number one is the code to trigger printing for an integer for a syscall
lw	$a0,varA										# Pass the product as an argument to print
syscall													# Print the result of our computation

# Correctly exit the program
add	$v0,$zero,10								# graceful exit function code
syscall													# exit program
