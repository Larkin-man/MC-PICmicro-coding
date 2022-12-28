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

MOVLW D'2'
MOVWF PORTB
CLRW
MOVLW D'12'
MOVWF DIGIT
DECF DIGIT,1
METKA
ADDWF PORTB,1
DECFSZ DIGIT,1
GOTO METKA

END

