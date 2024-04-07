#Ayman Salama 1200488
#Ayman Qashoo 1200312

.data
    	# Declare a 2D array with 31 rows and 10 columns
    	array:  .space 1240
    	stars: .asciiz "***********************************\n"
    	slashes: .asciiz "-----------------------------------------------------------\n"
    	menue: .asciiz "please choose one of the following:\n1.view calendar\n2.View Statistics\n3.Add a new appointment\n4.Delete an appointment\n5.exit the program\n"
    	str: .space 1000
    	str1: .space 1000
    	str2: .space 1000
    	bro: .space 1000
    	bro1: .space 1000
    	t3_address: .space 1000
    	Calendar: .asciiz "Choose one of the following:\n1. View per Day\n2. View per Set of Days\n3. View for Given Slot in Given Day\n4. back to menu\n"
    	view_per_day_str: .asciiz "please enter the number of day you wish to view. Make sure it's between 1-31:\n"
    	calendar_file: .asciiz "Calendar.txt"
    	calendar_file_copy: .asciiz "Calendar - Copy.txt"
    	view_per_set_of_days_str: .asciiz "please enter the amount of days you wish to view\n"
    	fileWords: .space 1024
    	one_word: .space 1000
    	first_two_letters: .space  1000
    	first_two_letters_1: .space  1000
    	user_input: .space 1000
    	user_input_1: .space 1000
    	one: .space  1000
    	first_two_letters2: .space  1000
    	two: .space  1000
    	index0: .space  1000
    	index1: .space  1000
    	three: .space  1000
    	HexaValue: .word 0x30
    	bruh_print: .asciiz "indeed"
    	the_number_one: .asciiz "1"
    	the_number_one_L: .asciiz "1"
    	the_number_one_OH: .asciiz "1"
    	ayman: .space 100000
    	ayman1: .space 100000
    	ayman2: .space 100000
    	ayman3: .space 100000
    	ayman4: .space 100000
    	ayman5: .space 100000
    	ayman6: .space 100000
    	ayman7: .space 100000
    	ayman8: .space 100000
    	ayman9: .space 100000
    	ayman10: .space 100000
    	ayman11: .space 100000
    	ayman12: .space 100000
    	ayman13: .space 100000
    	debug_here: .asciiz "debug"
    	prompt_start_hour: .asciiz "Please enter the start hour of the slot. Make sure it's in 24-hour format, and between 8-17:\n"
    	prompt_end_hour: .asciiz "Please enter the ending hour of the slot. Make sure it's in 24-hour format, and between 8-17:\n"
    	prompt_start_hour_store: .space 100
    	prompt_end_hour_store: .space 100
    	prompt_end_hour_store_add_appointment:
    	this_is_lecture: .asciiz "  L \n"
    	this_is_office_hours: .asciiz "  OH \n"
    	this_is_meeting: .asciiz "  M \n"
    	view_statistics_prompt: .asciiz "Choose one of the following:\n1.Show number of lectures (in hours)\n2.Show number of OH (in hours)\n3.Show number of Meetings (in hour)\n4.show the average lectures per day\n5.Show the ratio between total number of hours reserved for lectures and the total number of hours reserved OH.\n6.Back to menue\n"
    	float_zero:   .float 0.0
    	float_one:    .float 1.0
    	float_constant: .float 0.0
    	float_format: .asciiz "%.2f\n"
    	print_type_of_appointment: .asciiz "Please enter the type of appoinment you wish to add (enter either L, M, or OH)\n"
    	print_type_of_appointment_space: .space 100
    	view_per_day_str_appointment: .asciiz "please enter the number of day you wish to add appointment to. Make sure it's between 1-31:\n"
    	error_message: .asciiz "The day you entered is incorrect. Please enter a valid number:\n"
    	error_message_hour: .asciiz "The hour you entered is incorrect. Please enter a valid number:\n"
    	error_message_type: .asciiz "The type of appointment you entered is incorrect. Please enter a valid type:\n"
    	error_message_second_hour_less: .asciiz "The end hour you enered should be greater than the start hour. Please enter again:\n"
    	error_message_for_appointment_conflict: .asciiz "the slot you are trying to reserve causes conflict with other appointments\n\n"
    	this_is_lecture_new: .asciiz "  L \n"
    	view_per_day_str_appointment_delete: .asciiz "please enter the number of day you wish to delete appointments of. Make sure it's between 1-31:\n"
    	error_message_day_not_existant: .asciiz "The day you entered has no reserved appointments to delete. Please enter a valid day:\n"
    	error_message_slot_not_consistant_with_type: .asciiz "the slot of time doesn't belong to the type of appointment you entered. Please enter a valid slot to conform with type:"
.text
	li $t0, 0
	li $t1, 0
	li $t2, 0
	li $t3, 0
	li $t4, 0
	li $t5, 0
	li $t6, 0
	li $t7, 0
	li $t8, 0
	li $t9, 0
	li $a0, 0
	li $a1, 0
	li $a2, 0
	li $a3, 0
	li $v0, 0
	li $v1, 0
	li $s0, 0
	li $s1, 0
	li $s2, 0
	li $s3, 0
	li $s4, 0
	li $s5, 0
	li $s6, 0
	li $s7, 0
main:	
	#filling a 2d array with zeros
    	la $v1, array
    	# Index = base_address + ((row × columns + column) × 4)
    	li $t0, 0  # initial row index, counter
    	li $t1, 0  # initial column index, counter
    	li $t2, 10  # number of columns
loop_array_zeros_row_same:
    	mul $t3, $t0, $t2
    	add $t4, $t3, $t1
    	mul $t5, $t4, 4  # now $t5 contains the index
    	#Calculate the address of array[index]
    	add $t6, $t5, $v1  # now $t6 contains the address
    	#Store the value at array[index]
    	sw $zero, 0($t6)
    	addi $t0, $t0, 1
    	beq $t0, 10, loop_array_zeros_increment_column
    	j loop_array_zeros_row_same
loop_array_zeros_increment_column:
	li $t0, 0  # initial row index, counter
	addi $t1, $t1, 1 
	beq $t1, 31, storing_in_array_finished
	j loop_array_zeros_row_same
storing_in_array_finished:
	li $t0, 0
	li $t1, 0
	li $t2, 0
	li $t3, 0
	li $t4, 0
	li $t5, 0
	li $t6, 0
	li $t7, 0
	li $t8, 0
	li $t9, 0
	li $k0, 0
	li $k1, 0
	li $v0, 0
	li $s0, 0
	li $s1, 0
	li $s2, 0
	li $s3, 0
	li $s4, 0
	li $s5, 0
	li $s6, 0
	li $s7, 0
	li $gp, 0
	li $fp, 0
	l.s $f0, float_zero   # Load 0.0 into $f0
	l.s $f1, float_one
	la $s6 str
	la $gp one_word
    	li $k0 0      # current line length
   	# open file
    	li $v0 13     # syscall for open file
    	la $a0 calendar_file    # input file name
    	li $a1 0      # read flag
    	li $a2 0      # ignore mode 
    	syscall       # open file 
    	move $fp $v0  # save the file descriptor 
read_loop0:
    	# read byte from file
    	li $v0 14     # syscall for read file
    	move $a0 $fp  # file descriptor 
    	move $a1 $s6  # address of dest buffer
    	li $a2 1      # buffer length
    	syscall       # read byte from file
    	# keep reading until bytes read <= 0
    	blez $v0 read_done0
    	# naively handle exceeding line size by exiting
    	slti $t0 $k0 1024
    	beqz $t0 read_done0
    	# if current byte is a newline, consume line
    	lb $s4 ($s6)
    	li $t0 10
    	beq $s4 $t0 consume_line0
    	add $s5 $k0 $gp		# otherwise, append byte to line
    	sb $s4 ($s5)
    	addi $k0 $k0 1		 # increment line length
   	b read_loop0
consume_line0:
    	# null terminate line
    	add $s5 $k0 $gp
    	sb $zero ($s5)
    	li $k0 0
    	li $t8,0 	
    	mov.s $f11, $f0  	
    	# Convert the floating-point counter to an integer
        cvt.w.s $f11, $f11
        # Move the result to an integer register
        mfc1 $t8, $f11       
        bge $t8, 1, set_gp_address
        j continue_from_set_gp_address
set_gp_address:
	addi $gp, $gp, 2
continue_from_set_gp_address:
	move $a2, $gp
    	li $t4, 0
    	li $t8, 0          
    	li $t7, 0
    	li $t1, 0
    	la $t4, first_two_letters
    	# Find the position of the colon in the string
    	li $t0, 0          # Initialize index to 0
    	li $t7, 0
    	li $t2, 0          # Initialize index to 0
    	li $t4, 0
    	li $t5, 0          # Initialize index to 0
    	li $t8, 0
    	la $a3, first_two_letters
    	add.s $f0, $f0, $f1
find_colon0:
    	lb $t1, 0($a2)     # Load a byte from the string
    	beqz $t1, not_found0 # If null terminator is reached, the colon is not found
    	beq $t1, ':', found_colon0 # If colon is found, jump to the found_colon label
    	beq $t7, 1, two_digit_number0
    	sb $t1, 0($a3)
    	addi $t7, $t7, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j find_colon0 
two_digit_number0:
    	sb $t1, 1($a3) 
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j find_colon0       # Jump back to find_colon
found_colon0:
    	move $k1, $a3 #day number is now inside $k1   
convert_to_integer:   
    	lb $t2, 0($k1)         # Load the first character of the ASCII string
    	lb $t3, 1($k1)         # Load the second character of the ASCII string
    	beqz $t3, one_digit_integer_conversion
    	subi $t2, $t2, 0x30    # Convert the first character to its integer value
    	subi $t3, $t3, 0x30    # Convert the second character to its integer value
    	li $k1, 0              # Initialize $k1 to zero
    	mul $k1, $t2, 10       # Multiply the first digit by 10
    	add $k1, $k1, $t3      # Add the second digit to the result
    	j string_finished_integer_conversion
one_digit_integer_conversion:
    	subi $t2, $t2, 0x30    # Convert the first character to its integer value
    	li $k1, 0  
    	move $k1, $t2
    	# The result is now in $k1
string_finished_integer_conversion:
    	addi $a2, $a2, 2   # Move to the character after the colon
    	la $a3, one
    	sb $zero, 0($a3)
    	sb $zero, 1($a3)
    	sb $zero, 2($a3)
    	sb $zero, 3($a3)
    	sb $zero, 4($a3)
    	sb $zero, 5($a3)
    	sb $zero, 6($a3)
    	sb $zero, 7($a3)
    	j split1
not_found0:
    	li $v0, 10          # Exit program
    	syscall
split1:
    	lb $t3, 0($a2)     # Load a byte from the string
    	beqz $t3, not_found0 # If null terminator is reached, the colon is not found
    	beq $t3, ',', found_colon1 # If colon is found, jump to the found_colon label
    	beq $t4, 0, onee0
    	beq $t4, 1, onee1
    	beq $t4, 2, onee2
    	beq $t4, 3, onee3
    	beq $t4, 4, onee4
    	beq $t4, 5, onee5
    	beq $t4, 6, onee6
    	beq $t4, 7, onee7
    	beq $t4, 8, onee8
    	beq $t4, 9, onee9
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split1   
onee0:
    	sb $t3, 0($a3) 
    	addi $t4, $t4, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split1
onee1:
    	sb $t3, 1($a3) 
    	addi $t4, $t4, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split1  
onee2:
    	sb $t3, 2($a3) 
    	addi $t4, $t4, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split1  
onee3:
    	sb $t3, 3($a3) 
    	addi $t4, $t4, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split1  
onee4:
    	sb $t3, 4($a3) 
    	addi $t4, $t4, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split1  
onee5:
    	sb $t3, 5($a3) 
    	addi $t4, $t4, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split1  
onee6:
    	sb $t3, 6($a3) 
    	addi $t4, $t4, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split1  
onee7:
    	sb $t3, 7($a3) 
    	addi $t4, $t4, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split1  
onee8:
    	sb $t3, 8($a3) 
    	addi $t4, $t4, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split1  
onee9:
    	sb $t3, 9($a3) 
    	addi $t4, $t4, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split1  
found_colon1:
    	# At this point, $t0 contains the index of the colon in the string
    	# Move to the character after the colon
    	addi $a2, $a2, 2   # Move to the character after the colon
    	move $t4, $a3
    	la $a3, index0
    	sb $zero, 0($a3)
    	sb $zero, 1($a3)
    	sb $zero, 2($a3)
    	sb $zero, 3($a3)
    	sb $zero, 4($a3)
    	j to_get_LandOHandM
to_get_LandOHandM:
    	lb $s3, 0($t4)     # Load a byte from the string
    	beqz $s3, not_found0 # If null terminator is reached, the colon is not found
    	beq $s3, ' ', check_if_LorOHorM# If colon is found, jump to the found_colon label
    	beq $t0, 0, digit0
    	beq $t0, 1, digit1
    	beq $t0, 2, digit2
    	beq $t0, 3, digit3
   	beq $t0, 4, digit4
    	addi $t0, $t0, 1   # Move to the next character in the string
    	j to_get_LandOHandM  
digit0:
    	sb $s3, 0($a3) 
    	addi $t0, $t0, 1
    	addi $t4, $t4, 1   # Move to the next character in the string
    	j to_get_LandOHandM
digit1:
    	sb $s3, 1($a3) 
    	addi $t0, $t0, 1
    	addi $t4, $t4, 1   # Move to the next character in the string
    	j to_get_LandOHandM  
digit2:
    	sb $s3, 2($a3) 
    	addi $t0, $t0, 1
    	addi $t4, $t4, 1   # Move to the next character in the string
    	j to_get_LandOHandM  
digit3:
    	sb $s3, 3($a3) 
    	addi $t0, $t0, 1
    	addi $t4, $t4, 1   # Move to the next character in the string
    	j to_get_LandOHandM  
digit4:
    	sb $s3, 4($a3) 
    	addi $t0, $t0, 1
    	addi $t4, $t4, 1   # Move to the next character in the string
    	j to_get_LandOHandM 
check_if_LorOHorM:
    	addi $t4, $t4, 1
    	lb $t2, 0($t4)
    	beqz $t2, not_found0 # If null terminator is reached, the colon is not found
    	beq $t2, 'L', stor_in_L
    	beq $t2, 'O', stor_in_OH
    	beq $t2, 'M', stor_in_M
    	la $a3, two
    	j split2 
stor_in_L:
    	move $s0, $a3
    	li $a3, 0
    	li $t8, 0
    	la $a3, two
    	sb $zero, 0($a3)
    	sb $zero, 1($a3)
    	sb $zero, 2($a3)
    	sb $zero, 3($a3)
    	sb $zero, 4($a3)
    	sb $zero, 5($a3)
    	sb $zero, 6($a3)
    	sb $zero, 7($a3)
    	li $k0, 0 	#flag
    	li $t0, 0
    	li $t1, 0 #counter
    	li $t4, 0
    	li $t5, 0
    	li $t6, 0
   	li $t8, 0
   	li $t9, 0
   	#now let us split the hours at the character "-"
    	move $t9, $s0
    	la $t8, the_number_one
    	li $t3, 0
    	la $t3, ayman6
    	sb $zero, 0($t3)
    	sb $zero, 1($t3)
    	la $t4, ayman7
    	sb $zero, 0($t4)
    	sb $zero, 1($t4)
    	j loop_seperate_hours_L    
