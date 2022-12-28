#include<p16f84.inc>

; ячейки ОЗУ
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
        BCF     STATUS,RP0    ;Выбор банка 0

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
