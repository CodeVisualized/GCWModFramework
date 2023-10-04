##########################################################
# LoadWord                                               #
#                                                        #
# Loads a word into a register using an address          #
# with no offset.                                        #
#                                                        #
##########################################################
.macro LoadWord targetRegister valueAddress helperRegister         
lis        \helperRegister, \valueAddress@h
ori        \helperRegister, \helperRegister, \valueAddress@l
lwz        \targetRegister, 0x0000(\helperRegister)
.endm

.text
LoadWord   r16, testValue, r23
addi       r16, r16, r16
nop
nop
#Final instruction may get cut off - end .text section with nop
nop

.data
TestData:
testValue = 0x0016

