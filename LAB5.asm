#include<p16f84.inc>
list p=16f84
;
MOVLW 0
TRIS PORTB
OPTION
MOVLW D'10'
MOVWF 0x0D 
MOVLW D'0'
MOVWF 0x0E 
MOVLW D'5'
N
SUBWF 0x0D,0
MOVWF 0x0C 
INCF 0x0E,1
MOVLW 0x0C
BTFSC STATUS,Z
GOTO N
MOVLW 0x0E
MOVWF PORTB
END

