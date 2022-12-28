#include<p16f84.inc>
 __CONFIG  _XT_OSC & _CP_OFF & _PWRTE_ON & _WDT_OFF 
; ������ ���
SCRATCH         EQU     0Ch
DIGIT           EQU     0Dh
DAS             EQU     0Eh
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
NACH
        BCF     STATUS,RP0  

	MOVLW	D'5'
	MOVWF	DAS

	CLRW
LOOP
	ADDLW	D'2'
	DECFSZ	DAS, 1
	GOTO 	LOOP

	MOVWF	PORTB
END