stor_in_OH:
    	move $s1, $a3
    	li $a3, 0
    	li $t8, 0
    	la $a3, two
    	sb $zero, 0($a3)
    	sb $zero, 1($a3)
    	sb $zero, 2($a3)
    	sb $zero, 3($a3)
    	sb $zero, 4($a3)
    	sb $zero, 5($a3)
    	sb $zero, 6($a3)
    	sb $zero, 7($a3)
    	li $k0, 0 	#flag
    	li $t0, 0
    	li $t1, 0 #counter
    	li $t4, 0
    	li $t5, 0
    	li $t6, 0
    	li $t8, 0
    	li $t9, 0
    	#now let us split the hours at the character "-"
    	move $t9, $s1
    	la $t8, the_number_one
    	li $t3, 0
    	la $t3, ayman8
    	sb $zero, 0($t3)
    	sb $zero, 1($t3)
    	la $t4, ayman9
    	sb $zero, 0($t4)
    	sb $zero, 1($t4)
    	j loop_seperate_hours_M   
stor_in_M:
    	move $s2, $a3
    	li $a3, 0
    	la $a3, two
    	sb $zero, 0($a3)
    	sb $zero, 1($a3)
    	sb $zero, 2($a3)
    	sb $zero, 3($a3)
    	sb $zero, 4($a3)
    	sb $zero, 5($a3)
    	sb $zero, 6($a3)
    	sb $zero, 7($a3)
    	li $k0, 0 	#flag
    	li $t0, 0
    	li $t1, 0 #counter
    	li $t4, 0
    	li $t5, 0
    	li $t6, 0
    	li $t8, 0
    	li $t9, 0
    	#now let us split the hours at the character "-"
    	move $t9, $s2
    	la $t8, the_number_one
    	li $t3, 0
    	la $t3, ayman2
    	sb $zero, 0($t3)
    	sb $zero, 1($t3)
    	la $t4, ayman1
    	sb $zero, 0($t4)
    	sb $zero, 1($t4)
    	j loop_seperate_hours  
split2:
    	lb $t6, 0($a2)     # Load a byte from the string
    	beqz $t6, not_found0 # If null terminator is reached, the colon is not found
    	beq $t6, ',', found_colon2 # If colon is found, jump to the found_colon label
    	beq $t8, 0, twoo0
    	beq $t8, 1, twoo1
    	beq $t8, 2, twoo2
    	beq $t8, 3, twoo3
    	beq $t8, 4, twoo4
    	beq $t8, 5, twoo5
    	beq $t8, 6, twoo6
    	beq $t8, 7, twoo7
    	beq $t8, 8, twoo8
    	beq $t8, 9, twoo9
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split2
twoo0:
    	sb $t6, 0($a3) 
    	addi $t5, $t5, 1   # Increment the index
    	addi $t8, $t8, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split2  
twoo1:
    	sb $t6, 1($a3) 
    	addi $t5, $t5, 1   # Increment the index
    	addi $t8, $t8, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split2 
twoo2:
    	sb $t6, 2($a3) 
    	addi $t5, $t5, 1   # Increment the index
    	addi $t8, $t8, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split2 
twoo3:
    	sb $t6, 3($a3) 
    	addi $t5, $t5, 1   # Increment the index
    	addi $t8, $t8, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split2 
twoo4:
    	sb $t6, 4($a3) 
    	addi $t5, $t5, 1   # Increment the index
    	addi $t8, $t8, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split2 
twoo5:
    	sb $t6, 5($a3) 
    	addi $t5, $t5, 1   # Increment the index
    	addi $t8, $t8, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split2 
twoo6:
    	sb $t6, 6($a3) 
    	addi $t5, $t5, 1   # Increment the index
    	addi $t8, $t8, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split2 
twoo7:
    	sb $t6, 7($a3) 
    	addi $t5, $t5, 1   # Increment the index
    	addi $t8, $t8, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split2 
twoo8:
    	sb $t6, 8($a3) 
    	addi $t5, $t5, 1   # Increment the index
    	addi $t8, $t8, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split2 
twoo9:
    	sb $t6, 9($a3) 
    	addi $t5, $t5, 1   # Increment the index
    	addi $t8, $t8, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j split2  
found_colon2:
    	# At this point, $t0 contains the index of the colon in the string
    	# Move to the character after the colon
    	addi $a2, $a2, 2   # Move to the character after the colon
    	move $t9, $a2
    	move $t8, $a3
    	move $t4, $t8
    	li $t0, 0          # Initialize index to 0
    	li $t2, 0
    	li $s3, 0          # Initialize index to 0
    	li $s4, 0
    	la $a3, index1
    	sb $zero, 0($a3)
    	sb $zero, 1($a3)
    	sb $zero, 2($a3)
    	sb $zero, 3($a3)
    	sb $zero, 4($a3)
    	move $t5, $t9 
    	j to_get_LandOHandM1
to_get_LandOHandM1:
    	lb $s3, 0($t4)     # Load a byte from the string
    	beqz $s3, not_found0 # If null terminator is reached, the colon is not found
    	beq $s3, ' ', check_if_LorOHorM1# If colon is found, jump to the found_colon label
    	beq $t0, 0, digit00
    	beq $t0, 1, digit11
    	beq $t0, 2, digit22
    	beq $t0, 3, digit33
    	beq $t0, 4, digit44
    	addi $t0, $t0, 1   # Move to the next character in the string
    	j to_get_LandOHandM1 
digit00:
    	sb $s3, 0($a3) 
    	addi $t0, $t0, 1
    	addi $t4, $t4, 1   # Move to the next character in the string
    	j to_get_LandOHandM1
digit11:
    	sb $s3, 1($a3) 
    	addi $t0, $t0, 1
    	addi $t4, $t4, 1   # Move to the next character in the string
    	j to_get_LandOHandM1 
digit22:
    	sb $s3, 2($a3) 
    	addi $t0, $t0, 1
    	addi $t4, $t4, 1   # Move to the next character in the string
    	j to_get_LandOHandM1  
digit33:
    	sb $s3, 3($a3) 
    	addi $t0, $t0, 1
    	addi $t4, $t4, 1   # Move to the next character in the string
    	j to_get_LandOHandM1 
digit44:
    	sb $s3, 4($a3) 
    	addi $t0, $t0, 1
    	addi $t4, $t4, 1   # Move to the next character in the string
    	j to_get_LandOHandM1
check_if_LorOHorM1:
    	addi $t4, $t4, 1
    	lb $t2, 0($t4)
    	beqz $t2, not_found0 # If null terminator is reached, the colon is not found
    	beq $t2, 'L', stor_in_L1
    	beq $t2, 'O', stor_in_OH1
    	beq $t2, 'M', stor_in_M1
stor_in_L1:
    	move $s0, $a3
    	la $a3, three
    	sb $zero, 0($a3)
    	sb $zero, 1($a3)
    	sb $zero, 2($a3)
    	sb $zero, 3($a3)
    	sb $zero, 4($a3)
    	li $t0, 0          # Initialize index to 0
    	li $t2, 0
    	li $s3, 0          # Initialize index to 0
    	li $s4, 0
    	move $t4, $t5
    	li $k0, 1 	#flag
    	li $t1, 0 #counter
    	li $t5, 0
    	li $t6, 0
    	li $t8, 0
    	li $t9, 0
    	la $t2, three
    	sb $zero, 0($t2)
    	sb $zero, 1($t2)
    	sb $zero, 2($t2)
    	sb $zero, 3($t2)
    	sb $zero, 4($t2)
    	move $t2, $t4
    	#now let us split the hours at the character "-"
    	li $t4, 0
    	move $t9, $s0
    	la $t8, the_number_one
    	li $t3, 0
    	la $t3, ayman10
    	sb $zero, 0($t3)
    	sb $zero, 1($t3)
    	la $t4, ayman11
    	sb $zero, 0($t4)
    	sb $zero, 1($t4)
    	j loop_seperate_hours_L   
stor_in_OH1:
    	move $s1, $a3 
    	la $a3, three
    	sb $zero, 0($a3)
    	sb $zero, 1($a3)
    	sb $zero, 2($a3)
    	sb $zero, 3($a3)
    	sb $zero, 4($a3)
    	li $t0, 0          # Initialize index to 0
    	li $t2, 0
    	li $s3, 0          # Initialize index to 0
    	li $s4, 0
    	move $t4, $t5
    	li $k0, 1 	#flag
    	li $t1, 0 #counter
    	li $t5, 0
    	li $t6, 0
    	li $t8, 0
   	li $t9, 0
    	la $t2, three
    	sb $zero, 0($t2)
    	sb $zero, 1($t2)
    	sb $zero, 2($t2)
    	sb $zero, 3($t2)
    	sb $zero, 4($t2)
    	move $t2, $t4
    	#now let us split the hours at the character "-"
    	li $t4, 0
    	move $t9, $s1
    	la $t8, the_number_one
    	li $t3, 0
    	la $t3, ayman12
    	sb $zero, 0($t3)
    	sb $zero, 1($t3)
    	la $t4, ayman13
    	sb $zero, 0($t4)
    	sb $zero, 1($t4)
    	j loop_seperate_hours_M    
stor_in_M1:
    	move $s2, $a3
    	la $a3, three
    	sb $zero, 0($a3)
    	sb $zero, 1($a3)
    	sb $zero, 2($a3)
    	sb $zero, 3($a3)
    	sb $zero, 4($a3)
    	li $t0, 0          # Initialize index to 0
    	li $t2, 0
    	li $s3, 0          # Initialize index to 0
    	li $s4, 0
    	move $t4, $t5
    	li $k0, 1 	#flag
    	li $t1, 0 #counter
    	li $t5, 0
    	li $t6, 0
    	li $t8, 0
    	li $t9, 0
    	la $t2, three
    	sb $zero, 0($t2)
    	sb $zero, 1($t2)
    	sb $zero, 2($t2)
    	sb $zero, 3($t2)
    	sb $zero, 4($t2)
    	move $t2, $t4
    	#now let us split the hours at the character "-"
    	li $t4, 0
    	move $t9, $s2
    	la $t8, the_number_one
    	li $t3, 0
    	la $t3, ayman3
    	sb $zero, 0($t3)
    	sb $zero, 1($t3)
    	la $t4, ayman1
    	sb $zero, 0($t4)
    	sb $zero, 1($t4)
    	j loop_seperate_hours       
to_get_LandOHandM2:
    	lb $s3, 0($t4)     # Load a byte from the string
    	beqz $s3, not_found0 # If null terminator is reached, the colon is not found
    	beq $s3, ' ', check_if_LorOHorM2# If colon is found, jump to the found_colon label
    	beq $t0, 0, digit000
    	beq $t0, 1, digit111
    	beq $t0, 2, digit222
    	beq $t0, 3, digit333
    	beq $t0, 4, digit444
    	addi $t0, $t0, 1   # Move to the next character in the string
    	j to_get_LandOHandM2 
digit000:
    	sb $s3, 0($a3) 
    	addi $t0, $t0, 1
    	addi $t4, $t4, 1   # Move to the next character in the string
    	j to_get_LandOHandM2
digit111:
    	sb $s3, 1($a3) 
    	addi $t0, $t0, 1
    	addi $t4, $t4, 1   # Move to the next character in the string
    	j to_get_LandOHandM2 
digit222:
    	sb $s3, 2($a3) 
    	addi $t0, $t0, 1
    	addi $t4, $t4, 1   # Move to the next character in the string
    	j to_get_LandOHandM2  
digit333:
    	sb $s3, 3($a3) 
    	addi $t0, $t0, 1
    	addi $t4, $t4, 1   # Move to the next character in the string
    	j to_get_LandOHandM2 
digit444:
    	sb $s3, 4($a3) 
    	addi $t0, $t0, 1
    	addi $t4, $t4, 1   # Move to the next character in the string
    	j to_get_LandOHandM2
check_if_LorOHorM2:
    	addi $t4, $t4, 1
    	lb $t2, 0($t4)
    	beqz $t2, not_found0 # If null terminator is reached, the colon is not found
    	beq $t2, 'L', stor_in_L2
    	beq $t2, 'O', stor_in_OH2
    	beq $t2, 'M', stor_in_M2
stor_in_L2:
    	move $s0, $a3  
    	li $k0, 2 	#flag
    	li $t1, 0 #counter
    	li $t5, 0
    	li $t6, 0
    	li $t8, 0
    	li $t9, 0
    	la $t2, three
    	move $t2, $t4
   	#now let us split the hours at the character "-"
    	li $t4, 0
    	move $t9, $s0
    	la $t8, the_number_one_L
    	li $t3, 0
    	la $t3, ayman4
    	sb $zero, 0($t3)
    	sb $zero, 1($t3)
    	la $t4, ayman1
    	sb $zero, 0($t4)
    	sb $zero, 1($t4)
loop_seperate_hours_L:
    	lb $t0, 0($t9)     # Load a byte from the string
    	beq $t0, '-', split_hour_here_L# If colon is found, jump to the found_colon label
    	beq $t1, 1, two_digit_first_hour_L
    	sb $t0, 0($t3)
    	addi $t1, $t1, 1
    	addi $t9, $t9, 1
    	j loop_seperate_hours_L
two_digit_first_hour_L:
    	sb $t0, 1($t3) 
    	addi $t9, $t9, 1
    	j loop_seperate_hours_L
split_hour_here_L:
    	#now that we are here, that means the character after it is an hour, but it may be either one digit, or 2 digits
    	addi $t9, $t9, 1 #we moved to the next character after "-"
    	lb $t0, 0($t9)     # Load a byte from the string
    	lb $t7, 0($t8) #we stored the string 1 to compare with the latter, to check if it is a 2-digit-number (10,11,12)
    	beqz $t0, done_seperating_L
    	beq $t0, $t7, two_digit_second_hour_L
    	sb $t0, 0($t4)
    	j split_hour_here_L
two_digit_second_hour_L:
	#now we are not sure that this is a 2-digit-number, it could be 10, 11, 12, or 1
    	sb $t0, 0($t4)
    	addi $t9, $t9, 1 #we moved to the next character after "-" 
    	lb $t0, 0($t9)
    	sb $t0, 1($t4) #us reaching here means that the number is a 2-digit number
    	j done_seperating_L
done_seperating_L:
    	li $t9, 0 
    	li $t0, 0
    	li $t1, 0
    	lb $t0, 0($t3)         # Load the first character of the ASCII string
    	lb $t1, 1($t3)         # Load the second character of the ASCII string
    	beqz $t1, one_digit_first_hour_L
    	subi $t0, $t0, 0x30    # Convert the first character to its integer value
    	subi $t1, $t1, 0x30    # Convert the second character to its integer value
    	li $t5, 0              # Initialize $k1 to zero
    	mul $t5, $t0, 10       # Multiply the first digit by 10
    	add $t5, $t5, $t1      # Add the second digit to the result
    	j second_hour_conversion_L
one_digit_first_hour_L:
    	subi $t0, $t0, 0x30    # Convert the first character to its integer value
    	move $t5, $t0
