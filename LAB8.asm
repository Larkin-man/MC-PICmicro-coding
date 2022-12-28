#include<p16f84.inc>
 ORG 0
 GOTO BEGIN
 ORG 100h
BEGIN

 D1 EQU 0Ch
 D2 EQU 0Dh

 BCF STATUS,RP0
 CLRF PORTB
 MOVLW B'00000000'
 BSF STATUS,RP0
 MOVWF TRISB
 BCF STATUS,RP0
 
 BCF STATUS,RP0
 CLRF PORTA
 MOVLW B'11111'
 BSF STATUS,RP0
 MOVWF TRISA
 BCF STATUS,RP0

 LOOP

 BTFSC PORTA,1
 CALL FAR
 BTFSS PORTA,1
 CALL UNFAR

 BTFSC PORTA,2
 CALL GAB
 BTFSS PORTA,2
 CALL UNGAB

 BTFSC PORTA,4
 GOTO AVA
 RETPOINT

 BTFSC PORTA,0
 CALL FROT

 BTFSC PORTA,3
 CALL SROT

 GOTO LOOP

 FAR
 BSF PORTB,1
 BSF PORTB,2
 BSF PORTB,5
 BSF PORTB,6
 RETURN

 UNFAR
 BCF PORTB,1
 BCF PORTB,2
 BCF PORTB,5
 BCF PORTB,6
 RETURN

 GAB
 BSF PORTB,3
 BSF PORTB,4
 RETURN

 UNGAB
 BCF PORTB,3
 BCF PORTB,4
 RETURN

 FROT
 BTFSC PORTA,3
 GOTO ERR
 BSF PORTB,0
 CALL ZZZ
 BCF PORTB,0
 CALL ZZZ
 RETURN

 SROT
 BTFSC PORTA,0
 GOTO ERR
 BSF PORTB,7
 CALL ZZZ
 BCF PORTB,7
 CALL ZZZ
 RETURN

 AVA
 BTFSC PORTA,0
 GOTO ERR
 BTFSC PORTA,3
 GOTO ERR
 BSF PORTB,0
 BSF PORTB,7
 CALL ZZZ
 BCF PORTB,0
 BCF PORTB,7
 CALL ZZZ
 GOTO RETPOINT

 ZZZ
 MOVLW D'255'
 MOVWF D2
 LOOP1
 MOVLW D'255'
 MOVWF D1
 LOOP2
 DECFSZ D1,1
 GOTO LOOP2
 DECFSZ D2,1
 GOTO LOOP1
 RETURN

 ERR
 MOVLW B'11111111'
 MOVWF PORTB
 CALL ZZZ
 CLRF PORTB
 CALL ZZZ
 GOTO LOOP

 END
