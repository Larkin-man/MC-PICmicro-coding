#include<p16f84.inc>
 __CONFIG  _XT_OSC & _CP_OFF & _PWRTE_ON & _WDT_OFF 
; ячейки ОЗУ
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
;Инициализация порта А
        BCF     STATUS,RP0    ;Выбор банка 0
        CLRF    PORTA	      ;Очистить регистр CNTRLPORT
        MOVLW   INITA         ;Загpузить B'00000000' в pегистp W
        BSF     STATUS,RP0    ;Выбор банка 1
        MOVWF   TRISA         ;Все разряды порта А установить как выходы
;Инициализация порта В
        BCF     STATUS,RP0    ;Выбор банка 0
        CLRF    PORTB	      ;Очистить регистр DATAPORT
        MOVLW   INITB         ;Загpузить B'00000000' в pегистp W
        BSF     STATUS,RP0    ;Выбор банка 1
        MOVWF   TRISB         ;Все разряды порта В установить как выходы 
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