second_hour_conversion_L:    
    	li $t0, 0
    	li $t1, 0  
    	lb $t0, 0($t4)         # Load the first character of the ASCII string
    	lb $t1, 1($t4)         # Load the second character of the ASCII string
    	beqz $t1, one_digit_second_hour_L
    	subi $t0, $t0, 0x30    # Convert the first character to its integer value
    	subi $t1, $t1, 0x30    # Convert the second character to its integer value
    	li $t6, 0              # Initialize $k1 to zero
    	mul $t6, $t0, 10       # Multiply the first digit by 10
    	add $t6, $t6, $t1      # Add the second digit to the result
    	j string_finished_L
one_digit_second_hour_L:
    	subi $t0, $t0, 0x30    # Convert the first character to its integer value
    	move $t6, $t0
string_finished_L: 
	#what we have now is:
	#first hour stored inside $t5
	#second hour stored inside $t6
	#day number stored inside $k1
	#first, let us convert the hours into 24-hour format
	#Second, we will subtract the first hour from the second hour
	#third, we will initialize a counter
	#fourth, we will enter a loop that will add 1 to the first number and store in different variables, and add one to the counter, 
	#until the counter is equal to the subtract value
	#fifth, we will add to the array [row][column] = [dayNumber][hour in 24-format] (this will be done inside the loop)
	#8 9 10 11 12 13 14 15 16 17
	#six, since the 24-hour format will mess up everything, we will make beq 8 , make index 0, beq 17, make index 9, and so on
	#8 -> 0
	#9 -> 1
	#10 -> 2
	#11 -> 3
	#12 -> 4
	#13 -> 5
	#14 -> 6
	#15 -> 7
	#16 -> 8
	#17 -> 9
	#note: variables I am allowed to use :
	li $t1, 0 
    	li $t8, 0
    	li $t9, 0
    	li $t0, 0
	#let us start
	#first
	beq $t5, 1, convert_to_24_format_t5_L
	beq $t5, 2, convert_to_24_format_t5_L
	beq $t5, 3, convert_to_24_format_t5_L
	beq $t5, 4, convert_to_24_format_t5_L
	beq $t5, 5, convert_to_24_format_t5_L
	j move_on_to_second_L
convert_to_24_format_t5_L:
	addi $t5, $t5, 12
move_on_to_second_L:
	beq $t6, 1, convert_to_24_format_t6_L
	beq $t6, 2, convert_to_24_format_t6_L
	beq $t6, 3, convert_to_24_format_t6_L
	beq $t6, 4, convert_to_24_format_t6_L
	beq $t6, 5, convert_to_24_format_t6_L
	j move_on_from_second_L
convert_to_24_format_t6_L:
	addi $t6, $t6, 12
move_on_from_second_L:
	#second
	sub $t6, $t6, $t5 #now $t6 changed from a variable holding value of second hour, to a register holding value of subtraction	
	#third
	li $t1, 0#this is a counter, that will be incremented in the loop and the loop will exit when this counter reachesvalue of subtration stored inside t6
	#fourth
loop_store_hours_in_variables_L:
	beq $t1, $t6, exit_loop_store_hours_in_variables_L
	#add to array here
	#but before we add, we need to set the index right
	move $t8, $t5
	j set_index_for_hour_L
return_to_loop_from_setting_index_L:
    	# Index = base_address + ((row × columns + column) × 4)
    	# $k1(row)
    	# $t8 (column)
    	li $t9, 10  # number of columns
    	mul $t0, $k1, $t9
    	add $t0, $t0, $t8
    	mul $t0, $t0, 4  # now $t0 contains the index
    	#Calculate the address of array[index]
    	add $t0, $t0, $v1  # now $t0 contains the address
    	#Store the value at array[index]
    	li $t8, 1
    	sw $t8, 0($t0)
	addi $t5, $t5, 1 #increment the hour
	addi $t1, $t1, 1 #increment counter
	j loop_store_hours_in_variables_L
set_index_for_hour_L:
	beq $t8, 9, set_index_for_9_L
	beq $t8, 10, set_index_for_10_L
	beq $t8, 11, set_index_for_11_L
	beq $t8, 12, set_index_for_12_L
	beq $t8, 13, set_index_for_13_L
	beq $t8, 14, set_index_for_14_L
	beq $t8, 15, set_index_for_15_L
	beq $t8, 16, set_index_for_16_L
	beq $t8, 17, set_index_for_17_L
	li $t8, 0
	j return_to_loop_from_setting_index_L
set_index_for_9_L:
	li $t8, 1
	j return_to_loop_from_setting_index_L
set_index_for_10_L:
	li $t8, 2
	j return_to_loop_from_setting_index_L
set_index_for_11_L:
	li $t8, 3
	j return_to_loop_from_setting_index_L
set_index_for_12_L:
	li $t8, 4
	j return_to_loop_from_setting_index_L
set_index_for_13_L:
	li $t8, 5
	j return_to_loop_from_setting_index_L
set_index_for_14_L:
	li $t8, 6
	j return_to_loop_from_setting_index_L
set_index_for_15_L:
	li $t8, 7
	j return_to_loop_from_setting_index_L
set_index_for_16_L:
	li $t8, 8
	j return_to_loop_from_setting_index_L
set_index_for_17_L:
	li $t8, 9
	j return_to_loop_from_setting_index_L
exit_loop_store_hours_in_variables_L:
    	beq $k0, 0, jump_split2_L
    	beq $k0, 1, jump_to_get_LandOHandM2_L
    	beq $k0, 2, jump_read_loop0_L
jump_to_get_LandOHandM2_L:
    	li $t0, 0
    	li $t1, 0 #counter
    	li $t4, 0
    	li $t5, 0
    	li $t6, 0
    	li $t8, 0
    	li $t9, 0
    	move $t4, $t2
    	j to_get_LandOHandM2
jump_split2_L:
    	li $a3, 0
    	li $t8, 0
    	la $a3, two
    	j split2 
jump_read_loop0_L:
    	b read_loop0
stor_in_OH2:
    	move $s1, $a3   
    	li $k0, 2 	#flag
    	li $t1, 0 #counter
    	li $t5, 0
    	li $t6, 0
    	li $t8, 0
    	li $t9, 0
    	la $t2, three
    	move $t2, $t4
    	#now let us split the hours at the character "-"
    	li $t4, 0
    	move $t9, $s1
    	la $t8, the_number_one_OH
    	li $t3, 0
    	la $t3, ayman5
    	sb $zero, 0($t3)
    	sb $zero, 1($t3)
    	la $t4, ayman1
    	sb $zero, 0($t4)
    	sb $zero, 1($t4)
loop_seperate_hours_M:
    	lb $t0, 0($t9)     # Load a byte from the string
    	beq $t0, '-', split_hour_here_M# If colon is found, jump to the found_colon label
    	beq $t1, 1, two_digit_first_hour_M
    	sb $t0, 0($t3)
    	addi $t1, $t1, 1
    	addi $t9, $t9, 1
    	j loop_seperate_hours_M
two_digit_first_hour_M:
    	sb $t0, 1($t3) 
    	addi $t9, $t9, 1
    	j loop_seperate_hours_M
split_hour_here_M:
    	#now that we are here, that means the character after it is an hour, but it may be either one digit, or 2 digits
    	addi $t9, $t9, 1 #we moved to the next character after "-"
    	lb $t0, 0($t9)     # Load a byte from the string
    	lb $t7, 0($t8) #we stored the string 1 to compare with the latter, to check if it is a 2-digit-number (10,11,12)
    	beqz $t0, done_seperating_M
    	beq $t0, $t7, two_digit_second_hour_M
    	sb $t0, 0($t4)
    	j split_hour_here_M
two_digit_second_hour_M:
	#now we are not sure that this is a 2-digit-number, it could be 10, 11, 12, or 1
    	sb $t0, 0($t4)
    	addi $t9, $t9, 1 #we moved to the next character after "-" 
    	lb $t0, 0($t9)
    	sb $t0, 1($t4) #us reaching here means that the number is a 2-digit number
    	j done_seperating_M
done_seperating_M:
    	li $t9, 0 
    	li $t0, 0
    	li $t1, 0
    	lb $t0, 0($t3)         # Load the first character of the ASCII string
    	lb $t1, 1($t3)         # Load the second character of the ASCII string
    	beqz $t1, one_digit_first_hour_M
    	subi $t0, $t0, 0x30    # Convert the first character to its integer value
    	subi $t1, $t1, 0x30    # Convert the second character to its integer value
    	li $t5, 0              # Initialize $k1 to zero
    	mul $t5, $t0, 10       # Multiply the first digit by 10
    	add $t5, $t5, $t1      # Add the second digit to the result
    	j second_hour_conversion_M
one_digit_first_hour_M:
    	subi $t0, $t0, 0x30    # Convert the first character to its integer value
    	move $t5, $t0
second_hour_conversion_M:    
    	li $t0, 0
    	li $t1, 0    
    	lb $t0, 0($t4)         # Load the first character of the ASCII string
    	lb $t1, 1($t4)         # Load the second character of the ASCII string
    	beqz $t1, one_digit_second_hour_M
    	subi $t0, $t0, 0x30    # Convert the first character to its integer value
    	subi $t1, $t1, 0x30    # Convert the second character to its integer value
    	li $t6, 0              # Initialize $k1 to zero
    	mul $t6, $t0, 10       # Multiply the first digit by 10
    	add $t6, $t6, $t1      # Add the second digit to the result
    	j string_finished_M
one_digit_second_hour_M:
    	subi $t0, $t0, 0x30    # Convert the first character to its integer value
    	move $t6, $t0
    	# The result is now in $t6   
string_finished_M:  
	#note: variables I am allowed to use :
    	li $t1, 0 
    	li $t8, 0
    	li $t9, 0
    	li $t0, 0
	#let us start
	#first
	beq $t5, 1, convert_to_24_format_t5_OH
	beq $t5, 2, convert_to_24_format_t5_OH
	beq $t5, 3, convert_to_24_format_t5_OH
	beq $t5, 4, convert_to_24_format_t5_OH
	beq $t5, 5, convert_to_24_format_t5_OH
	j move_on_to_second_OH
convert_to_24_format_t5_OH:
	addi $t5, $t5, 12
move_on_to_second_OH:
	beq $t6, 1, convert_to_24_format_t6_OH
	beq $t6, 2, convert_to_24_format_t6_OH
	beq $t6, 3, convert_to_24_format_t6_OH
	beq $t6, 4, convert_to_24_format_t6_OH
	beq $t6, 5, convert_to_24_format_t6_OH
	j move_on_from_second_OH
convert_to_24_format_t6_OH:
	addi $t6, $t6, 12
move_on_from_second_OH:
	#second
	sub $t6, $t6, $t5 #now $t6 changed from a variable holding value of second hour, to a register holding value of subtraction
	#third
	li $t1, 0#this is a counter, that will be incremented in the loop and the loop will exit when this counter reachesvalue of subtration stored inside t6
	#fourth
loop_store_hours_in_variables_OH:
	beq $t1, $t6, exit_loop_store_hours_in_variables_OH
	move $t8, $t5
	j set_index_for_hour_OH
return_to_loop_from_setting_index_OH:
    	# Index = base_address + ((row × columns + column) × 4)
    	# $k1(row)
    	# $t8 (column)
    	li $t9, 10  # number of columns
    	mul $t0, $k1, $t9
    	add $t0, $t0, $t8
    	mul $t0, $t0, 4  # now $t0 contains the index
    	#Calculate the address of array[index]
    	add $t0, $t0, $v1  # now $t0 contains the address
    	#Store the value at array[index]
    	li $t8, 2
    	sw $t8, 0($t0)
	addi $t5, $t5, 1 #increment the hour
	addi $t1, $t1, 1 #increment counter
	j loop_store_hours_in_variables_OH
set_index_for_hour_OH:
	beq $t8, 9, set_index_for_9_OH
	beq $t8, 10, set_index_for_10_OH
	beq $t8, 11, set_index_for_11_OH
	beq $t8, 12, set_index_for_12_OH
	beq $t8, 13, set_index_for_13_OH
	beq $t8, 14, set_index_for_14_OH
	beq $t8, 15, set_index_for_15_OH
	beq $t8, 16, set_index_for_16_OH
	beq $t8, 17, set_index_for_17_OH
	li $t8, 0
	j return_to_loop_from_setting_index_OH
set_index_for_9_OH:
	li $t8, 1
	j return_to_loop_from_setting_index_OH
set_index_for_10_OH:
	li $t8, 2
	j return_to_loop_from_setting_index_OH
set_index_for_11_OH:
	li $t8, 3
	j return_to_loop_from_setting_index_OH
set_index_for_12_OH:
	li $t8, 4
	j return_to_loop_from_setting_index_OH
set_index_for_13_OH:
	li $t8, 5
	j return_to_loop_from_setting_index_OH
set_index_for_14_OH:
	li $t8, 6
	j return_to_loop_from_setting_index_OH
set_index_for_15_OH:
	li $t8, 7
	j return_to_loop_from_setting_index_OH
set_index_for_16_OH:
	li $t8, 8
	j return_to_loop_from_setting_index_OH
set_index_for_17_OH:
	li $t8, 9
	j return_to_loop_from_setting_index_OH
exit_loop_store_hours_in_variables_OH:
    	beq $k0, 0, jump_split2_M
    	beq $k0, 1, jump_to_get_LandOHandM2_M
    	beq $k0, 2, jump_read_loop0_M
jump_to_get_LandOHandM2_M:
    	li $t0, 0
    	li $t1, 0 #counter
    	li $t4, 0
    	li $t5, 0
    	li $t6, 0
    	li $t8, 0
    	li $t9, 0
    	move $t4, $t2
    	j to_get_LandOHandM2
jump_split2_M:
    	li $a3, 0
    	li $t8, 0
    	la $a3, two
    	j split2 
jump_read_loop0_M:
	li $a2, 0
    	move $a2, $zero
    	b read_loop0
stor_in_M2: #we will save the value 3 into the 2d array
    	move $s2, $a3
    	#now we store in the array
    	#we have the day number in this cuurent line stored inside k1
    	#we have the meeting hours stored inside s2, need to be split at the character "-"
    	#After we split the hours, they would still be string. So, we will convert them to integer.
    	# After that, we will subtract them from each other (after converting them to 24 hour-format), and put each hour in a separate variable
    	#after the hours are stored in the variables, an hour represents the column in the array
    	#hence [row][column] = [day number][hour]
    	#since we are now certain that those hours are meeting hours, we will store the value (3) in the array
    	#the only cases where an hour is a 2_digit number is:
    	# 10, 11, 12
    	#there are only three cases, and in all of those 3, the first character is "1"
    	li $t0, 0
    	li $t1, 0 #counter
    	li $t4, 0
    	li $t5, 0
    	li $t6, 0
    	li $t8, 0
    	li $t9, 0    
    	#now let us split the hours at the character "-"
    	li $k0, 2
    	move $t9, $s2
    	la $t8, the_number_one
    	li $t3, 0
    	la $t3, ayman
    	sb $zero, 0($t3)
    	sb $zero, 1($t3)
    	la $t4, ayman1
    	sb $zero, 0($t4)
    	sb $zero, 1($t4)
loop_seperate_hours:
    	lb $t0, 0($t9)     # Load a byte from the string
    	beq $t0, '-', split_hour_here# If colon is found, jump to the found_colon label
    	beq $t1, 1, two_digit_first_hour
    	sb $t0, 0($t3)
    	addi $t1, $t1, 1
    	addi $t9, $t9, 1
    	j loop_seperate_hours
