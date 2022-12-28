#include<p16f84.inc>
 ORG 0
 GOTO BEGIN
 ORG 100h
BEGIN

D1 EQU 0Ch
D2 EQU 0Dh
D3 EQU 0Eh

 BCF STATUS,RP0
 CLRF PORTB
 MOVLW B'00000000'
 BSF STATUS,RP0
 MOVWF TRISB
 BCF STATUS,RP0

MAIN
 MOVLW B'00000011'
 MOVWF PORTB
 CALL A10
 MOVLW B'00011011'
 MOVWF PORTB
 CALL B4
 MOVLW B'11000000'
 MOVWF PORTB
 CALL A10
 CLRF PORTB
 CALL C1
 MOVLW B'11000000'
 MOVWF PORTB
 CALL C1
 CLRF PORTB
 CALL C1
 MOVLW B'11000000'
 MOVWF PORTB
 CALL C1
 CLRF PORTB
 CALL C1
 MOVLW B'11000000'
 MOVWF PORTB
 CALL C1
 CLRF PORTB
 CALL C1
 MOVLW B'11000000'
 MOVWF PORTB
 CALL C1
 CLRF PORTB
 CALL C1
 MOVLW B'11000000'
 MOVWF PORTB
 CALL C1
 MOVLW B'00011000'
 MOVWF PORTB
 CALL B4
 GOTO MAIN

A10
 MOVLW D'204'
 MOVWF D3
 CALL PULS
 RETURN

B4
 MOVLW D'82'
 MOVWF D3
 CALL PULS
 RETURN

C1
 MOVLW D'20'
 MOVWF D3
 CALL PULS
 RETURN

PULS
 CALL PAUSE
 DECFSZ D3,1
 GOTO PULS
 RETURN

PAUSE ; ~0,04896125 sec
 MOVLW D'255'
 MOVWF D1
 MOVWF D2
TWO
 DECFSZ D1,1
 GOTO TWO
 DECFSZ D2,1
 GOTO TWO
 RETURN

END
