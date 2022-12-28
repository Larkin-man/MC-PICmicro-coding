#include<p16f84.inc>
 ORG 0
 GOTO BEGIN
 ORG 100h
BEGIN

 CODE1 EQU 0Ch
 CODE2 EQU 0Dh
 CODE3 EQU 0Eh
 CODE4 EQU 0Fh
 CODE5 EQU 010h
 X EQU 011h
 Y EQU 012h
 
MAIN

 BCF STATUS,RP0
 CLRF PORTB
 MOVLW B'00000000'
 BSF STATUS,RP0
 MOVWF TRISB
 
 BCF STATUS,RP0
 CLRF PORTA
 MOVLW B'11111'
 BSF STATUS,RP0
 MOVWF TRISA
 BCF STATUS,RP0

 MOVLW B'11000'
 MOVWF CODE1
 MOVLW B'01100'
 MOVWF CODE2
 MOVLW B'00110'
 MOVWF CODE3
 MOVLW B'00011'
 MOVWF CODE4
 MOVLW B'10001'
 MOVWF CODE5

 MOVF PORTA,0
 XORWF CODE1,1
 BTFSC STATUS,Z
 CALL ONE

 MOVF PORTA,0
 XORWF CODE2,1
 BTFSC STATUS,Z
 CALL TWO

 MOVF PORTA,0
 XORWF CODE3,1
 BTFSC STATUS,Z
 CALL THREE

 MOVF PORTA,0
 XORWF CODE4,1
 BTFSC STATUS,Z
 CALL FOUR

GOTO MAIN

ONE
 MOVLW H'13'
 MOVWF PORTB
 CALL CANCEL
RETURN

TWO
 MOVLW D'100'
 ADDLW D'42'
 MOVWF PORTB
 CALL CANCEL
RETURN

THREE
 MOVLW 013h
 MOVWF X
 LOOP1
 MOVLW 012h
 ADDWF PORTB,1
 DECFSZ X,1
 GOTO LOOP1
 CALL CANCEL
RETURN

FOUR
 MOVLW 0h
 MOVWF PORTB
 MOVLW D'200'
 MOVWF Y
 MOVLW D'4'
 LOOP2
 INCF PORTB,1 
 SUBWF Y,1
 BTFSS STATUS,Z
 GOTO LOOP2
 CALL CANCEL
RETURN
 
CANCEL
 MOVF CODE5,0
 XORWF PORTA,0
 BTFSS STATUS,Z
 GOTO CANCEL
RETURN

END
