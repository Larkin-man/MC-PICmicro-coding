#include<p16f84.inc>
DIG	EQU	0Ch
DIG1    EQU	0Dh
NUMBER1 EQU D'4'  ;4
NUMBER2 EQU D'1'   ;10
;ADDONREG EQU OCh

RP EQU 5h

INITA EQU D'0'
INITB EQU D'0'

ORG 0
GOTO BEGIN
ORG 100h

BEGIN



BCF STATUS, RP
CLRF PORTA
MOVLW INITA
BCF STATUS, RP
MOVLW TRISA

BCF STATUS, RP
CLRF PORTB
MOVLW INITB
BCF STATUS, RP
MOVLW TRISB

BCF STATUS, RP
CLRF DIG
START
MOVLW NUMBER1
ADDWF DIG, 0
DECFSZ DIG1,1

GOTO START																																	


END
 
