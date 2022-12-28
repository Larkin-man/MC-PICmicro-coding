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

    BTFSS PORTA,0     ;���� ������ ������ 0, �� ����������� START1     
    GOTO START1
    BTFSS PORTA,1     ;���� ������ ������ 1, �� ����������� START2
    GOTO START2
    BTFSS PORTA,2     ;���� ������ ������ 2, �� ����������� START3
    GOTO START3
    BTFSS PORTA,3     ;���� ������ ������ 3, �� ����������� START4
    GOTO START4
    BTFSS PORTA,4	
    GOTO START5

GOTO START


START1
 MOVLW B'00010100'        ; � ������� W ��������� ����� 
 MOVWF PORTB 		  ; ��� ����� ����������� �� PORTB, �.�. ����� �� ��������
       START11            ; ������ ����� ������ ��������
 	    CALL PAUSE    ; ����� ���� ������, � �� ������ ������ ������ ��������(�����)
	    RRF PORTB,1   ; ���������� ����� ������ ���� ������ �/� �������, ��� ���������� � �������

          BTFSS PORTA,0   ; ��������, ����� ����� ����� ����� �������� ����� ������ ���������� �������
	  GOTO START1
	  BTFSS PORTA,1
	  GOTO START2
	  BTFSS PORTA,2
	  GOTO START3
	  BTFSS PORTA,3	
	  GOTO START4
          BTFSS PORTA,4	
	  GOTO START5
       GOTO START11
  GOTO START
    

START2
 MOVLW B'00010100'	 
 MOVWF PORTB
       START22
 	    CALL PAUSE
	    RLF PORTB,1  ; ���������� ����� ������ ���� ����� �/� �������, ��� ���������� � �������
        
	  BTFSS PORTA,0
	  GOTO START1
	  BTFSS PORTA,1
	  GOTO START2
	  BTFSS PORTA,2
	  GOTO START3
	  BTFSS PORTA,3	
	  GOTO START4	
          BTFSS PORTA,4	
	  GOTO START5
       GOTO START22
  GOTO START
    
START3
 MOVLW D'1'
 MOVWF PORTB
       START33
 	    CALL PAUSE
	    RLF PORTB,1

          BTFSS PORTA,0
	  GOTO START1
	  BTFSS PORTA,1
	  GOTO START2
	  BTFSS PORTA,2
	  GOTO START3
	  BTFSS PORTA,3	
	  GOTO START4	
          BTFSS PORTA,4	
	  GOTO START5
       GOTO START33
    GOTO START


START4
 MOVLW B'00101010'
 MOVWF PORTB
       START44
 	    CALL PAUSE
	    RLF PORTB,1

          BTFSS PORTA,0
	  GOTO START1
	  BTFSS PORTA,1
	  GOTO START2
	  BTFSS PORTA,2
	  GOTO START3	
 	  BTFSS PORTA,3	
	  GOTO START4
          BTFSS PORTA,4	
	  GOTO START5
       GOTO START44
    GOTO START

START5
    START55
        MOVLW B'10000001'
 	MOVWF PORTB
	CALL PAUSE
	CLRW
 	MOVLW B'01000010'
 	MOVWF PORTB
	CALL PAUSE
	CLRW
	MOVLW B'00100100'
	MOVWF PORTB
	CALL PAUSE
	CLRW
	MOVLW B'00011000'
	MOVWF PORTB
	CALL PAUSE
	CLRW	
 	MOVLW B'00100100'
 	MOVWF PORTB
 	CALL PAUSE
 	CLRW
	MOVLW B'01000010'
 	MOVWF PORTB
 	CALL PAUSE
	CLRW
	    BTFSS PORTA,0
	    GOTO START1
	    BTFSS PORTA,1
	    GOTO START2
	    BTFSS PORTA,2
	    GOTO START3	
 	    BTFSS PORTA,3	
	    GOTO START4
            BTFSS PORTA,4	
	    GOTO START5
    GOTO START55 
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

