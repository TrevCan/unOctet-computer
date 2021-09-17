; HEX			$
; 
; literal VALUE		#

	.org $8000
	lda #$ff ; connect to register select B
	sta $6002

	lda #$55 ; load 0x55 (01010101 bin)
	sta $6000

	lda #00 ; load 0 
	sta $6000

	jmp $8005

	.org $fffc
	.word $8000	
	.word $0000
