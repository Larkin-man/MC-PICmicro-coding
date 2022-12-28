#include<p16f84.inc>

; ячейки ОЗУ
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
;Инициализация порта А


        BCF     STATUS,RP0    ;Выбор банка 0
        CLRF    PORTA	      ;Очистить регистр CNTRLPORT
        MOVLW   INITA         ;Загpузить B'11111111' в pегистp W
        BSF     STATUS,RP0    ;Выбор банка 1
        MOVWF   TRISA         ;Все разряды порта А установить как входы
;Инициализация порта В
        BCF     STATUS,RP0    ;Выбор банка 0
        CLRF    PORTB	      ;Очистить регистр DATAPORT
        MOVLW   INITB         ;Загpузить B'00000000' в pегистp W
        BSF     STATUS,RP0    ;Выбор банка 1
        MOVWF   TRISB         ;Все разряды порта В установить как выходы 
;
        BCF     STATUS,RP0    ;Выбор банка 0
        
START

    BTFSS PORTA,0     ;Если нажата кнопка 0, то запускается START1     
    GOTO START1
    BTFSS PORTA,1     ;Если нажата кнопка 1, то запускается START2
    GOTO START2
    BTFSS PORTA,2     ;Если нажата кнопка 2, то запускается START3
    GOTO START3
    BTFSS PORTA,3     ;Если нажата кнопка 3, то запускается START4
    GOTO START4
    BTFSS PORTA,4	
    GOTO START5

GOTO START


START1
 MOVLW B'00010100'        ; В Регистр W заносится число 
 MOVWF PORTB 		  ; Это число переносится на PORTB, т.е. выход на лампочки
       START11            ; Запуск проги беглых огоньков
 	    CALL PAUSE    ; Чтобы огни бегали, а не просто горели ставим задержку(Паузу)
	    RRF PORTB,1   ; Производим сдвиг одного бита вправо ч/з перенос, рез записываем в регистр

          BTFSS PORTA,0   ; Проверка, нужна чтобы можно былов нажатием любой кнопки остановить огоньки
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
	    RLF PORTB,1  ; Производим сдвиг одного бита влево ч/з перенос, рез записываем в регистр
        
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

    PAUSE  		 ; Это Пауза 
	MOVLW 0FFh	 ; В регистр W заносим число 256
	MOVWF SCRATCH    ; Переносим данные из рег W в рег SCRATCH
	MOVLW 0FFh       ; В регистр W заносим число 256
	MOVWF DIGIT       ; Переносим данные из рег W в рег DIGIT
    LOOP
	DECFSZ SCRATCH,1
	GOTO LOOP
	DECFSZ DIGIT,1
	GOTO LOOP
        RETURN
	

END   

