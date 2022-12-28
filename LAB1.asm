#include<p16f84.inc>
 ORG 0
 GOTO BEGIN ;Эта команда находится по адресу 0h
 ORG 100h
BEGIN       ;а эта по адресу 100h

 BCF STATUS,RP0
 CLRF PORTB
 MOVLW B'00000000'
 BSF STATUS,RP0
 MOVWF TRISB
 BCF STATUS,RP0

 MOVLW H'13'
 MOVWF PORTB
 
 GOTO $  ; Это необязательно
 END

