; data address for PORT B IO (8 pins)
PORTA = $6001

; data address for PORT B IO (8 pins)
PORTB = $6000

; register addresses to set to either Input
; or Output
DDRA = $6003
DDRB = $6002

; literal 11111111 binary
; all outputs in IO W65C22
IOSETOUTS = $ff




	.org $8000

reset:

	nop

	; set PORTB output pins
	; to literal 0x50 ( 01010000 binary )
	lda #%11100011
	sta $5999

blink:
	sta PORTB

	jmp blink

	.org $fffc
	.word reset
	.word $0000
