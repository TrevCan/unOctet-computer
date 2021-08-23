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
	; setup IO pins with W65C22


	; write literal 0xff (11111111 binary) to Data direction register B
	; to indicate that we are using all PORT B pins as outputs
	; initialize all PORTB pins (PB0.... PB7)

	lda #IOSETOUTS
	sta DDRB

	; set DDRA pins 2,3,4 to OUTPUTS
	lda #%00111000
	sta DDRA



	; set PORTB output pins
	; to literal 0x50 ( 01010000 binary )
	lda #%10000000
	sta $5999

blink:
	; shift all bits in D0...D8 to the right
	ror
	sta PORTB

	jmp blink

	.org $fffc
	.word reset
	.word $0000
