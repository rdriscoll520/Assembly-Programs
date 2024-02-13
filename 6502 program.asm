LDA #0x11 ;load value 17
STA 0x100 ;store value in memory
LDA #0x12 ;34
STA 0x101
LDA #0x13 ;51
STA 0x102
LDA #0x14 ;68
STA 0x103; ;ram locations done

LDA #0  ;set accumlator to 0
ADC 0x100 ;add all numbers together
ADC 0x101
ADC 0x102
ADC 0x103

LSR ;shift right, dividing by two
LSR ;diving by two again, making diving by four

STA 0x104 ;store that value in unused memory address


LDA 0x100 ;load first value to check >av
SBC 0x104 ;subtract by average value, if negative its less than

BMI SetOneToZero ;function

ReturnPoint1: ;needed to get back

LDA 0x101 ;load second
SBC 0x104 ;subtract

BMI SetTwoToZero ;same stuff

ReturnPoint2:

LDA 0x102 
SBC 0x104

BMI SetThreeToZero

ReturnPoint3:

LDA 0x103
SBC 0x104

BMI SetFourToZero

ReturnPoint4:

BRK; ;completed


SetOneToZero:

LDA #0 
STA 0x100 ;sets value at address to zero

JMP ReturnPoint1; ;RETURN

SetTwoToZero:

LDA #0
STA 0x101

JMP ReturnPoint2;


SetThreeToZero:

LDA #0
STA 0x102


JMP ReturnPoint3;


SetFourToZero:

LDA #0
STA 0x103

JMP ReturnPoint4;