two_digit_first_hour:
    	sb $t0, 1($t3) 
    	addi $t9, $t9, 1
    	j loop_seperate_hours
split_hour_here:
    	#now that we are here, that means the character after it is an hour, but it may be either one digit, or 2 digits
    	addi $t9, $t9, 1 #we moved to the next character after "-"
    	lb $t0, 0($t9)     # Load a byte from the string
    	lb $t7, 0($t8) #we stored the string 1 to compare with the latter, to check if it is a 2-digit-number (10,11,12)
    	beqz $t0, done_seperating
    	beq $t0, $t7, two_digit_second_hour
    	sb $t0, 0($t4)
    	j split_hour_here
two_digit_second_hour:
	#now we are not sure that this is a 2-digit-number, it could be 10, 11, 12, or 1
    	sb $t0, 0($t4)
    	addi $t9, $t9, 1 #we moved to the next character after "-" 
    	lb $t0, 0($t9)
    	sb $t0, 1($t4) #us reaching here means that the number is a 2-digit number
    	j done_seperating
done_seperating:
	#now we have the first hour in the register $t3, and the second hour in register $t4, but as strings.
	#let's convert them to integers
	#let's start with the first hour    
    	#now with the second hour
    	li $t9, 0
    	li $t0, 0
    	li $t1, 0  
    	lb $t0, 0($t3)         # Load the first character of the ASCII string
    	lb $t1, 1($t3)         # Load the second character of the ASCII string
    	beqz $t1, one_digit_first_hour
    	subi $t0, $t0, 0x30    # Convert the first character to its integer value
    	subi $t1, $t1, 0x30    # Convert the second character to its integer value
    	li $t5, 0              # Initialize $k1 to zero
    	mul $t5, $t0, 10       # Multiply the first digit by 10
    	add $t5, $t5, $t1      # Add the second digit to the result
    	j second_hour_conversion
one_digit_first_hour:
    	subi $t0, $t0, 0x30    # Convert the first character to its integer value
    	move $t5, $t0
    	# The result is now in $t5
second_hour_conversion:    
	#now with the second hour
    	li $t0, 0
    	li $t1, 0   
    	lb $t0, 0($t4)         # Load the first character of the ASCII string
    	lb $t1, 1($t4)         # Load the second character of the ASCII string
    	beqz $t1, one_digit_second_hour
    	subi $t0, $t0, 0x30    # Convert the first character to its integer value
    	subi $t1, $t1, 0x30    # Convert the second character to its integer value
    	li $t6, 0              # Initialize $k1 to zero
    	mul $t6, $t0, 10       # Multiply the first digit by 10
    	add $t6, $t6, $t1      # Add the second digit to the result
    	j string_finished
one_digit_second_hour:
    	subi $t0, $t0, 0x30    # Convert the first character to its integer value
    	move $t6, $t0
    	# The result is now in $t6
string_finished:
    	li $t1, 0 
    	li $t8, 0
    	li $t9, 0
    	li $t0, 0
	#let us start
	#first
	beq $t5, 1, convert_to_24_format_t5
	beq $t5, 2, convert_to_24_format_t5
	beq $t5, 3, convert_to_24_format_t5
	beq $t5, 4, convert_to_24_format_t5
	beq $t5, 5, convert_to_24_format_t5
	j move_on_to_second
convert_to_24_format_t5:
	addi $t5, $t5, 12
move_on_to_second:
	beq $t6, 1, convert_to_24_format_t6
	beq $t6, 2, convert_to_24_format_t6
	beq $t6, 3, convert_to_24_format_t6
	beq $t6, 4, convert_to_24_format_t6
	beq $t6, 5, convert_to_24_format_t6
	j move_on_from_second
convert_to_24_format_t6:
	addi $t6, $t6, 12
move_on_from_second:
	#second
	sub $t6, $t6, $t5 #now $t6 changed from a variable holding value of second hour, to a register holding value of subtraction
	#third
	li $t1, 0#this is a counter, that will be incremented in the loop and the loop will exit when this counter reachesvalue of subtration stored inside t6
	#fourth
loop_store_hours_in_variables:
	beq $t1, $t6, exit_loop_store_hours_in_variables
	#add to array here
	#but before we add, we need to set the index right
	move $t8, $t5
	j set_index_for_hour
return_to_loop_from_setting_index:
    	# Index = base_address + ((row × columns + column) × 4)
    	# $k1(row)
    	# $t8 (column)
    	li $t9, 10  # number of columns
    	mul $t0, $k1, $t9
    	add $t0, $t0, $t8
    	mul $t0, $t0, 4  # now $t0 contains the index
    	#Calculate the address of array[index]
    	add $t0, $t0, $v1  # now $t0 contains the address
    	#Store the value at array[index]
    	li $t8, 3
    	sw $t8, 0($t0)
	addi $t5, $t5, 1 #increment the hour
	addi $t1, $t1, 1 #increment counter
	j loop_store_hours_in_variables
set_index_for_hour:
	beq $t8, 9, set_index_for_9
	beq $t8, 10, set_index_for_10
	beq $t8, 11, set_index_for_11
	beq $t8, 12, set_index_for_12
	beq $t8, 13, set_index_for_13
	beq $t8, 14, set_index_for_14
	beq $t8, 15, set_index_for_15
	beq $t8, 16, set_index_for_16
	beq $t8, 17, set_index_for_17
	li $t8, 0
	j return_to_loop_from_setting_index
set_index_for_9:
	li $t8, 1
	j return_to_loop_from_setting_index
set_index_for_10:
	li $t8, 2
	j return_to_loop_from_setting_index
set_index_for_11:
	li $t8, 3
	j return_to_loop_from_setting_index
set_index_for_12:
	li $t8, 4
	j return_to_loop_from_setting_index
set_index_for_13:
	li $t8, 5
	j return_to_loop_from_setting_index
set_index_for_14:
	li $t8, 6
	j return_to_loop_from_setting_index
set_index_for_15:
	li $t8, 7
	j return_to_loop_from_setting_index
set_index_for_16:
	li $t8, 8
	j return_to_loop_from_setting_index
set_index_for_17:
	li $t8, 9
	j return_to_loop_from_setting_index
exit_loop_store_hours_in_variables:
    	beq $k0, 0, jump_split2
    	beq $k0, 1, jump_to_get_LandOHandM2
    	beq $k0, 2, jump_read_loop0
jump_to_get_LandOHandM2:
    	li $t0, 0
    	li $t1, 0 #counter
    	li $t4, 0
    	li $t5, 0
    	li $t6, 0
    	li $t8, 0
    	li $t9, 0
    	move $t4, $t2
    	j to_get_LandOHandM2
jump_split2:
    	li $a3, 0
    	li $t8, 0
    	la $a3, two
    	j split2 
jump_read_loop0:
	li $a2, 0
    	move $a2, $zero
    	b read_loop0    
read_done0:
	# close file
    	li $v0, 16    
    	move $a0, $s0  
    	syscall 
print_prompt:
	li $t0, 0
	l.s $f7, float_zero   # Load 0.0 into $f7
    	li $t1, 0          
    	li $t2, 0
    	li $t3, 0
    	li $t4, 0
    	li $t5, 0          
    	li $t6, 0
    	li $t7, 0
    	li $t8, 0         
    	li $t9, 0
    	li $s0, 0
    	li $s1, 0
    	li $s2, 0
    	li $s3, 0
    	li $s4, 0
    	li $s5, 0
    	li $s6, 0    	
    	li $s7, 0    
    	li $a0, 0
    	li $a1, 0
    	li $a2, 0    	
    	li $a3, 0 
    	li $gp, 0
    	li $fp, 0	
	#******menue******
	la $a0,stars
	li $v0, 4
	syscall
	la $a0,menue
	li $v0, 4
	syscall
	li $v0, 5
	syscall	
	beq $v0, 1, view_calendar
	beq $v0, 2, View_Statistics	
	beq $v0, 3, Add_a_new_appointment
	beq $v0, 4, Delete_an_appointment
	beq $v0, 5, exit_the_program_final
view_calendar:
	#******view calendar******
	li $k0, 0 	#flag
	la $a0, Calendar
	li $v0, 4
	syscall
	li $v0, 5
	syscall	
	beq $v0, 1, view_per_day
	beq $v0, 2, view_per_set_of_days
	beq $v0, 3, view_per_given_slot
	beq $v0, 4, back_to_menue
view_per_day:
	#******view per day******	
	li $k0, 0 	#flag
	la $a0,view_per_day_str
	li $v0, 4
	syscall
	li $v0, 8
	la $a0, str1 # $a0 = address of str
	li $a1, 100 # $a1 = max string length
	syscall
	move $t8, $a0 #let's move the number of day to a variable that no one can touch
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
    	la $a0,stars
	li $v0, 4
	syscall
	li $t7, 0 	#counter
    	move $a2, $t8 		#we put the string of number of days in a2
    	li $t9, 0
    	la $t9, user_input_1 	#we put the address of a new variable in a3   
    	sb $zero, 0($t9)
    	sb $zero, 1($t9)	
store_input:
    	lb $t1, 0($a2)     # Load a byte from the string
    	beqz $t1, finished 	# If null terminator is reached, then we finished reading
    	beq $t7, 1, two_digit_number1
    	sb $t1, 0($t9)
    	addi $t7, $t7, 1
    	addi $a2, $a2, 1   	# Move to the next character in the string
    	j store_input     	
view_per_set_of_days:
	li $k1, 0	#counter
	li $gp, 0	
	la $a0, view_per_set_of_days_str
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $gp, $v0
	j loops	
loops:
	beq $k1, $gp, exit
	j view_per_day_1	
exit:
	j view_calendar	
view_per_day_1:
	#******view per day******	
	li $k0, 1 	#flag
	la $a0,view_per_day_str
	li $v0, 4
	syscall
	li $v0, 8
	la $a0, str1 # $a0 = address of str
	li $a1, 100 # $a1 = max string length
	syscall
	move $t8, $a0 #let's move the number of day to a variable that no one can touch
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
    	la $a0,stars
	li $v0, 4
	syscall
	li $t7, 0 	#counter
    	move $a2, $t8 		#we put the string of number of days in a2
    	li $t9, 0
    	la $t9, user_input_1 	#we put the address of a new variable in a3 
    	sb $zero, 0($t9)
    	sb $zero, 1($t9)  		
store_input_1:
    	lb $t1, 0($a2)     # Load a byte from the string
    	beqz $t1, finished 	# If null terminator is reached, then we finished reading
    	beq $t7, 1, two_digit_number1
    	sb $t1, 0($t9)
    	addi $t7, $t7, 1
    	addi $a2, $a2, 1   	# Move to the next character in the string
    	j store_input_1	
back_to_menue:
	li $t0, 0
    	li $t1, 0          
    	li $t2, 0
    	li $t3, 0
    	li $t4, 0
    	li $t5, 0          
    	li $t6, 0
    	li $t7, 0
    	li $t8, 0      
    	li $t9, 0
    	li $s0, 0
    	li $s1, 0
    	li $s2, 0
    	li $s3, 0
    	li $s4, 0
    	li $s5, 0
    	li $s6, 0    	
    	li $s7, 0    
    	li $a0, 0
    	li $a1, 0
    	li $a2, 0    	
    	li $a3, 0  	
	j print_prompt 	      
two_digit_number1:
    	sb $t1, 1($t9) 
    	addi $t7, $t7, 1
    	j finished           	
finished:	
	li $t2, 0
    	li $t3, 0    	
    	lb $t2, 0($t9)         # Load the first character of the ASCII string
    	lb $t3, 1($t9)         # Load the second character of the ASCII string
    	sb $zero, 0($t9)
    	sb $zero, 1($t9)	
    	beq $t3, 0x0a, one_digit_integer_conversion_in_view_per_day1    	
    	subi $t2, $t2, 0x30    # Convert the first character to its integer value
    	subi $t3, $t3, 0x30    # Convert the second character to its integer value
    	li $t9, 0              # Initialize $t4 to zero
    	mul $t9, $t2, 10       # Multiply the first digit by 10
    	add $t9, $t9, $t3      # Add the second digit to the result
    	j string_finished_integer_conversion_in_view_per_day1
one_digit_integer_conversion_in_view_per_day1:
    	subi $t2, $t2, 0x30    # Convert the first character to its integer value
    	li $t9, 0  
    	move $t9, $t2
    	# The result is now in $t4
string_finished_integer_conversion_in_view_per_day1:
	la $s1 str
	la $s2 one_word
    	li $s3 0      # current line length
   	# open file
    	li $v0 13     # syscall for open file
    	la $a0 calendar_file_copy    # input file name
    	li $a1 0      # read flag
    	li $a2 0      # ignore mode 
    	syscall       # open file 
    	move $s0 $v0  # save the file descriptor 
read_loop:
    	# read byte from file
    	li $v0 14     # syscall for read file
    	move $a0 $s0  # file descriptor 
    	move $a1 $s1  # address of dest buffer
    	li $a2 1      # buffer length
    	syscall       # read byte from file
    	# keep reading until bytes read <= 0
    	blez $v0 read_done
    	# naively handle exceeding line size by exiting
    	slti $t0 $s3 1024
    	beqz $t0 read_done
    	# if current byte is a newline, consume line
    	lb $s4 ($s1)
    	li $t0 10
    	beq $s4 $t0 consume_line
    	add $s5 $s3 $s2		# otherwise, append byte to line
    	sb $s4 ($s5)
    	addi $s3 $s3 1		 # increment line length
   	b read_loop  	
consume_line:
    	# null terminate line
    	add $s5 $s3 $s2
    	sb $zero ($s5)    	
    	li $s3 0
	move $a2, $s2
    	li $t4, 0
    	li $t8, 0          
    	li $t7, 0
     	li $s3, 0
    	li $t1, 0
    	la $t4, first_two_letters_1 
    	sb $zero, 0($t4)
    	sb $zero, 1($t4)
    	#add.s $f7, $f7, $f1  	
find_colon:
    	lb $t1, 0($a2)     # Load a byte from the string
    	beqz $t1, not_found # If null terminator is reached, the colon is not found
    	beq $t1, ':', found_colon # If colon is found, jump to the found_colon label
    	beq $t7, 1, two_digit_number
    	sb $t1, 0($t4)
    	addi $t7, $t7, 1
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j find_colon     	
two_digit_number:
    	sb $t1, 1($t4) 
    	addi $a2, $a2, 1   # Move to the next character in the string
    	j find_colon        # Jump back to find_colon
found_colon:
   	# At this point, $t0 contains the index of the colon in the string
    	# Move to the character after the colon
    	li $t2, 0
    	li $t3, 0
    	lb $t2, 0($t4)         # Load the first character of the ASCII string
    	lb $t3, 1($t4)         # Load the second character of the ASCII string        
    	beqz $t3, one_digit_integer_conversion_in_view_per_day  	
    	subi $t2, $t2, 0x30    # Convert the first character to its integer value
    	subi $t3, $t3, 0x30    # Convert the second character to its integer value
    	li $t4, 0              # Initialize $t4 to zero
    	mul $t4, $t2, 10       # Multiply the first digit by 10
    	add $t4, $t4, $t3      # Add the second digit to the result
    	j string_finished_integer_conversion_in_view_per_day
