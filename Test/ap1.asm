#include<p16f84.inc>
 ORG 0
 GOTO BEGIN
 ORG 100h
BEGIN

SCRATCH EQU 0Ch
DIGIT EQU 0Dh

 BCF STATUS,RP0
 CLRF PORTB
 MOVLW B'00000000'
 BSF STATUS,RP0
 MOVWF TRISB
 BCF STATUS,RP0

 MOVWF PORTB
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 ;CALL PAUSE
 INCF PORTB,1
 ;CALL PAUSE
 MOVLW 030
 MOVWF SCRATCH
 INCF PORTB,1
 ;CALL PAUSE
 INCF PORTB,1
 ;CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE
 INCF PORTB,1
 CALL PAUSE

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

ZZZ ; ~0,04896125 sec
 MOVLW D'255'
 MOVWF SCRATCH
 MOVWF DIGIT
TWO
 DECFSZ SCRATCH,1
 GOTO TWO
 DECFSZ DIGIT,1
 GOTO TWO
 RETURN

 END
