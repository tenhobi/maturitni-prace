.include "M32def.inc"
.equ TA=512
.equ TB=256

.cseg
.org 0
reset:	jmp start		;reset vektora

;-------------------------------------------------
.org 0x100




start: 	ldi r16,0x5F	;nastaveni ukazatele
		out SPL,r16		;zasobniku na 0x085F
		ldi r16,0x08	;konec SRAM
		out SPH,r16	

		ldi r16,0x30	;PortD
		out DDRD,r16

		ldi r16,0x00	;nulovani citace 1
		out TCNT1H,r16
		out TCNT1L,r16

		ldi r16,high(TA)	;nastaveni komparacniho registru 1A
		out OCR1AH,r16		;horni byte
		ldi r16,low(TA)
		out OCR1AL,r16		;dolni byte

		ldi r16,high(TB)	;nastaveni komparacniho registru 1B
		out OCR1BH,r16		;horni byte
		ldi r16,low(TB)
		out OCR1BL,r16		;dolni byte


		ldi r16,0b10111111
		out TCCR1A,r16

		ldi r16,0b00001101
		out TCCR1B,r16


konec:	rjmp konec
;-------------------------------------------------
