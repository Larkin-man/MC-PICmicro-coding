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
        CLRF    PORTA	      ;�������� ������� PORT�
        MOVLW   INITA         ;���p����� B'11111111' � p�����p W
        BSF     STATUS,RP0    ;����� ����� 1
        MOVWF   TRISA         ;��� ������� ����� � ���������� ��� �����
;������������� ����� �
        BCF     STATUS,RP0    ;����� ����� 0
        CLRF    PORTB	      ;�������� ������� PORTB
        MOVLW   INITB         ;���p����� B'00000000' � p�����p W
        BSF     STATUS,RP0    ;����� ����� 1
        MOVWF   TRISB         ;��� ������� ����� � ���������� ��� ������ 
;
        BCF     STATUS,RP0    ;����� ����� 0
        
START
  
  BTFSS PORTA,0
  GOTO START1
  BTFSS PORTA,1
  GOTO START2
  BTFSS PORTA,2
  GOTO START3
GOTO START


START1
	MOVLW D'40'
	MOVWF F1
	MOVWF SCRATCH
	CLRW
	MOVLW D'4'
	CLRF DIG

  LOOP1
  INCF DIG,1
  SUBWF F1,1
  MOVF F1,0
  MOVWF SCRATCH
  MOVLW D'4'
  INCF SCRATCH,1
  DECFSZ SCRATCH,1
  GOTO LOOP1

  MOVF DIG,0
  MOVWF PORTB
  GOTO START
    

START2
  MOVLW D'8'
  MOVWF SCRATCH
  CLRW

  LOOP2
  ADDLW D'2'
  DECFSZ SCRATCH,1
  GOTO LOOP2
  MOVWF PORTB
  GOTO START
    
START3
 MOVLW D'1'
 MOVWF PORTB
 STARTOG
 	CALL PAUSE
	RLF PORTB,1
  BTFSS PORTA,0
  GOTO START1
  BTFSS PORTA,1
  GOTO START2
  BTFSS PORTA,2
  GOTO START3	
	GOTO STARTOG

GOTO START

PAUSE
	MOVLW 0FFh
	MOVWF SCRATCH
	MOVLW 0FFh
	MOVF DIGIT
  LOOP
	DECFSZ SCRATCH,1
	GOTO LOOP
	DECFSZ DIGIT,1
	GOTO LOOP
  RETURN
	

END
k,kp,k
