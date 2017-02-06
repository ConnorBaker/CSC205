#  Filename: 			DecimalFractionToBinaryFraction.java
#  Author: 				Connor Baker
#  Version: 			0.1a
#  Date created:	February 5th, 2017
#  Last modified: February 5th, 2017
#
#  Description: 	MIPS translation of the mathematical statement
#									A = (B - 210) * C.
#
#									Here, A (varA) is dependent on B (varB) and C (varC).
#									varB = 356, varC = 2.

################################### DATA ###################################
	.data
varA:			.word	0
varB:			.word	356
varC:			.word	2
varD:			.word 210

msg:			.asciiz "(356 - 210) * 2 ="
msgadr:		.word	msg								# Store the address of string msg
																	# Avoid the use of the "la" pseudo-instruction

################################### TEXT ###################################
	.text
	.globl 	main										# must be global
main:
	lw			$t1,varB								# Load varB
	lw			$t2,varD								# Load varD
	sub			$t0,$t1,$t2							# varB - varD
	lw			$t1,varC								# Load varC
	mult		$t0,$t1									# Multiply the difference of varB and varD by
																	# varC.

	sw			$s0,zee									# set zee = aaa + bee

	add			$v0,$zero,4		# print string function code
	lw	$a0,msgadr		# get address of string "msg" to print
	syscall				# print the string "msg"
	add	$v0,$zero,1		# print integer function code
	lw	$a0,zee			# get the integer to print
	syscall				# print it!

	add	$v0,$zero,10		# graceful exit function code
	syscall				# exit program
