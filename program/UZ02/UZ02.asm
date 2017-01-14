;****************************************************************
;PB0  - Trig
;PA0  - Tlacitko
;****************************************************************

.include "M32def.inc"
.cseg
.org 0

start: 	ldi r16,0x5F	;nastaveni ukazatele
		out SPL,r16		;zasobniku na 0x085F
		ldi r16,0x08	;konec SRAM
		out SPH,r16	

		ldi r16,0x00	;nastaveni portu A - vstupni
		out DDRA,r16
		ldi r16, 0xff
		out PORTA,r16 	;Pull up

		ldi r16,0xff	;nastaveni portu B - vystupni
		out DDRB,r16


C1:		sbi PORTB, 7
C10:	sbi PORTB, 6

C11:	call delay3		;1s

        sbi PORTB,0		;triger 10us
		call Delay
		cbi PORTB,0

		ldi r18,200		;pocatecni hodnota

C2:		sbis PINA,7		;cekani na zacatek pulsu
		rjmp C2 


C3:		call delay		;cekani 20us
		call delay
		sbis PINA,7
		rjmp C5			;konec pulsu

		dec r18			;snizeni pocitadla
		brne C3
		
		rjmp c1 

C5:		cpi r18,142		;mene nez 20cm
		brmi C1
		cbi PORTB,7

		cpi r18,185

		brmi C10
		cbi PORTB,6
		rjmp C11
				


		;cyklus mereni vzdalenosti
		;-------------------------
		;
		;pokud je nabezna hrana -> pocatecni stav
		;mene nez 10000 us && pokud je sestupna hrana -> konecny stav
		;
		;--- cas (us) / 58 -> centimetry ... centimetry * 58 -> potøebné us
		;5cm -> 290us
		;60cm -> 3480us

	

;-------------------------------------------------------------------- 
;		Zpozdeni TTL 10us

Delay:		ldi r22,50	;nastaveni zpozdeni 
			
Delay0:		
			dec r22		;snizeni hodnoty
			brne Delay0	;opakovani dokud neni 0 (R22x)
			ret




;-------------------------------------------------------------------- 
;			Podprogram zpozdeni (R12,R13,R22) 1s

Delay3:		ldi r22,2	;nastaveni zpozdeni (x12.3ms)
			clr r13
			clr r12

Delay30:	dec r12		;snizeni hodnoty
			brne Delay30	;opakovani dokud neni 0 (256x)
			dec r13		;snizeni hodnoty
			brne Delay30	;opakovani dokud neni 0 (256x)
			dec r22		;snizeni hodnoty
			brne Delay30	;opakovani dokud neni 0 (R22x)
			ret