one_digit_integer_conversion_in_view_per_day:
    	subi $t2, $t2, 0x30    # Convert the first character to its integer value
    	li $t4, 0  
    	move $t4, $t2
    	# The result is now in $t4
string_finished_integer_conversion_in_view_per_day:
	beq $t4, $t9, strings_equal
	j not_equal	
not_equal:
    	li $s7, 0
    	b read_loop     		
strings_equal:
    	# Print everything after the colon
    	addi $a2, $a2, 1   # Move to the character after the colon
    	li $v0, 4           
    	move $a0, $a2
    	syscall
    	j read_done
not_found:
	j view_calendar   	
read_done:
    	# close file
    	li $v0, 16    
    	move $a0, $s0  
    	syscall 
    	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------  
    	la $a0,stars
	li $v0, 4
	syscall
    	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------  
    	beqz $k0, return_to_view_calendar
    	addi $k1, $k1, 1
    	j loops
return_to_view_calendar:   	
    	j view_calendar
view_per_given_slot:
	li $t0, 0
    	li $t1, 0          
    	li $t2, 0
    	li $t3, 0
    	li $t4, 0
    	li $t5, 0          
    	li $t6, 0
    	li $t7, 0
    	li $t8, 0         
    	li $t9, 0
    	li $s0, 0
    	li $s1, 0
    	li $s2, 0
    	li $s3, 0
    	li $s4, 0
    	li $s5, 0
    	li $s6, 0    	
    	li $s7, 0    
    	li $a0, 0
    	li $a1, 0
    	li $a2, 0    	
    	li $a3, 0  
    	la $a0,view_per_day_str
	li $v0, 4
	syscall
	li $v0, 8
	la $a0, str1 # $a0 = address of str
	li $a1, 100 # $a1 = max string length
	syscall
	li $t8, 0
	move $t8, $a0 #let's move the number of day to a variable that no one can touch
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
    	la $a0,stars
	li $v0, 4
	syscall
    	la $a0, prompt_start_hour
    	li $v0, 4
    	syscall
    	li $v0, 8
	la $a0, prompt_start_hour_store # $a0 = address of str
	li $a1, 100 # $a1 = max string length
	syscall
	move $t2, $a0 #t2 now has a string value of starting hour
	la $a0, prompt_end_hour
    	li $v0, 4
    	syscall
    	li $v0, 8
	la $a0, prompt_end_hour_store # $a0 = address of str
	li $a1, 100 # $a1 = max string length
	syscall
	move $t3, $a0 #t3 now has a string value of ending hour
	#let us convert the day number to integer
	#then, let us convert the hours to integer
convert_day_to_integer_slot:
    	li $t0, 0
    	li $t4, 0 
    	lb $t0, 0($t8)         # Load the first character of the ASCII string
    	lb $t4, 1($t8)         # Load the second character of the ASCII string
    	beq $t4, 0x0a, one_digit_day_number_slot
    	subi $t0, $t0, 0x30    # Convert the first character to its integer value
    	subi $t4, $t4, 0x30    # Convert the second character to its integer value
    	li $t6, 0              # Initialize $k1 to zero
    	mul $t6, $t0, 10       # Multiply the first digit by 10
    	add $t6, $t6, $t4      # Add the second digit to the result
    	j string_finished_slot
one_digit_day_number_slot:
    	subi $t0, $t0, 0x30    # Convert the first character to its integer value
    	li $t6, 0  
    	move $t6, $t0
    	# The result is now in $t6
string_finished_slot:
	#now, the day number is in its integer form stored in t6
	#let us convert the first hour into integer, which now exists in $t2
convert_day_to_integer_slot_t2:
    	li $t0, 0
    	li $t4, 0 
    	lb $t0, 0($t2)         # Load the first character of the ASCII string
    	lb $t4, 1($t2)         # Load the second character of the ASCII string
    	beq $t4, 0x0a, one_digit_day_number_slot_t2
    	subi $t0, $t0, 0x30    # Convert the first character to its integer value
    	subi $t4, $t4, 0x30    # Convert the second character to its integer value
    	li $s0, 0              # Initialize $k1 to zero
    	mul $s0, $t0, 10       # Multiply the first digit by 10
    	add $s0, $s0, $t4      # Add the second digit to the result
    	j string_finished_slot_t2
one_digit_day_number_slot_t2:
    	subi $t0, $t0, 0x30    # Convert the first character to its integer value
    	li $s0, 0  
    	move $s0, $t0
    	# The result is now in $s0
string_finished_slot_t2:
	#let us convert the first hour into integer, which now exists in $t2	
convert_day_to_integer_slot_t3:
    	li $t0, 0
    	li $t4, 0 
    	lb $t0, 0($t3)         # Load the first character of the ASCII string
    	lb $t4, 1($t3)         # Load the second character of the ASCII string
    	beq $t4, 0x0a, one_digit_day_number_slot_t3
    	subi $t0, $t0, 0x30    # Convert the first character to its integer value
    	subi $t4, $t4, 0x30    # Convert the second character to its integer value
    	li $s1, 0              # Initialize $k1 to zero
    	mul $s1, $t0, 10       # Multiply the first digit by 10
    	add $s1, $s1, $t4      # Add the second digit to the result
    	j string_finished_slot_t3
one_digit_day_number_slot_t3:
    	subi $t0, $t0, 0x30    # Convert the first character to its integer value
    	li $s1, 0  
    	move $s1, $t0
    	# The result is now in $s1
string_finished_slot_t3:
	#now, the day number is in its integer form in t6
	#starting hour is in its integer form in s0
	#end hour is in its integer form in s1
	#now let us subtract the ending hour from the starting hour (we don't need to convert them to 24-hour-format, because the user should input them a such.
	sub $s1, $s1, $s0 #subtraction value is now stored inside s1
	li $s2, 0#this is a counter, that will be incremented in the loop and the loop will exit when this counter reaches value of subtration stored inside s2
	addi $s1, $s1, 1
	#fourth
loop_store_hours_in_variables_slot:
	beq $s2, $s1, exit_loop_store_hours_in_variables_slot
	#loop through array here
	#but before we do, we need to set the index right
	move $s3, $s0
	j set_index_for_hour_slot
return_to_loop_from_setting_index_slot:
    	# Index = base_address + ((row × columns + column) × 4)
    	# $k1(row)
    	# $t8 (column)
    	li $s4, 10  # number of columns
    	mul $t0, $t6, $s4
    	add $t0, $t0, $s3
    	mul $t0, $t0, 4  # now $t0 contains the index
    	#Calculate the address of array[index]
    	add $t0, $t0, $v1  # now $t0 contains the address
    	lw $a0, 0($t0)
    	beq $a0, 1, lecture_label
    	beq $a0, 2, officeHours_label
    	beq $a0, 3, meeting_label
return_from_label_printing:
	addi $s0, $s0, 1 #increment the hour
	addi $s2, $s2, 1 #increment counter
	j loop_store_hours_in_variables_slot
set_index_for_hour_slot:
	beq $s3, 9, set_index_for_9_slot
	beq $s3, 10, set_index_for_10_slot
	beq $s3, 11, set_index_for_11_slot
	beq $s3, 12, set_index_for_12_slot
	beq $s3, 13, set_index_for_13_slot
	beq $s3, 14, set_index_for_14_slot
	beq $s3, 15, set_index_for_15_slot
	beq $s3, 16, set_index_for_16_slot
	beq $s3, 17, set_index_for_17_slot
	li $s3, 0
	j return_to_loop_from_setting_index_slot
set_index_for_9_slot:
	li $s3, 1
	j return_to_loop_from_setting_index_slot
set_index_for_10_slot:
	li $s3, 2
	j return_to_loop_from_setting_index_slot
set_index_for_11_slot:
	li $s3, 3
	j return_to_loop_from_setting_index_slot
set_index_for_12_slot:
	li $s3, 4
	j return_to_loop_from_setting_index_slot
set_index_for_13_slot:
	li $s3, 5
	j return_to_loop_from_setting_index_slot
set_index_for_14_slot:
	li $s3, 6
	j return_to_loop_from_setting_index_slot
set_index_for_15_slot:
	li $s3, 7
	j return_to_loop_from_setting_index_slot
set_index_for_16_slot:
	li $s3, 8
	j return_to_loop_from_setting_index_slot
set_index_for_17_slot:
	li $s3, 9
	j return_to_loop_from_setting_index_slot
lecture_label:
	li $s5, 0
	move $s5, $s3
	beq $s3, 1, set_index_for_1_slot_L
	beq $s3, 2, set_index_for_2_slot_L
	beq $s3, 3, set_index_for_3_slot_L
	beq $s3, 4, set_index_for_4_slot_L
	beq $s3, 5, set_index_for_5_slot_L
	beq $s3, 6, set_index_for_6_slot_L
	beq $s3, 7, set_index_for_7_slot_L
	beq $s3, 8, set_index_for_8_slot_L
	beq $s3, 9, set_index_for_9_slot_L
	li $s5, 8
done_checking_index_L:
	move $a0, $s5
	li $v0, 1
	syscall
	la $a0, this_is_lecture
	li $v0, 4
	syscall
	j return_from_label_printing
officeHours_label:
	li $s5, 0
	move $s5, $s3
	beq $s3, 1, set_index_for_1_slot_OH
	beq $s3, 2, set_index_for_2_slot_OH
	beq $s3, 3, set_index_for_3_slot_OH
	beq $s3, 4, set_index_for_4_slot_OH
	beq $s3, 5, set_index_for_5_slot_OH
	beq $s3, 6, set_index_for_6_slot_OH
	beq $s3, 7, set_index_for_7_slot_OH
	beq $s3, 8, set_index_for_8_slot_OH
	beq $s3, 9, set_index_for_9_slot_OH
	li $s5, 8
done_checking_index_OH:
	move $a0, $s5
	li $v0, 1
	syscall
	la $a0, this_is_office_hours
	li $v0, 4
	syscall
	j return_from_label_printing
meeting_label:
	li $s5, 0
	move $s5, $s3
	beq $s3, 1, set_index_for_1_slot_M
	beq $s3, 2, set_index_for_2_slot_M
	beq $s3, 3, set_index_for_3_slot_M
	beq $s3, 4, set_index_for_4_slot_M
	beq $s3, 5, set_index_for_5_slot_M
	beq $s3, 6, set_index_for_6_slot_M
	beq $s3, 7, set_index_for_7_slot_M
	beq $s3, 8, set_index_for_8_slot_M
	beq $s3, 9, set_index_for_9_slot_M
	li $s5, 8
done_checking_index_M:
	move $a0, $s5
	li $v0, 1
	syscall
	la $a0, this_is_meeting
	li $v0, 4
	syscall
	j return_from_label_printing
set_index_for_1_slot_L:
	li $s5, 9
	j done_checking_index_L
set_index_for_2_slot_L:
	li $s5, 10
	j done_checking_index_L
set_index_for_3_slot_L:
	li $s5, 11
	j done_checking_index_L
set_index_for_4_slot_L:
	li $s5, 12
	j done_checking_index_L
set_index_for_5_slot_L:
	li $s5, 13
	j done_checking_index_L
set_index_for_6_slot_L:
	li $s5, 14
	j done_checking_index_L
set_index_for_7_slot_L:
	li $s5, 15
	j done_checking_index_L
set_index_for_8_slot_L:
	li $s5, 16
	j done_checking_index_L
set_index_for_9_slot_L:
	li $s5, 17
	j done_checking_index_L
set_index_for_1_slot_OH:
	li $s5, 9
	j done_checking_index_OH
set_index_for_2_slot_OH:
	li $s5, 10
	j done_checking_index_OH
set_index_for_3_slot_OH:
	li $s5, 11
	j done_checking_index_OH
set_index_for_4_slot_OH:
	li $s5, 12
	j done_checking_index_OH
set_index_for_5_slot_OH:
	li $s5, 13
	j done_checking_index_OH
set_index_for_6_slot_OH:
	li $s5, 14
	j done_checking_index_OH
set_index_for_7_slot_OH:
	li $s5, 15
	j done_checking_index_OH
set_index_for_8_slot_OH:
	li $s5, 16
	j done_checking_index_OH
set_index_for_9_slot_OH:
	li $s5, 17
	j done_checking_index_OH
set_index_for_1_slot_M:
	li $s5, 9
	j done_checking_index_M
set_index_for_2_slot_M:
	li $s5, 10
	j done_checking_index_M
set_index_for_3_slot_M:
	li $s5, 11
	j done_checking_index_M
set_index_for_4_slot_M:
	li $s5, 12
	j done_checking_index_M
set_index_for_5_slot_M:
	li $s5, 13
	j done_checking_index_M
set_index_for_6_slot_M:
	li $s5, 14
	j done_checking_index_M
set_index_for_7_slot_M:
	li $s5, 15
	j done_checking_index_M
set_index_for_8_slot_M:
	li $s5, 16
	j done_checking_index_M
set_index_for_9_slot_M:
	li $s5, 17
	j done_checking_index_M
exit_loop_store_hours_in_variables_slot:
	j view_calendar
View_Statistics:
	#******view statistics******
	la $a0, view_statistics_prompt
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	#before we do anything, let us initialize three counters, for L, M, and OH
	#let #s0 be the counter for L
	#let #s1 be the counter for OH
	#let #s2 be the counter for M
	li $s0, 0 #counter for L
	li $s1, 0 #counter for OH
	li $s2, 0 #counter for M
	#now, let us loop through the array to store in the counters
	# Index = base_address + ((row × columns + column) × 4)
    	li $t0, 0  # initial row index, counter
    	li $t1, 0  # initial column index, counter
    	li $t2, 10  # number of columns
loop_array_zeros_row_same_statistic:
    	mul $t3, $t0, $t2
    	add $t3, $t3, $t1
    	mul $t3, $t3, 4  # now $t5 contains the index
    	#Calculate the address of array[index]
    	add $t3, $t3, $v1  # now $t6 contains the address
    	lw $s3, 0($t3)
    	beq $s3, 1, add_counter_for_L
    	beq $s3, 2, add_counter_for_OH
    	beq $s3, 3, add_counter_for_M
return_to_loop_from_adding_counter:
    	addi $t1, $t1, 1
    	beq $t1, 10, loop_array_zeros_increment_column_statistic
    	j loop_array_zeros_row_same_statistic
loop_array_zeros_increment_column_statistic:
	li $t1, 0  # initial row index, counter
	addi $t0, $t0, 1 
	beq $t0, 31, storing_in_array_finished_statistic
	j loop_array_zeros_row_same_statistic
storing_in_array_finished_statistic:
	j continue_statistics_from_here
add_counter_for_L:
	addi $s0, $s0, 1
	j return_to_loop_from_adding_counter
add_counter_for_OH:
	addi $s1, $s1, 1
	j return_to_loop_from_adding_counter
add_counter_for_M:
	addi $s2, $s2, 1
	j return_to_loop_from_adding_counter	
continue_statistics_from_here:
	beq $v0, 1, number_of_lectures
	beq $v0, 2, number_of_OH
	beq $v0, 3, number_of_Meetings
	beq $v0, 4, average_lectures_per_day
	beq $v0, 5, ratio_between_hours_reserved_lectures_OH
	beq $v0, 6, back_to_menue	
