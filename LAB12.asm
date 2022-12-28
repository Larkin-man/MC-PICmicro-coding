#include<p16f84.inc>
 ORG 0
 GOTO BEGIN
 ORG 100h
BEGIN

D1 EQU 0Ch
D2 EQU 0Dh
D3 EQU 0Eh
CURRENTFLOOR EQU 0Fh ;������� ����
COUNTSTEPS EQU 010h  ;���������� ����� (������)
ARROW EQU 011h       ;����������� �������� (1 �����, 0 ����)
PURPOSEFLOOR EQU 012h ;������� ����

 BCF STATUS,RP0
 CLRF PORTB
 MOVLW B'00000000'
 BSF STATUS,RP0
 MOVWF TRISB

 BCF STATUS,RP0
 CLRF PORTA
 MOVLW B'00000'
 BSF STATUS,RP0
 MOVWF TRISA
 BCF STATUS,RP0

MOVLW B'11000001'
MOVWF PORTB

MAINLOOP
MOVF PORTA,0
MOVWF PURPOSEFLOOR  ;���������� ������� ����
CLRW
XORWF PURPOSEFLOOR,0
BTFSC STATUS,Z
GOTO MAINLOOP
CALL GETCURRENTFLOOR ;���������� ������� ����
CALL GETPATH  ;����� ���� ��������
BCF PORTB,7
BTFSS ARROW,7  ;������� ���� = �������� - ������� ���� �� ����
CALL MOVLIFT ;������� ����
CALL STOPLIFT ;�������� ����
GOTO MAINLOOP

GETCURRENTFLOOR
CLRF CURRENTFLOOR
MOVLW B'00011111'
ANDWF CURRENTFLOOR,1
RETURN

MOVLIFT
CALL P1s
BTFSC ARROW,0
CALL MOVUP
BTFSS ARROW,0
CALL MOVDOWN
RETURN

MOVUP
CYC3
CALL P1s
BCF STATUS,0
RRF CURRENTFLOOR,1
MOVLW B'11100000'
ANDWF PORTB,1
MOVF CURRENTFLOOR,0
IORWF PORTB,1
DECFSZ COUNTSTEPS,1
GOTO CYC3
RETURN

MOVDOWN
CYC4
CALL P1s
BCF STATUS,0
RLF CURRENTFLOOR,1
MOVLW B'11100000'
ANDWF PORTB,1
MOVF CURRENTFLOOR,0
IORWF PORTB,1
DECFSZ COUNTSTEPS,1
GOTO CYC4
RETURN

STOPLIFT
BCF PORTB,6
BSF PORTB,5
CALL P5s
BCF PORTB,5
BSF PORTB,6
CALL P2s
BSF PORTB,7
RETURN

GETPATH ;������� ���� ����������� �������� � ���������� �����
CALL ISUP
BTFSS ARROW,0
CALL ISDOWN
RETURN

ISUP ;��������� ������� ����������
MOVF CURRENTFLOOR,0
MOVWF D3
CLRF ARROW
CLRF COUNTSTEPS
MOVLW 01h
MOVWF D2
CYC1
MOVF D3,0
XORWF D2,0
BTFSC STATUS,Z
RETURN
INCF COUNTSTEPS,1
RRF D3,1
MOVF D3,0
XORWF PURPOSEFLOOR,0
BTFSS STATUS,Z
GOTO CYC1
BSF ARROW,0
RETURN

ISDOWN ;��������� ������ ����������
BSF ARROW,7
CLRF COUNTSTEPS
MOVF CURRENTFLOOR,0
MOVWF D3
MOVLW B'00010000'
MOVWF D2
CYC2
MOVF D3,0
XORWF D2,0
BTFSC STATUS,Z
RETURN
INCF COUNTSTEPS,1
RLF D3,1
MOVF D3,0
XORWF PURPOSEFLOOR,0
BTFSS STATUS,Z
GOTO CYC2
BCF ARROW,7
BCF ARROW,0
RETURN

P1s
MOVLW D'20'
MOVWF D3
CALL PULS
RETURN

P5s
MOVLW D'102'
MOVWF D3
CALL PULS
RETURN

P2s
MOVLW D'41'
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
