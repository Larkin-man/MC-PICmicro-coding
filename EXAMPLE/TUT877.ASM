;**********************************************************
;*  TUT877.ASM
;**********************************************************
;*  Microchip Technology Incorporated
;*  16 December 1998
;*  Assembled with MPASM V2.20
;**********************************************************
;*  This program configures the A/D Module to convert on
;*  A/D channel 0 (the potentiometer) and display the
;*  results on the LEDS on PORTC.  Make sure that the DIP
;*  switch SW3 has all switches in the ON position.
;**********************************************************

	list p=16f877

	; Include file, change directory if needed
	include "p16f877.inc"


	; Start at the reset vector
	org	0x000
	nop
Start
	banksel PORTC
	clrf	PORTC		;Clear PORTC
	movlw	B'01000000'	;Fosc/8, A/D enabled
	movwf	ADCON0

	banksel OPTION_REG
	movlw	B'10000111'	;TMR0 prescaler, 1:256
	movwf	OPTION_REG
	clrf	TRISC		;PORTC all outputs
	movlw	B'00001110'	;Left justify,1 analog channel
	movwf	ADCON1		;VDD and VSS references

	banksel PORTC

Main
	btfss	INTCON,T0IF	;Wait for Timer0 to timeout
	goto	Main
	bcf	INTCON,T0IF

	bsf	ADCON0,GO	;Start A/D conversion
Wait
	btfss	PIR1,ADIF	;Wait for conversion to complete
	goto	Wait

	movf	ADRESH,W	;Write A/D result to PORTC
	movwf	PORTC		;LEDs

	clrf	PORTC
WaitPush
	btfss	PORTB,0
	goto	WaitPush

	movwf	PORTC
	goto	Main		;Do it again

	end
