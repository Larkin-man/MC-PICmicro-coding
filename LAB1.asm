#include<p16f84.inc>
 __CONFIG  _XT_OSC & _CP_OFF & _PWRTE_ON & _WDT_OFF 
; ������ ���
SCRATCH         EQU     0Ch
DIGIT           EQU     0Dh
INITA           EQU     B'00000000'
INITB           EQU     B'00000000'
        ORG     0
        GOTO    BEGIN

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

 BCF     STATUS,RP0 



MOVLW D'9'
MOVWF PORTB
GOTO $
END
