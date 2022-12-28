;Toggle the GP0 pin at a rate
;determined by DELAY.

	list p=12c508a
	#include <p12c508a.inc>

TEMP1	equ	0x18			;Temp variables
TEMP2	equ	0x19
TEMP3	equ	0x1A

	org	0x00			;Effective Reset Vector

	clrf	GPIO			;Clear I/O Port
	movlw	0x00			;Clear W Reg
	tris	GPIO			;Set PortB as output

LOOP
	bsf	GPIO, 0			;Set GP0
	call	DELAY			;Wait

	bcf	GPIO, 0			;Clear GP0
	call	DELAY			;Wait

	goto	LOOP			;Repeat

;***************************************
;*  This routine is a software delay.  *
;*  Fosc = 1/Tosc; Tcycle = 4 x Tosc   *
;*  Delay = TEMP1xTEMP2xTEMP3xTcycle   *
;***************************************

DELAY

	movlw	0xFF 
	movwf	TEMP1			;TEMP1 = 255
	movwf	TEMP2			;TEMP2 = 255
	movlw	0x07 
	movwf	TEMP3			;TEMP3 = 7

DLOOP
	decfsz  TEMP1, F
	goto    DLOOP

	decfsz  TEMP2, F
	goto    DLOOP

	decfsz  TEMP3, F
	goto    DLOOP

	retlw	0x00

	end		