number_of_lectures:
	#this will show number of lectures (in hours)
	move $a0, $s0
	li $v0, 1
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#-------------- 
	j View_Statistics		
number_of_OH:	
	#this will show number of office hours (in hours)
	move $a0, $s1
	li $v0, 1
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#-------------- 
	j View_Statistics			
number_of_Meetings:
	#this will show number of meetings hours (in hours)
	move $a0, $s2
	li $v0, 1
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#-------------- 
	j View_Statistics	
average_lectures_per_day:#L/NUMBER OF DAYS = $s0/$t1
	#this will show the average lectures per day
	# Convert the floating-point counter to an integer
        cvt.w.s $f0, $f0
        # Move the result to an integer register
        mfc1 $t1, $f0	
	l.s $f4, float_zero   # Load 0.0 into $f0 
        l.s $f5, float_zero   # Load 0.0 into $f0	
	# Convert the integer value in s0 to a floating-point value
        mtc1 $s0, $f4   # Move the integer value in $s0 to the floating-point register $f4
        cvt.s.w $f4, $f4  # Convert the integer value in $f4 to a floating-point value    
        # Convert the integer value in s0 to a floating-point value
        mtc1 $t1, $f5   # Move the integer value in $s0 to the floating-point register $f4
        cvt.s.w $f5, $f5  # Convert the integer value in $f4 to a floating-point value       
        div.s $f12, $f4, $f5  # $f12 = $f0 / $f1      
        # Print the floating-point result
        li $v0, 2          # System call for printing float
        syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
	j View_Statistics
ratio_between_hours_reserved_lectures_OH:#L/OH = s0/s1
	#this will show the ratio between total number of hours reserved for lectures and the total number of hours reserved 
	l.s $f4, float_zero   
	l.s $f5, float_zero   # Load 0.0 into $f0
	# Convert the integer value in s0 to a floating-point value
        mtc1 $s0, $f4   # Move the integer value in $s0 to the floating-point register $f4
        cvt.s.w $f4, $f4  # Convert the integer value in $f4 to a floating-point value
        # Convert the integer value in s0 to a floating-point value
        mtc1 $s1, $f5   # Move the integer value in $s0 to the floating-point register $f4
        cvt.s.w $f5, $f5  # Convert the integer value in $f4 to a floating-point value    
        div.s $f12, $f4, $f5  # $f12 = $f0 / $f1        
        # Print the floating-point result
        li $v0, 2          # System call for printing float
        syscall	
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall 	
	j View_Statistics
Add_a_new_appointment:
	li $t0, 0
    	li $t1, 0          
    	li $t2, 0
    	li $t3, 0
    	li $t4, 0
    	li $t5, 0          
    	li $t6, 0
    	li $t7, 0
    	li $t8, 0         
    	li $t9, 0
    	li $s0, 0
    	li $s1, 0
    	li $s2, 0
    	li $s3, 0
    	li $s4, 0
    	li $s5, 0
    	li $s6, 0    	
    	li $s7, 0    
    	li $a0, 0
    	li $a1, 0
    	li $a2, 0    	
    	li $a3, 0  
    	la $a0,view_per_day_str_appointment
	li $v0, 4
	syscall
	li $v0, 8
	la $a0, str1 # $a0 = address of str
	li $a1, 100 # $a1 = max string length
	syscall
	li $t0, 0
	move $t0, $a0 #let's move the number of day to a variable that no one can touch
convert_to_integer_appointment:
    	lb $t2, 0($t0)         # Load the first character of the ASCII string
    	lb $t3, 1($t0)         # Load the second character of the ASCII string
    	beq $t3, 0x0a, one_digit_integer_conversion_appointment  
    	subi $t2, $t2, 0x30    
    	subi $t3, $t3, 0x30
    	li $t0, 0              
    	mul $t0, $t2, 10       # Multiply the first digit by 10
    	add $t0, $t0, $t3      # Add the second digit to the result
    	j string_finished_integer_conversion_appointment
one_digit_integer_conversion_appointment:
    	subi $t2, $t2, 0x30    # Convert the first character to its integer value
    	li $t0, 0  
    	move $t0, $t2
string_finished_integer_conversion_appointment:
	bge $t0, 1, check_first_day
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message
	li $v0, 4
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	j Add_a_new_appointment
check_first_day:
	ble $t0, 31, check_last_day
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message
	li $v0, 4
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	j Add_a_new_appointment
check_last_day:
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
    	la $a0,stars
	li $v0, 4
	syscall
    	la $a0, prompt_start_hour
    	li $v0, 4
    	syscall
    	li $v0, 8
	la $a0, prompt_start_hour_store # $a0 = address of str
	li $a1, 100 # $a1 = max string length
	syscall
	move $t1, $a0 #t2 now has a string value of starting hour
	li $t2, 0
	li $t3, 0
convert_to_integer_appointment_first_hour:
    	lb $t2, 0($t1)         # Load the first character of the ASCII string
    	lb $t3, 1($t1)         # Load the second character of the ASCII string
    	beq $t3, 0x0a, one_digit_integer_conversion_appointment_first_hour
    	subi $t2, $t2, 0x30    
    	subi $t3, $t3, 0x30
    	li $t1, 0              
    	mul $t1, $t2, 10       # Multiply the first digit by 10
    	add $t1, $t1, $t3      # Add the second digit to the result
    	j string_finished_integer_conversion_appointment_first_hour
one_digit_integer_conversion_appointment_first_hour:
    	subi $t2, $t2, 0x30    # Convert the first character to its integer value
    	li $t1, 0  
    	move $t1, $t2
string_finished_integer_conversion_appointment_first_hour:
	bge $t1, 8, check_first_day_first_hour
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message_hour
	li $v0, 4
	syscall
	j check_last_day
check_first_day_first_hour:
	ble $t1, 17, check_last_day_second_hour
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message_hour
	li $v0, 4
	syscall
	j check_last_day
check_last_day_second_hour:
	la $a0, prompt_end_hour
    	li $v0, 4
    	syscall
    	li $v0, 8
	la $a0, prompt_end_hour_store_add_appointment # $a0 = address of str
	li $a1, 100 # $a1 = max string length
	syscall
	move $t4, $a0 #t3 now has a string value of ending hour
	li $t2, 0
	li $t3, 0
convert_to_integer_appointment_scound_hour:
    	lb $t2, 0($t4)         # Load the first character of the ASCII string
    	lb $t3, 1($t4)         # Load the second character of the ASCII string
    	beq $t3, 0x0a, one_digit_integer_conversion_appointment_scound_hour
    	subi $t2, $t2, 0x30    
    	subi $t3, $t3, 0x30
    	li $t4, 0              
    	mul $t4, $t2, 10       # Multiply the first digit by 10
    	add $t4, $t4, $t3      # Add the second digit to the result
    	j string_finished_integer_conversion_appointment_scound_hour
one_digit_integer_conversion_appointment_scound_hour:
    	subi $t2, $t2, 0x30    # Convert the first character to its integer value
    	li $t4, 0  
    	move $t4, $t2
string_finished_integer_conversion_appointment_scound_hour:
	bge $t4, 8, check_first_day_scound_hour
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message_hour
	li $v0, 4
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	j check_last_day_second_hour
check_first_day_scound_hour:
	ble $t4, 17, check_last_day_appointment_hour
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message_hour
	li $v0, 4
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	j check_last_day_second_hour
check_last_day_appointment_hour:
	bgt $t4, $t1, finished_appointment
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message_second_hour_less
	li $v0, 4
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
    	j check_last_day_second_hour
finished_appointment:
	li $s0, 0
	li $s1, 0
	move $t2, $t4
	la $a0, print_type_of_appointment
	li $v0, 4
	syscall
	li $v0, 8
	la $a0, print_type_of_appointment_space # $a0 = address of str
	li $a1, 100 # $a1 = max string length
	syscall
	move $t3, $a0 #t3 now has the string of type of appointment
	lb $s0, 0($t3)
	beq $s0, 'L', done_evrything_appointment
	beq $s0, 'M', done_evrything_appointment
	beq $s0, 'O', check_H
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message_type
	li $v0, 4
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
    	j finished_appointment
check_H:
	lb $s1, 1($t3)
	beq $s1, 'H', done_evrything_appointment 
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message_type
	li $v0, 4
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
    	j finished_appointment	
done_evrything_appointment:
	#loop through the hours of the day the user entered
	#in this loop, check if all the hours the user entered are empty. If not, print an error message saying that there is a conflict
	#If indedd all the hours the user entered are empty in the array (a value 0 is stored for these hours), go to another loop
	#this another loop will again itterate through the hours of the day
	#whenever there is a value 0, add either 1, 2, or 3 based on the type of appointment
	#after finishing this, print the day with all its hours to the user
	#and hence, the add appointment method is completed
	#let us first find the indexes of the start hour and end hour
	beq $t1, 8, set_index_for_8_first_hour_appointment
	beq $t1, 9, set_index_for_9_first_hour_appointment
	beq $t1, 10, set_index_for_10_first_hour_appointment
	beq $t1, 11, set_index_for_11_first_hour_appointment
	beq $t1, 12, set_index_for_12_first_hour_appointment
	beq $t1, 13, set_index_for_13_first_hour_appointment
	beq $t1, 14, set_index_for_14_first_hour_appointment
	beq $t1, 15, set_index_for_15_first_hour_appointment
	beq $t1, 16, set_index_for_16_first_hour_appointment
	beq $t1, 17, set_index_for_17_first_hour_appointment
set_index_for_8_first_hour_appointment:
	li $t1, 0
	j finished_finding_indexes_of_first_hours_in_appointment
set_index_for_9_first_hour_appointment:
	li $t1, 1
	j finished_finding_indexes_of_first_hours_in_appointment
set_index_for_10_first_hour_appointment:
	li $t1, 2
	j finished_finding_indexes_of_first_hours_in_appointment
set_index_for_11_first_hour_appointment:
	li $t1, 3
	j finished_finding_indexes_of_first_hours_in_appointment
set_index_for_12_first_hour_appointment:
	li $t1, 4
	j finished_finding_indexes_of_first_hours_in_appointment
set_index_for_13_first_hour_appointment:
	li $t1, 5
	j finished_finding_indexes_of_first_hours_in_appointment
set_index_for_14_first_hour_appointment:
	li $t1, 6
	j finished_finding_indexes_of_first_hours_in_appointment
set_index_for_15_first_hour_appointment:
	li $t1, 7
	j finished_finding_indexes_of_first_hours_in_appointment
set_index_for_16_first_hour_appointment:
	li $t1, 8
	j finished_finding_indexes_of_first_hours_in_appointment
set_index_for_17_first_hour_appointment:
	li $t1, 9
finished_finding_indexes_of_first_hours_in_appointment:
	#now let us do the same for the second hour
	beq $t2, 8, set_index_for_8_second_hour_appointment
	beq $t2, 9, set_index_for_9_second_hour_appointment
	beq $t2, 10, set_index_for_10_second_hour_appointment
	beq $t2, 11, set_index_for_11_second_hour_appointment
	beq $t2, 12, set_index_for_12_second_hour_appointment
	beq $t2, 13, set_index_for_13_second_hour_appointment
	beq $t2, 14, set_index_for_14_second_hour_appointment
	beq $t2, 15, set_index_for_15_second_hour_appointment
	beq $t2, 16, set_index_for_16_second_hour_appointment
	beq $t2, 17, set_index_for_17_second_hour_appointment
set_index_for_8_second_hour_appointment:
	li $t2, 0
	j finished_finding_indexes_of_second_hours_in_appointment
set_index_for_9_second_hour_appointment:
	li $t2, 1
	j finished_finding_indexes_of_second_hours_in_appointment
set_index_for_10_second_hour_appointment:
	li $t2, 2
	j finished_finding_indexes_of_second_hours_in_appointment
set_index_for_11_second_hour_appointment:
	li $t2, 3
	j finished_finding_indexes_of_second_hours_in_appointment
set_index_for_12_second_hour_appointment:
	li $t2, 4
	j finished_finding_indexes_of_second_hours_in_appointment
set_index_for_13_second_hour_appointment:
	li $t2, 5
	j finished_finding_indexes_of_second_hours_in_appointment
set_index_for_14_second_hour_appointment:
	li $t2, 6
	j finished_finding_indexes_of_second_hours_in_appointment
set_index_for_15_second_hour_appointment:
	li $t2, 7
	j finished_finding_indexes_of_second_hours_in_appointment
set_index_for_16_second_hour_appointment:
	li $t2, 8
	j finished_finding_indexes_of_second_hours_in_appointment
set_index_for_17_second_hour_appointment:
	li $t2, 9
finished_finding_indexes_of_second_hours_in_appointment:
	# Index = base_address + ((row × columns + column) × 4)
	#now that we finished setting the indexes, let us loop through the hours the user entered to check if zero is stored in array or not
    	li $s3,0
    	li $s4, 0
    	move $s0, $t1 #counter to check if we reached end hour
    	move $s4, $t2
    	li $s2, 10  # number of columns
loop_through_array_day_appointment:
    	beq $s0, $s4, loop_end_day_appointment
    	mul $s3, $t0, $s2
    	add $s3, $s3, $s0
    	mul $s3, $s3, 4  # now $t5 contains the index
    	#Calculate the address of array[index]
    	add $s3, $s3, $v1  # now $t6 contains the address
    	lw $s5, 0($s3)
    	bge $s5, 1, print_appointment_conflict
    	addi $s0, $s0, 1
    	j loop_through_array_day_appointment
print_appointment_conflict:
	la $a0, error_message_for_appointment_conflict
	li $v0, 4
	syscall
	j Add_a_new_appointment
loop_end_day_appointment:
	#now that we are here, that means that the slot the user is trying to reserve causes no conflicts with other appointments.
	#hence, le's enter the appointment to the array:
    	li $s6, 0
    	lb $s6, 0($t3)
    	li $s3,0
    	move $s0, $t1 #counter to check if we reached end hour
    	li $s4, 0
    	move $s4, $t2 #counter to check if we reached end hour
    	li $s2, 10  # number of columns
loop_through_array_day_appointment_reserve:
    	beq $s0, $s4, loop_end_day_appointment_reserve
    	mul $s3, $t0, $s2
    	add $s3, $s3, $s0
    	mul $s3, $s3, 4  # now $t5 contains the index
    	#Calculate the address of array[index]
    	add $s3, $s3, $v1  # now $t6 contains the address
    	lw $s5, 0($s3)
    	beq $s5, 0, add_user_appointment_to_array_here
continue_itterating_in_the_loop_reserve:
    	addi $s0, $s0, 1
    	j loop_through_array_day_appointment_reserve
add_user_appointment_to_array_here:
	beq $s6, 'L', add_appointment_L_to_array
	beq $s6, 'M', add_appointment_M_to_array
	#if we reached here, that means that the slot is OH
	#let us add 2 to the array 
	li $s7, 2
	sw $s7, 0($s3)
	j continue_itterating_in_the_loop_reserve
add_appointment_L_to_array:
	#let us add 1 to the array 
	li $s7, 1
	sw $s7, 0($s3)
	j continue_itterating_in_the_loop_reserve	
