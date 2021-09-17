	.org $8000

reset:
	lda #%11111111
blink:
	lda #%11111111
	; shift all bits in D0...D8 to the right
	lda #%11100111
	sta $6000

	jmp blink

	.org $fffc
	.word reset
	.word $0000
