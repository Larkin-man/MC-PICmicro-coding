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

MAINLOOP
CALL RED
CALL AA
CALL RY
CALL BB
CALL GREEN
CALL AA
CALL BLACK
CALL CC
CALL GREEN
CALL CC
CALL BLACK
CALL CC
CALL GREEN
CALL CC
CALL BLACK
CALL CC
CALL GREEN
CALL CC
CALL BLACK
CALL CC
CALL GREEN
CALL CC
CALL BLACK
CALL CC
CALL GREEN
CALL CC
CALL YELLO
CALL BB
GOTO MAINLOOP

RED
MOVLW B'00000011'
MOVWF PORTB
RETURN

YELLO
MOVLW B'00011000'
MOVWF PORTB
RETURN

RY
MOVLW B'00011011'
MOVWF PORTB
RETURN

BLACK
CLRW
MOVWF PORTB
RETURN

GREEN
MOVLW B'11000000'
MOVWF PORTB
RETURN

AA
MOVLW D'204'
MOVWF D3
CALL PULS
RETURN

BB
MOVLW D'82'
MOVWF D3
CALL PULS
RETURN

CC
MOVLW D'20'
MOVWF D3
CALL PULS
RETURN

PULS
C1
CALL ZZZ
DECFSZ D3,1
GOTO C1
RETURN

ZZZ ; ~0,04896125 sec
 MOVLW D'255'
 MOVWF D1
 MOVWF D2
 LOOP1
 DECFSZ D1,1
 GOTO LOOP1
 DECFSZ D2,1
 GOTO LOOP1
RETURN

END
