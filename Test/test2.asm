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

 MOVLW D'3'
 
 MOVWF PORTB
 ADDWF PORTB,1
 MOVF PORTB,0
 
 MOVWF PORTB
 ADDWF PORTB,1
 MOVF PORTB,0 

 MOVWF PORTB
 ADDWF PORTB,1
 MOVF PORTB,0

 MOVWF PORTB
 ADDWF PORTB,1
 MOVF PORTB,0

 MOVWF PORTB
 ADDWF PORTB,1
 MOVF PORTB,0

 MOVWF PORTB
 ADDWF PORTB,1
 MOVF PORTB,0

 MOVWF PORTB
 ADDWF PORTB,1
 MOVF PORTB,0

 MOVWF PORTB
 ADDWF PORTB,1
 MOVF PORTB,0

 MOVWF PORTB
 ADDWF PORTB,1
 MOVF PORTB,0

 MOVWF PORTB
 ADDWF PORTB,1
 MOVF PORTB,0

 MOVWF PORTB
 ADDWF PORTB,1
 MOVF PORTB,0

 MOVWF PORTB
 ADDWF PORTB,1
 MOVF PORTB,0
GOTO $
 END
