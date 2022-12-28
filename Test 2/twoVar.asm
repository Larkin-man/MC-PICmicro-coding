#include<p16f84.inc>
 __CONFIG  _XT_OSC & _CP_OFF & _PWRTE_ON & _WDT_OFF 
; ������ ���
SCRATCH         EQU     0Ch
DIGIT           EQU     0Dh
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
        MOVLW D'14'
        MOVWF PORTB
     ;   CALL PAUSE
       ; CALL PAUSE
        MOVLW    D'0'         ;��������� 0FFh � ������� W
        MOVWF    SCRATCH      ;��������� ������� W � SCRATCH
        MOVLW    D'14'         ;��������� 0FFh � ������� W         
        MOVWF    DIGIT      ;��������� ������� W � SCRATCH
        MOVLW    D'2'
LP
        INCF SCRATCH,1
        DECF DIGIT,0
        DECFSZ DIGIT,0      
        GOTO     LP  
        MOVWF PORTB    
;        CALL PAUSE
 ;       CALL PAUSE
        GOTO NACH
PAUSE
       MOVLW    0FFh         ;��������� 0FFh � ������� W
       MOVWF    SCRATCH      ;��������� ������� W � SCRATCH
       MOVLW    0F1h         ;��������� 0FFh � ������� W
       MOVWF    DIGIT        ;��������� ������� W � DIGIT
LOOP
       DECFSZ   SCRATCH,1    ;��������� SCRATCH �� 1
       GOTO     LOOP         ;� ���������� �������, ���� �� ������ =0
OPO
        DECFSZ   DIGIT,1      ;��������� DIGIT �� 1
        GOTO     LOOP         ;� ���������� �� ����� LOOP, ���� �� ������ =0
       RETURN                ;��������� �� ������������

end

