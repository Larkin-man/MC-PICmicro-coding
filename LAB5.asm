#include<p16f84.inc>
list p=16f84
;
MOVLW 0
TRIS PORTB
OPTION
MOVLW D'18'
MOVWF 2Dh 
MOVLW D'0'
MOVWF 0Eh 
MOVLW D'6'
N
;MOVWF 0Ch 
INCF 0Eh,1
;MOVFW 0Ch
SUBWF 2Dh,1
BTFSS STATUS,Z
GOTO N
MOVLW D'2'
;MOVWF 0Dh
;DECF 0Dh
;MOVFW 0Dh
MOVWF 1Dh
MOVFW 0Eh

K
ADDWF 0Eh,0

DECFSZ 1Dh,1

GOTO K
MOVWF 1Eh
MOVFW 0Eh
SUBWF 1Eh,0  

MOVWF PORTB
END

