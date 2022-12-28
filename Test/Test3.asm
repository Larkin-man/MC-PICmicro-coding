#include<p16f84.inc>
 ORG 0
 GOTO BEGIN
 ORG 100h
BEGIN

 SCRATCH EQU 0Ch
 DIGIT EQU 0Dh 
 REG EQU 0Eh

 BCF STATUS,RP0
 CLRF PORTB
 MOVLW B'00000000'
 BSF STATUS,RP0
 MOVWF TRISB
 BCF STATUS,RP0

 MOVLW 01h
 MOVWF PORTB
ONE
 MOVLW 08h
 MOVWF REG
 
TWO
 CALL PAUSE
 BSF STATUS,0
 DECFSZ REG,1
 BCF STATUS,0
 RLF PORTB
 MOVLW 01h
 XORWF PORTB,0
 BTFSC STATUS,Z
 GOTO ONE
 
 GOTO TWO

PAUSE ; ������� ������� 1��
 MOVLW D'255'
 MOVWF DIGIT
THREE
 MOVLW D'255'
 MOVWF SCRATCH
FOUR
 DECFSZ SCRATCH,1
 GOTO FOUR
 DECFSZ DIGIT,1
 GOTO THREE
 RETURN

 END
