#include<p16f84.inc>

; ������ ���
SCRATCH         EQU     0Ch
F1              EQU     0Dh
DIGIT		EQU	0Fh
DIG		EQU	0Eh
INITA           EQU     B'11111111'
INITB           EQU     B'00000000'
        ORG     0
        GOTO    BEGIN
;
        ORG     100h
BEGIN
;������������� ����� �


        BCF     STATUS,RP0    ;����� ����� 0
        CLRF    PORTA	      ;�������� ������� CNTRLPORT
        MOVLW   INITA         ;���p����� B'11111111' � p�����p W
        BSF     STATUS,RP0    ;����� ����� 1
        MOVWF   TRISA         ;��� ������� ����� � ���������� ��� �����
;������������� ����� �
        BCF     STATUS,RP0    ;����� ����� 0
        CLRF    PORTB	      ;�������� ������� DATAPORT
        MOVLW   INITB         ;���p����� B'00000000' � p�����p W
        BSF     STATUS,RP0    ;����� ����� 1
        MOVWF   TRISB         ;��� ������� ����� � ���������� ��� ������ 
;
        BCF     STATUS,RP0    ;����� ����� 0
        
START
	MOVLW B'01100000'
	CLRF F1
		LOOP1
		
		MOVWF PORTB
		CALL PAUSE
		MOVWF F1	
;CALL PAUSE		
SWAPF F1,0

		GOTO LOOP1
GOTO START



 PAUSE  		 ; ��� ����� 
	MOVLW 0FFh	 ; � ������� W ������� ����� 256
	MOVWF SCRATCH    ; ��������� ������ �� ��� W � ��� SCRATCH
	MOVLW 0FFh       ; � ������� W ������� ����� 256
	MOVWF DIGIT       ; ��������� ������ �� ��� W � ��� DIGIT
    LOOP
	DECFSZ SCRATCH,1
	GOTO LOOP
	DECFSZ DIGIT,1
	GOTO LOOP
        RETURN
END
