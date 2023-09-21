.data
    # for testing, the filename is fixed
    file_name: .asiiz "img1.ppm"
    
.text
.globl main

main:
    jal readFile

readFile:
    # Open the file
    li $v0, 13              # syscall 13 is openFile
    la $a0, file_name       # passes filename
    li $a1, 0               # set readmode
    li $a2, 0               # not sure if this is needed
    syscall
    move $s0, $v0           # move file discriptor to s0
                            # - should be non-negative if
                            # it could open the file
    #TO DO: File not found error

    # Read input into buffer
    li $v0, 14              # syscall 14 is readFile
    move $a0, $s0           # moves file Descriptor to a0
