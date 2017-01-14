.include "M32def.inc"
.cseg
.org 0

start: 	ldi r16,0x5F	;nastaveni ukazatele
		out SPL,r16	;zasobniku na 0x085F
		ldi r16,0x08	;konec SRAM
		out SPH,r16	

		ldi r16,0x00
		out DDRB,r16
		ldi r16,0xff
		out DDRA,r16
		out PORTB,r16

cyklus:	in r16,PINB
		out PORTA,r16
		rjmp cyklus



