#include<p16f84.inc>
 __CONFIG  _XT_OSC & _CP_OFF & _PWRTE_ON & _WDT_OFF 
; ячейки ОЗУ
SCRATCH         EQU     0Ch
DIGIT           EQU     0Dh
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
        MOVLW D'14'
        MOVWF PORTB
     ;   CALL PAUSE
       ; CALL PAUSE
        MOVLW    D'0'         ;Загрузить 0FFh в регистр W
        MOVWF    SCRATCH      ;Загрузить регистр W в SCRATCH
        MOVLW    D'14'         ;Загрузить 0FFh в регистр W         
        MOVWF    DIGIT      ;Загрузить регистр W в SCRATCH
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
       MOVLW    0FFh         ;Загрузить 0FFh в регистр W
       MOVWF    SCRATCH      ;Загрузить регистр W в SCRATCH
       MOVLW    0F1h         ;Загрузить 0FFh в регистр W
       MOVWF    DIGIT        ;Загрузить регистр W в DIGIT
LOOP
       DECFSZ   SCRATCH,1    ;Уменьшить SCRATCH на 1
       GOTO     LOOP         ;и переходить обратно, пока не станет =0
OPO
        DECFSZ   DIGIT,1      ;Уменьшить DIGIT на 1
        GOTO     LOOP         ;и переходить на метку LOOP, пока не станет =0
       RETURN                ;Вернуться из подпрограммы

end

