#include<p16f84.inc>
list p=16f84

REGn1 EQU 0Ch
REGn2 EQU 0Dh
REGn3 EQU 2Dh
RG1 EQU 0Eh
RG2 EQU 0Fh
RG3 EQU 2Fh
DELAY EQU 1Fh
DELAY2 EQU 1Eh

;//////////////////////
; ���� � �� �����
MOVLW B'11111'
TRIS PORTA
OPTION
; ����� �� �
;MOVLW B'10'
;MOVWF PORTA
;//////////////////////
; ���� � �� �����
MOVLW 0
TRIS PORTB
OPTION
; ����� �� B
MOVLW 0
MOVWF PORTB

;������ � ����
MOVLW B'11110'
MOVWF REGn1
MOVLW B'11101'
MOVWF REGn2
MOVLW B'11011'
MOVWF REGn3


BEGIN

;//////////////////////

;��������� ���������
MOVLW 0
MOVWF RG1
MOVLW 0
MOVWF RG2
MOVLW 0
MOVWF RG3


;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

MOVLW B'11110'
SUBWF PORTA,0
BTFSC STATUS,Z
CALL PROG1

MOVLW B'11101'
SUBWF PORTA,0
BTFSC STATUS,Z
CALL PROG2

MOVLW B'11011'
SUBWF PORTA,0
BTFSC STATUS,Z
CALL PROG3
; �����

KGTY
MOVLW B'11111111'
MOVWF PORTB
CALL PROGZAD
MOVLW B'00000000'
MOVWF PORTB
CALL PROGZAD


;GOTO KGTY
GOTO BEGIN

;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
; ������������ � 1
PROG1
;MOVLW 0
;MOVLW B'1'

MOVLW B'10101010'
MOVWF RG1



METCA
MOVWF PORTB
;+++++++++++++++
;MOVLW 1

COMF RG1,1

;MOVWF 1Ch
MOVFW REGn1
SUBWF PORTA,0
BTFSS STATUS,Z
GOTO BEGIN
;MOVFW 1Ch

CALL PROGZAD

MOVFW RG1
GOTO METCA

RETURN
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
; ������������ � 2
PROG2
;MOVLW B'1'
METCA2
MOVWF PORTB

CALL PROGZAD

RRF RG2,1

;MOVWF 1Ch
MOVFW REGn2
SUBWF PORTA,0
BTFSS STATUS,Z
GOTO BEGIN
;MOVFW 1Ch

MOVFW RG2

BTFSC STATUS,Z
BSF RG2,7

GOTO METCA2
RETURN
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
; ������������ � 3
PROG3
METCA3

MOVLW B'00011000'
MOVWF PORTB
CALL PROGZAD
;$$$$$$$$
MOVFW REGn3
SUBWF PORTA,0
BTFSS STATUS,Z
GOTO BEGIN
;$$$$$$$$
MOVLW B'00100100'
MOVWF PORTB
CALL PROGZAD
;$$$$$$$$
MOVFW REGn3
SUBWF PORTA,0
BTFSS STATUS,Z
GOTO BEGIN
;$$$$$$$$
MOVLW B'01000010'
MOVWF PORTB
CALL PROGZAD
;$$$$$$$$
MOVFW REGn3
SUBWF PORTA,0
BTFSS STATUS,Z
GOTO BEGIN
;$$$$$$$$
MOVLW B'10000001'
MOVWF PORTB
CALL PROGZAD
;$$$$$$$$
MOVFW REGn3
SUBWF PORTA,0
BTFSS STATUS,Z
GOTO BEGIN
;$$$$$$$$
MOVLW B'01000010'
MOVWF PORTB
CALL PROGZAD
;$$$$$$$$
MOVFW REGn3
SUBWF PORTA,0
BTFSS STATUS,Z
GOTO BEGIN
;$$$$$$$$
MOVLW B'00100100'
MOVWF PORTB
CALL PROGZAD
;$$$$$$$$
MOVFW REGn3
SUBWF PORTA,0
BTFSS STATUS,Z
GOTO BEGIN
;$$$$$$$$

GOTO METCA3
RETURN
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
; ������������ ��������
PROGZAD

MOVLW B'11111111'
MOVWF DELAY
MOVWF DELAY2
MET2
MET
NOP
DECFSZ DELAY,1
GOTO MET
DECFSZ DELAY2,1
GOTO MET2
RETURN
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


END