add_appointment_M_to_array:
	#let us add 3 to the array 
	li $s7, 3
	sw $s7, 0($s3)
	j continue_itterating_in_the_loop_reserve
loop_end_day_appointment_reserve:
	#since we reached here, that means that we finished adding the appointment the user wanted into the array
	#now let us print the appointments in that day to the user	
	#what we will print to the user will be like this:
	#"the appointments in the day you entered became as follows:
	#8 L  
	#9 M
	#10 OH
	#11 L "
	#and so on
	# (what is above is an example)
    	li $s1, 0
    	li $s2, 10  # number of columns
loop_print_appointment_ready:
    	mul $s3, $t0, $s2
    	add $s3, $s3, $s1
    	mul $s3, $s3, 4  # now $t5 contains the index
    	#Calculate the address of array[index]
    	add $s3, $s3, $v1  # now $t6 contains the address
    	lw $s5, 0($s3)
    	beq $s5, 1, print_label_for_L_appointment
    	beq $s5, 3, print_label_for_M_appointment
    	beq $s5, 2, print_label_for_OH_appointment
came_back_from_this_appointment:
    	addi $s1, $s1, 1
    	beq $s1, 10, loop_print_appointment_ready_done
    	j loop_print_appointment_ready
print_label_for_L_appointment:
	#first, let us convert the hour back to 24-format
	move $s7, $s1
	beq $s7, 1, convert_appointment_hour_9_to_24_format_L
	beq $s7, 2, convert_appointment_hour_10_to_24_format_L
	beq $s7, 3, convert_appointment_hour_11_to_24_format_L
	beq $s7, 4, convert_appointment_hour_12_to_24_format_L
	beq $s7, 5, convert_appointment_hour_13_to_24_format_L
	beq $s7, 6, convert_appointment_hour_14_to_24_format_L
	beq $s7, 7, convert_appointment_hour_15_to_24_format_L
	beq $s7, 8, convert_appointment_hour_16_to_24_format_L
	beq $s7, 9, convert_appointment_hour_17_to_24_format_L
	#if we reached here, that means the index is 0, which is 8
	li $s6, 8
returned_to_L_after_converting_hour_ready:
	move $a0, $s6
	li $v0, 1
	syscall
	la $a0, this_is_lecture_new
	li $v0, 4
	syscall
	j came_back_from_this_appointment
print_label_for_M_appointment:
	move $s7, $s1
	beq $s7, 1, convert_appointment_hour_9_to_24_format_M
	beq $s7, 2, convert_appointment_hour_10_to_24_format_M
	beq $s7, 3, convert_appointment_hour_11_to_24_format_M
	beq $s7, 4, convert_appointment_hour_12_to_24_format_M
	beq $s7, 5, convert_appointment_hour_13_to_24_format_M
	beq $s7, 6, convert_appointment_hour_14_to_24_format_M
	beq $s7, 7, convert_appointment_hour_15_to_24_format_M
	beq $s7, 8, convert_appointment_hour_16_to_24_format_M
	beq $s7, 9, convert_appointment_hour_17_to_24_format_M
	#if we reached here, that means the index is 0, which is 8
	li $s6, 8
returned_to_M_after_converting_hour_ready:
	move $a0, $s6
	li $v0, 1
	syscall
	la $a0, this_is_meeting
	li $v0, 4
	syscall
	j came_back_from_this_appointment
print_label_for_OH_appointment:
	move $s7, $s1
	beq $s7, 1, convert_appointment_hour_9_to_24_format_OH
	beq $s7, 2, convert_appointment_hour_10_to_24_format_OH
	beq $s7, 3, convert_appointment_hour_11_to_24_format_OH
	beq $s7, 4, convert_appointment_hour_12_to_24_format_OH
	beq $s7, 5, convert_appointment_hour_13_to_24_format_OH
	beq $s7, 6, convert_appointment_hour_14_to_24_format_OH
	beq $s7, 7, convert_appointment_hour_15_to_24_format_OH
	beq $s7, 8, convert_appointment_hour_16_to_24_format_OH
	beq $s7, 9, convert_appointment_hour_17_to_24_format_OH
	#if we reached here, that means the index is 0, which is 8
	li $s6, 8
returned_to_OH_after_converting_hour_ready:
	move $a0, $s6
	li $v0, 1
	syscall
	la $a0, this_is_office_hours
	li $v0, 4
	syscall
	j came_back_from_this_appointment
convert_appointment_hour_9_to_24_format_L:
	li $s6, 9
	j returned_to_L_after_converting_hour_ready
convert_appointment_hour_10_to_24_format_L:
	li $s6, 10
	j returned_to_L_after_converting_hour_ready
convert_appointment_hour_11_to_24_format_L:
	li $s6, 11
	j returned_to_L_after_converting_hour_ready
convert_appointment_hour_12_to_24_format_L:
	li $s6, 12
	j returned_to_L_after_converting_hour_ready
convert_appointment_hour_13_to_24_format_L:
	li $s6, 13
	j returned_to_L_after_converting_hour_ready
convert_appointment_hour_14_to_24_format_L:
	li $s6, 14
	j returned_to_L_after_converting_hour_ready
convert_appointment_hour_15_to_24_format_L:
	li $s6, 15
	j returned_to_L_after_converting_hour_ready
convert_appointment_hour_16_to_24_format_L:
	li $s6, 16
	j returned_to_L_after_converting_hour_ready
convert_appointment_hour_17_to_24_format_L:
	li $s6, 17
	j returned_to_L_after_converting_hour_ready	
convert_appointment_hour_9_to_24_format_M:
	li $s6, 9
	j returned_to_M_after_converting_hour_ready
convert_appointment_hour_10_to_24_format_M:
	li $s6, 10
	j returned_to_M_after_converting_hour_ready
convert_appointment_hour_11_to_24_format_M:
	li $s6, 11
	j returned_to_M_after_converting_hour_ready
convert_appointment_hour_12_to_24_format_M:
	li $s6, 12
	j returned_to_M_after_converting_hour_ready
convert_appointment_hour_13_to_24_format_M:
	li $s6, 13
	j returned_to_M_after_converting_hour_ready
convert_appointment_hour_14_to_24_format_M:
	li $s6, 14
	j returned_to_M_after_converting_hour_ready
convert_appointment_hour_15_to_24_format_M:
	li $s6, 15
	j returned_to_M_after_converting_hour_ready
convert_appointment_hour_16_to_24_format_M:
	li $s6, 16
	j returned_to_M_after_converting_hour_ready
convert_appointment_hour_17_to_24_format_M:
	li $s6, 17
	j returned_to_M_after_converting_hour_ready
convert_appointment_hour_9_to_24_format_OH:
	li $s6, 9
	j returned_to_OH_after_converting_hour_ready
convert_appointment_hour_10_to_24_format_OH:
	li $s6, 10
	j returned_to_OH_after_converting_hour_ready
convert_appointment_hour_11_to_24_format_OH:
	li $s6, 11
	j returned_to_OH_after_converting_hour_ready
convert_appointment_hour_12_to_24_format_OH:
	li $s6, 12
	j returned_to_OH_after_converting_hour_ready
convert_appointment_hour_13_to_24_format_OH:
	li $s6, 13
	j returned_to_OH_after_converting_hour_ready
convert_appointment_hour_14_to_24_format_OH:
	li $s6, 14
	j returned_to_OH_after_converting_hour_ready
convert_appointment_hour_15_to_24_format_OH:
	li $s6, 15
	j returned_to_OH_after_converting_hour_ready
convert_appointment_hour_16_to_24_format_OH:
	li $s6, 16
	j returned_to_OH_after_converting_hour_ready
convert_appointment_hour_17_to_24_format_OH:
	li $s6, 17
	j returned_to_OH_after_converting_hour_ready
loop_print_appointment_ready_done:
	j print_prompt
Delete_an_appointment:
	li $t0, 0
    	li $t1, 0          
    	li $t2, 0
    	li $t3, 0
    	li $t4, 0
    	li $t5, 0          
    	li $t6, 0
    	li $t7, 0
    	li $t8, 0         
    	li $t9, 0
    	li $s0, 0
    	li $s1, 0
    	li $s2, 0
    	li $s3, 0
    	li $s4, 0
    	li $s5, 0
    	li $s6, 0    	
    	li $s7, 0    
    	li $a0, 0
    	li $a1, 0
    	li $a2, 0    	
    	li $a3, 0  
    	la $a0,view_per_day_str_appointment_delete
	li $v0, 4
	syscall
	li $v0, 8
	la $a0, str1 # $a0 = address of str
	li $a1, 100 # $a1 = max string length
	syscall
	li $t0, 0
	move $t0, $a0 #let's move the number of day to a variable that no one can touch
convert_to_integer_appointment_delete:
    	lb $t2, 0($t0)         # Load the first character of the ASCII string
    	lb $t3, 1($t0)         # Load the second character of the ASCII string
    	beq $t3, 0x0a, one_digit_integer_conversion_appointment_delete 
    	subi $t2, $t2, 0x30    
    	subi $t3, $t3, 0x30
    	li $t0, 0              
    	mul $t0, $t2, 10       # Multiply the first digit by 10
    	add $t0, $t0, $t3      # Add the second digit to the result
    	j string_finished_integer_conversion_appointment_delete
one_digit_integer_conversion_appointment_delete:
    	subi $t2, $t2, 0x30    # Convert the first character to its integer value
    	li $t0, 0  
    	move $t0, $t2
string_finished_integer_conversion_appointment_delete:
	bge $t0, 1, check_first_day_delete
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message
	li $v0, 4
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	j Delete_an_appointment
check_first_day_delete:
	ble $t0, 31, check_if_day_exists
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message
	li $v0, 4
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	j Delete_an_appointment
check_if_day_exists:
    	li $s1, 0 # initial column index, counter
    	li $s2, 10  # number of columns
loop_check_zeros_for_day:
    	mul $s3, $t0, $s2
    	add $s3, $s3, $s1
    	mul $s3, $s3, 4  # now $t5 contains the index
    	#Calculate the address of array[index]
    	add $s3, $s3, $v1  # now $t6 contains the address
    	lw $s4, 0($s3)
    	beq $s4, 1, finished_appointment_delete
    	beq $s4, 2, finished_appointment_delete
    	beq $s4, 3, finished_appointment_delete
    	addi $s1, $s1, 1
   	beq $s1, 10, print_error_that_day_not_existant
    	j loop_check_zeros_for_day
print_error_that_day_not_existant:
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message_day_not_existant
	li $v0, 4
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	j Delete_an_appointment
finished_appointment_delete:
	li $s0, 0
	li $s1, 0
	move $t2, $t4
	la $a0, print_type_of_appointment
	li $v0, 4
	syscall
	li $v0, 8
	la $a0, print_type_of_appointment_space # $a0 = address of str
	li $a1, 100 # $a1 = max string length
	syscall
	move $t3, $a0 #t3 now has the string of type of appointment
	lb $s0, 0($t3)
	beq $s0, 'L', check_last_day_delete
	beq $s0, 'M', check_last_day_delete
	beq $s0, 'O', check_H_delete
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message_type
	li $v0, 4
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
    	j finished_appointment_delete
check_H_delete:
	lb $s1, 1($t3)
	beq $s1, 'H', check_last_day_delete
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message_type
	li $v0, 4
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
    	j finished_appointment_delete
check_last_day_delete:
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
    	la $a0,stars
	li $v0, 4
	syscall
    	la $a0, prompt_start_hour
    	li $v0, 4
    	syscall
    	li $v0, 8
	la $a0, prompt_start_hour_store # $a0 = address of str
	li $a1, 100 # $a1 = max string length
	syscall
	move $t1, $a0 #t2 now has a string value of starting hour
	li $t2, 0
	li $t9, 0
convert_to_integer_appointment_first_hour_delete:
    	lb $t2, 0($t1)         # Load the first character of the ASCII string
    	lb $t9, 1($t1)         # Load the second character of the ASCII string
    	beq $t9, 0x0a, one_digit_integer_conversion_appointment_first_hour_delete
    	subi $t2, $t2, 0x30    
    	subi $t9, $t9, 0x30
    	li $t1, 0              
    	mul $t1, $t2, 10       # Multiply the first digit by 10
    	add $t1, $t1, $t9      # Add the second digit to the result
    	j string_finished_integer_conversion_appointment_first_hour_delete
one_digit_integer_conversion_appointment_first_hour_delete:
    	subi $t2, $t2, 0x30    # Convert the first character to its integer value
    	li $t1, 0  
    	move $t1, $t2
string_finished_integer_conversion_appointment_first_hour_delete:
	bge $t1, 8, check_first_day_first_hour_delete
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message_hour
	li $v0, 4
	syscall
	j check_last_day_delete
check_first_day_first_hour_delete:
	ble $t1, 17, check_last_day_second_hour_delete
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message_hour
	li $v0, 4
	syscall
	j check_last_day_delete
check_last_day_second_hour_delete:
	la $a0, prompt_end_hour
    	li $v0, 4
    	syscall
    	li $v0, 8
	la $a0, prompt_end_hour_store_add_appointment # $a0 = address of str
	li $a1, 100 # $a1 = max string length
	syscall
	move $t4, $a0 #t3 now has a string value of ending hour
	li $t2, 0
	li $t9, 0
convert_to_integer_appointment_scound_hour_delete:
    	lb $t2, 0($t4)         # Load the first character of the ASCII string
    	lb $t9, 1($t4)         # Load the second character of the ASCII string
    	beq $t9, 0x0a, one_digit_integer_conversion_appointment_scound_hour_delete
    	subi $t2, $t2, 0x30    
    	subi $t9, $t9, 0x30
    	li $t4, 0              
    	mul $t4, $t2, 10       # Multiply the first digit by 10
    	add $t4, $t4, $t9      # Add the second digit to the result
    	j string_finished_integer_conversion_appointment_scound_hour_delete
one_digit_integer_conversion_appointment_scound_hour_delete:
    	subi $t2, $t2, 0x30    # Convert the first character to its integer value
    	li $t4, 0  
    	move $t4, $t2
string_finished_integer_conversion_appointment_scound_hour_delete:
	bge $t4, 8, check_first_day_scound_hour_delete
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message_hour
	li $v0, 4
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	j check_last_day_second_hour_delete
check_first_day_scound_hour_delete:
	ble $t4, 17, check_last_day_appointment_hour_delete
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message_hour
	li $v0, 4
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	j check_last_day_second_hour_delete
check_last_day_appointment_hour_delete:
	bgt $t4, $t1, done_evrything_appointment_delete
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message_second_hour_less
	li $v0, 4
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
    	j check_last_day_second_hour_delete	
done_evrything_appointment_delete:
	move $t2, $t4
	#check if the hours between start and end hours belong to the type of appointment the user wishes to delete
	#loop through the hours of the day the user entered
	#in this loop, check if all the hours the user entered belong to the type of appointment the user entered. 
	#If not, print an error message saying that the slot the user is trying to delete has types of appointments that differ from the type you wish
	#If indedd all the hours the user entered are correct, go to another loop
	#this another loop will again itterate through the hours the user entered
	#it will add value 0 to all indexes that belong to the time slot the user described
	#after finishing this, print the day with all its hours to the user
	#and hence, the delete appointment method is completed    
	#let us first find the indexes of the start hour and end hour
	beq $t1, 8, set_index_for_8_first_hour_appointment_delete
	beq $t1, 9, set_index_for_9_first_hour_appointment_delete
	beq $t1, 10, set_index_for_10_first_hour_appointment_delete
	beq $t1, 11, set_index_for_11_first_hour_appointment_delete
	beq $t1, 12, set_index_for_12_first_hour_appointment_delete
	beq $t1, 13, set_index_for_13_first_hour_appointment_delete
	beq $t1, 14, set_index_for_14_first_hour_appointment_delete
	beq $t1, 15, set_index_for_15_first_hour_appointment_delete
	beq $t1, 16, set_index_for_16_first_hour_appointment_delete
	beq $t1, 17, set_index_for_17_first_hour_appointment_delete
