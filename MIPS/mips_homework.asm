.eqv DATA_SIZE 4
.macro print_int(%x)
	li $v0, 1
	add $a0, $zero, %x
	syscall
.end_macro
.macro print_new_line
	li $v0, 4
	la $a0, newLine
	syscall
.end_macro
.macro move_to_next_elem
	addi $s1, $s1, 1
	lw $s5, ($s4)
	addiu $s4, $s4, DATA_SIZE
.end_macro
.data
	inputN: .asciiz "n = "
	newLine: .asciiz "\n"
	sum: .asciiz "The sum is: "
.text
	main:

		
		li $v0, 4
		la $a0, inputN
		syscall
		
		li $v0, 5
		syscall
		mul $t0, $v0, $v0
		sll $a1, $t0, 2 # number of bytes needed 
		move $a2, $v0	# the value of n
		
		# allocate memory for the matrix
		move $a0, $a1
		li $v0, 9
		syscall
		
		# save the address in $s3
		la $s3, ($v0)
		
		# save the address of $s3 in $s4 to have a copy
		la $s4, ($s3) 
		
		print_new_line
		
		jal readMatrix
		
		jal sumUpperTriangular
		
		li $v0, 4
		la $a0, sum
		syscall
		
		li $v0, 1
		addi $a0, $v1, 0
		syscall
		
		
		# end of the program
		li $v0, 10
		syscall
	
	# read matrix from user's input
	readMatrix:
		addi $s2, $zero, 0
		loopRead:
			bge $s2, $a1, exitRead
				li $v0, 5
				syscall
				sw $v0 ($s3)
				addiu $s3, $s3, DATA_SIZE
			addi $s2, $s2, DATA_SIZE
			j loopRead	
		exitRead:
			jr $ra
	# calculate the sum		
	sumUpperTriangular:	
		
		addi $s0, $zero, 0
		addi $s1, $zero, 0
		
		loopSumI:
			bge $s0, $a2, exit
			addi $s0, $s0, 1	
			addi $s1, $zero, 0
			j loopSumJ
		loopSumJ:
			bge $s1, $a2, loopSumI
			move_to_next_elem
			bgt $s0, $s1, dont_add # if i > j don't add the number to the sum
			add $v1, $v1, $s5
			j loopSumJ
		dont_add:
			j loopSumJ
		exit:
			jr $ra
	
