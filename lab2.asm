#include<p16f84.inc>
 ORG 0
 GOTO BEGIN
 ORG 100h
BEGIN

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

LOOP
 MOVF PORTA,0
 MOVWF PORTB
 GOTO LOOP
 END