set_index_for_8_first_hour_appointment_delete:
	li $t1, 0
	j finished_finding_indexes_of_first_hours_in_appointment_delete
set_index_for_9_first_hour_appointment_delete:
	li $t1, 1
	j finished_finding_indexes_of_first_hours_in_appointment_delete
set_index_for_10_first_hour_appointment_delete:
	li $t1, 2
	j finished_finding_indexes_of_first_hours_in_appointment_delete
set_index_for_11_first_hour_appointment_delete:
	li $t1, 3
	j finished_finding_indexes_of_first_hours_in_appointment_delete
set_index_for_12_first_hour_appointment_delete:
	li $t1, 4
	j finished_finding_indexes_of_first_hours_in_appointment_delete
set_index_for_13_first_hour_appointment_delete:
	li $t1, 5
	j finished_finding_indexes_of_first_hours_in_appointment_delete
set_index_for_14_first_hour_appointment_delete:
	li $t1, 6
	j finished_finding_indexes_of_first_hours_in_appointment_delete
set_index_for_15_first_hour_appointment_delete:
	li $t1, 7
	j finished_finding_indexes_of_first_hours_in_appointment_delete
set_index_for_16_first_hour_appointment_delete:
	li $t1, 8
	j finished_finding_indexes_of_first_hours_in_appointment_delete
set_index_for_17_first_hour_appointment_delete:
	li $t1, 9
finished_finding_indexes_of_first_hours_in_appointment_delete:
	#now let us do the same for the second hour
	beq $t2, 8, set_index_for_8_second_hour_appointment_delete
	beq $t2, 9, set_index_for_9_second_hour_appointment_delete
	beq $t2, 10, set_index_for_10_second_hour_appointment_delete
	beq $t2, 11, set_index_for_11_second_hour_appointment_delete
	beq $t2, 12, set_index_for_12_second_hour_appointment_delete
	beq $t2, 13, set_index_for_13_second_hour_appointment_delete
	beq $t2, 14, set_index_for_14_second_hour_appointment_delete
	beq $t2, 15, set_index_for_15_second_hour_appointment_delete
	beq $t2, 16, set_index_for_16_second_hour_appointment_delete
	beq $t2, 17, set_index_for_17_second_hour_appointment_delete
set_index_for_8_second_hour_appointment_delete:
	li $t2, 0
	j finished_finding_indexes_of_second_hours_in_appointment_delete
set_index_for_9_second_hour_appointment_delete:
	li $t2, 1
	j finished_finding_indexes_of_second_hours_in_appointment_delete
set_index_for_10_second_hour_appointment_delete:
	li $t2, 2
	j finished_finding_indexes_of_second_hours_in_appointment_delete
set_index_for_11_second_hour_appointment_delete:
	li $t2, 3
	j finished_finding_indexes_of_second_hours_in_appointment_delete
set_index_for_12_second_hour_appointment_delete:
	li $t2, 4
	j finished_finding_indexes_of_second_hours_in_appointment_delete
set_index_for_13_second_hour_appointment_delete:
	li $t2, 5
	j finished_finding_indexes_of_second_hours_in_appointment_delete
set_index_for_14_second_hour_appointment_delete:
	li $t2, 6
	j finished_finding_indexes_of_second_hours_in_appointment_delete
set_index_for_15_second_hour_appointment_delete:
	li $t2, 7
	j finished_finding_indexes_of_second_hours_in_appointment_delete
set_index_for_16_second_hour_appointment_delete:
	li $t2, 8
	j finished_finding_indexes_of_second_hours_in_appointment_delete
set_index_for_17_second_hour_appointment_delete:
	li $t2, 9

finished_finding_indexes_of_second_hours_in_appointment_delete:
	# Index = base_address + ((row × columns + column) × 4)
	#now that we finished setting the indexes, let us loop through the hours the user entered to check if they belong to the type the user entered or not
    	li $t8,0
    	lb $s6, 0($t3)
	#now let us find what number is stored in the array for the appointment the user entered
    	beq $s6, 'L', set_t8_to_L_value_1
    	beq $s6, 'M', set_t8_to_M_value_3
    	#if we reached here, that means that what the user entered is OH
    	#let us set t8 to 2
    	li $t8, 2
     	j finished_setting_value_for_t8_appointment
set_t8_to_L_value_1:
	li $t8, 1
	j finished_setting_value_for_t8_appointment
set_t8_to_M_value_3:
	li $t8, 3
finished_setting_value_for_t8_appointment:	
    	li $s3,0
    	move $s0, $t1 #counter to check if we reached end hour
    	li $s4, 0
    	move $s4, $t2 #counter to check if we reached end hour
    	li $s2, 10  # number of columns
loop_through_array_day_appointment_reserve_delete:
    	beq $s0, $s4, loop_end_day_appointment_reserve_delete
    	mul $s3, $t0, $s2
    	add $s3, $s3, $s0
    	mul $s3, $s3, 4  # now $t5 contains the index
    	#Calculate the address of array[index]
    	add $s3, $s3, $v1  # now $t6 contains the address
    	lw $s5, 0($s3)
    	beq $s5, $t8, continue_itterating_in_the_loop_reserve_delete
    	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
	la $a0, error_message_slot_not_consistant_with_type
	li $v0, 4
	syscall
	# print newline
    	li $a0 10
    	li $v0 11
    	syscall
    	#--------------
    	j check_last_day_delete	
continue_itterating_in_the_loop_reserve_delete:
    	addi $s0, $s0, 1
    	j loop_through_array_day_appointment_reserve_delete
loop_end_day_appointment_reserve_delete:
	#since we reached here, that means that we finished checking if the slot belongs to type or not
	#now let us delete the appointment that belong to the slot that belong to type(add zero to array)
    	li $s3,0
    	move $s0, $t1 #counter to check if we reached end hour
    	li $s4, 0
    	move $s4, $t2 #counter to check if we reached end hour
    	li $s2, 10  # number of columns
loop_through_array_day_appointment_reserve_add_0:
    	beq $s0, $s4, loop_end_day_appointment_reserve_add_0
    	mul $s3, $t0, $s2
    	add $s3, $s3, $s0
    	mul $s3, $s3, 4  # now $t5 contains the index
    	#Calculate the address of array[index]
    	add $s3, $s3, $v1  # now $t6 contains the address
    	sw $zero, 0($s3)
    	addi $s0, $s0, 1
    	j loop_through_array_day_appointment_reserve_add_0
	
loop_end_day_appointment_reserve_add_0:
	#now let us print the appointments in that day to the user	
	#what we will print to the user will be like this:
	#"the appointments in the day you entered became as follows:
	#8 L  
	#9 M
	#10 OH
	#11 L "
	#and so on
	# (what is above is an example)
    	li $s1, 0
    	li $s2, 10  # number of columns
loop_print_appointment_ready_delete:
    	mul $s3, $t0, $s2
    	add $s3, $s3, $s1
    	mul $s3, $s3, 4  # now $t5 contains the index
    	#Calculate the address of array[index]
    	add $s3, $s3, $v1  # now $t6 contains the address
    	lw $s5, 0($s3)
    	beq $s5, 1, print_label_for_L_appointment_delete
    	beq $s5, 3, print_label_for_M_appointment_delete
    	beq $s5, 2, print_label_for_OH_appointment_delete
came_back_from_this_appointment_delete:
    	addi $s1, $s1, 1
    	beq $s1, 10, loop_print_appointment_ready_done_delete
    	j loop_print_appointment_ready_delete
print_label_for_L_appointment_delete:
	#first, let us convert the hour back to 24-format
	move $s7, $s1
	beq $s7, 1, convert_appointment_hour_9_to_24_format_L_delete
	beq $s7, 2, convert_appointment_hour_10_to_24_format_L_delete
	beq $s7, 3, convert_appointment_hour_11_to_24_format_L_delete
	beq $s7, 4, convert_appointment_hour_12_to_24_format_L_delete
	beq $s7, 5, convert_appointment_hour_13_to_24_format_L_delete
	beq $s7, 6, convert_appointment_hour_14_to_24_format_L_delete
	beq $s7, 7, convert_appointment_hour_15_to_24_format_L_delete
	beq $s7, 8, convert_appointment_hour_16_to_24_format_L_delete
	beq $s7, 9, convert_appointment_hour_17_to_24_format_L_delete
	#if we reached here, that means the index is 0, which is 8
	li $s6, 8
returned_to_L_after_converting_hour_ready_delete:
	move $a0, $s6
	li $v0, 1
	syscall
	la $a0, this_is_lecture_new
	li $v0, 4
	syscall
	j came_back_from_this_appointment_delete
print_label_for_M_appointment_delete:
	move $s7, $s1
	beq $s7, 1, convert_appointment_hour_9_to_24_format_M_delete
	beq $s7, 2, convert_appointment_hour_10_to_24_format_M_delete
	beq $s7, 3, convert_appointment_hour_11_to_24_format_M_delete
	beq $s7, 4, convert_appointment_hour_12_to_24_format_M_delete
	beq $s7, 5, convert_appointment_hour_13_to_24_format_M_delete
	beq $s7, 6, convert_appointment_hour_14_to_24_format_M_delete
	beq $s7, 7, convert_appointment_hour_15_to_24_format_M_delete
	beq $s7, 8, convert_appointment_hour_16_to_24_format_M_delete
	beq $s7, 9, convert_appointment_hour_17_to_24_format_M_delete
	#if we reached here, that means the index is 0, which is 8
	li $s6, 8
returned_to_M_after_converting_hour_ready_delete:
	move $a0, $s6
	li $v0, 1
	syscall
	la $a0, this_is_meeting
	li $v0, 4
	syscall
	j came_back_from_this_appointment_delete
print_label_for_OH_appointment_delete:
	move $s7, $s1
	beq $s7, 1, convert_appointment_hour_9_to_24_format_OH_delete
	beq $s7, 2, convert_appointment_hour_10_to_24_format_OH_delete
	beq $s7, 3, convert_appointment_hour_11_to_24_format_OH_delete
	beq $s7, 4, convert_appointment_hour_12_to_24_format_OH_delete
	beq $s7, 5, convert_appointment_hour_13_to_24_format_OH_delete
	beq $s7, 6, convert_appointment_hour_14_to_24_format_OH_delete
	beq $s7, 7, convert_appointment_hour_15_to_24_format_OH_delete
	beq $s7, 8, convert_appointment_hour_16_to_24_format_OH_delete
	beq $s7, 9, convert_appointment_hour_17_to_24_format_OH_delete
	#if we reached here, that means the index is 0, which is 8
	li $s6, 8
returned_to_OH_after_converting_hour_ready_delete:
	move $a0, $s6
	li $v0, 1
	syscall
	la $a0, this_is_office_hours
	li $v0, 4
	syscall
	j came_back_from_this_appointment_delete
convert_appointment_hour_9_to_24_format_L_delete:
	li $s6, 9
	j returned_to_L_after_converting_hour_ready_delete
convert_appointment_hour_10_to_24_format_L_delete:
	li $s6, 10
	j returned_to_L_after_converting_hour_ready_delete
convert_appointment_hour_11_to_24_format_L_delete:
	li $s6, 11
	j returned_to_L_after_converting_hour_ready_delete
convert_appointment_hour_12_to_24_format_L_delete:
	li $s6, 12
	j returned_to_L_after_converting_hour_ready_delete
convert_appointment_hour_13_to_24_format_L_delete:
	li $s6, 13
	j returned_to_L_after_converting_hour_ready_delete
convert_appointment_hour_14_to_24_format_L_delete:
	li $s6, 14
	j returned_to_L_after_converting_hour_ready_delete
convert_appointment_hour_15_to_24_format_L_delete:
	li $s6, 15
	j returned_to_L_after_converting_hour_ready_delete
convert_appointment_hour_16_to_24_format_L_delete:
	li $s6, 16
	j returned_to_L_after_converting_hour_ready_delete
convert_appointment_hour_17_to_24_format_L_delete:
	li $s6, 17
	j returned_to_L_after_converting_hour_ready_delete
convert_appointment_hour_9_to_24_format_M_delete:
	li $s6, 9
	j returned_to_M_after_converting_hour_ready_delete
convert_appointment_hour_10_to_24_format_M_delete:
	li $s6, 10
	j returned_to_M_after_converting_hour_ready_delete
convert_appointment_hour_11_to_24_format_M_delete:
	li $s6, 11
	j returned_to_M_after_converting_hour_ready_delete
convert_appointment_hour_12_to_24_format_M_delete:
	li $s6, 12
	j returned_to_M_after_converting_hour_ready_delete
convert_appointment_hour_13_to_24_format_M_delete:
	li $s6, 13
	j returned_to_M_after_converting_hour_ready_delete
convert_appointment_hour_14_to_24_format_M_delete:
	li $s6, 14
	j returned_to_M_after_converting_hour_ready_delete
convert_appointment_hour_15_to_24_format_M_delete:
	li $s6, 15
	j returned_to_M_after_converting_hour_ready_delete
convert_appointment_hour_16_to_24_format_M_delete:
	li $s6, 16
	j returned_to_M_after_converting_hour_ready_delete
convert_appointment_hour_17_to_24_format_M_delete:
	li $s6, 17
	j returned_to_M_after_converting_hour_ready_delete
convert_appointment_hour_9_to_24_format_OH_delete:
	li $s6, 9
	j returned_to_OH_after_converting_hour_ready_delete
convert_appointment_hour_10_to_24_format_OH_delete:
	li $s6, 10
	j returned_to_OH_after_converting_hour_ready_delete
convert_appointment_hour_11_to_24_format_OH_delete:
	li $s6, 11
	j returned_to_OH_after_converting_hour_ready_delete
convert_appointment_hour_12_to_24_format_OH_delete:
	li $s6, 12
	j returned_to_OH_after_converting_hour_ready_delete
convert_appointment_hour_13_to_24_format_OH_delete:
	li $s6, 13
	j returned_to_OH_after_converting_hour_ready_delete
convert_appointment_hour_14_to_24_format_OH_delete:
	li $s6, 14
	j returned_to_OH_after_converting_hour_ready_delete
convert_appointment_hour_15_to_24_format_OH_delete:
	li $s6, 15
	j returned_to_OH_after_converting_hour_ready_delete
convert_appointment_hour_16_to_24_format_OH_delete:
	li $s6, 16
	j returned_to_OH_after_converting_hour_ready_delete
convert_appointment_hour_17_to_24_format_OH_delete:
	li $s6, 17
	j returned_to_OH_after_converting_hour_ready_delete
loop_print_appointment_ready_done_delete:
	j print_prompt
exit_the_program_final:
	li $v0, 10
	syscall