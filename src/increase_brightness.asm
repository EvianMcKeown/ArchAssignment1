.data
                                                                                                                # for testing, the filename is fixed
file_name: .asciiz "/home/evianmckeown/Documents/University/CSC2002S/ArchAssignment1/house_64_in_ascii_cr.ppm"
                                                                                                                # for file reading
buffer: .space 256

.text
.globl main

main:
    jal     readFile

readFile:
                                                                                                                # Open the file
    li      $v0,        13                                                                                      # syscall 13 is openFile
    la      $a0,        file_name                                                                               # passes filename
    li      $a1,        0                                                                                       # set readmode
    li      $a2,        0                                                                                       # not sure if this is needed
    syscall 
    move    $s0,        $v0                                                                                     # move file discriptor to s0
                                                                                                                # - should be non-negative if
                                                                                                                # it could open the file
                                                                                                                # TO DO: File not found error

# Read input into buffer
    li      $v0,        14                                                                                      # syscall 14 is readFile
    move    $a0,        $s0                                                                                     # moves file Descriptor to a0
    la      $a1,        buffer                                                                                  # address of input buffer
    li      $a2,        256                                                                                    # max size to read
    syscall 

# TESTING
# print buffer
    li      $v0,        4
    la      $a0,        buffer
    syscall 

    j       exit

exit:
    li      $v0,        10
    syscall 