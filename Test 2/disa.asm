#include<p16f84.inc>

; ������ ���
SCRATCH         EQU     0Ch
DIGIT           EQU     0Dh
DIG		EQU	0Eh
INITA           EQU     B'00000000'
INITB           EQU     B'00000000'
        ORG     0
        GOTO    BEGIN
;
        ORG     100h
BEGIN
;������������� ����� �
        BCF     STATUS,RP0    ;����� ����� 0
        CLRF    PORTA	      ;�������� ������� CNTRLPORT
        MOVLW   INITA         ;���p����� B'00000000' � p�����p W
        BSF     STATUS,RP0    ;����� ����� 1
        MOVWF   TRISA         ;��� ������� ����� � ���������� ��� ������
;������������� ����� �
        BCF     STATUS,RP0    ;����� ����� 0
        CLRF    PORTB	      ;�������� ������� DATAPORT
        MOVLW   INITB         ;���p����� B'00000000' � p�����p W
        BSF     STATUS,RP0    ;����� ����� 1
        MOVWF   TRISB         ;��� ������� ����� � ���������� ��� ������ 
;
        BCF     STATUS,RP0    ;����� ����� 0

CLRF PORTB
MOVLW D'20'
MOVWF DIGIT
MOVLW D'5'
LOOP
SUBWF DIGIT,1
INCF PORTB,1
INCFSZ DIGIT,1
DECFSZ DIGIT,1
GOTO LOOP




END
