PORTB = $6000
PORTA = $6001

; register addresses to set to either Input
; or Output
DDRB = $6002
DDRA = $6003

E = %10000000
RW = %01000000
RS = %00100000

	.org $8000

reset:
	lda #%11111111
	sta DDRB
	
	lda #%11100000
	sta DDRA

; turn on display or smth idk

	lda #%00111000
	sta PORTB

	lda #0 	;clear rs/rw / e bits
	sta PORTA

	lda #E ; set enable bit
	sta PORTA

	lda #0 	;clear rs/rw / e bits
	sta PORTA

; begin display config
  
	lda #%00001110 ; displ on; cursor on; blink off
	sta PORTB

	lda #0 	;clear rs/rw / e bits
	sta PORTA

	lda #E ; set enable bit
	sta PORTA

	lda #0 	;clear rs/rw / e bits
	sta PORTA

; entry mode set

	lda #%00000110 ; enable cursor and shift mv
	sta PORTB

	lda #0
	sta PORTA

	lda #E
	sta PORTA

	lda #0
	sta PORTA


; begin sending chars in ascii....

	lda #"H"
	sta PORTB

	; tell it that we're sending actual data
	lda #RS
	sta PORTA

	lda #(RS | E)
	sta PORTA

	lda #RS
	sta PORTA

	lda #"O"
	sta PORTB

	; tell it that we're sending actual data
	lda #RS
	sta PORTA

	lda #(RS | E)
	sta PORTA

	lda #RS
	sta PORTA


	lda #"L"
	sta PORTB

	; tell it that we're sending actual data
	lda #RS
	sta PORTA

	lda #(RS | E)
	sta PORTA

	lda #RS
	sta PORTA

	lda #"A"
	sta PORTB

	; tell it that we're sending actual data
	lda #RS
	sta PORTA

	lda #(RS | E)
	sta PORTA

	lda #RS
	sta PORTA


	lda #" "
	sta PORTB

	; tell it that we're sending actual data
	lda #RS
	sta PORTA

	lda #(RS | E)
	sta PORTA

	lda #RS
	sta PORTA


	lda #"P"
	sta PORTB

	; tell it that we're sending actual data
	lda #RS
	sta PORTA

	lda #(RS | E)
	sta PORTA

	lda #RS
	sta PORTA

	lda #"A"
	sta PORTB

	; tell it that we're sending actual data
	lda #RS
	sta PORTA

	lda #(RS | E)
	sta PORTA

	lda #RS
	sta PORTA


	lda #" "
	sta PORTB

	; tell it that we're sending actual data
	lda #RS
	sta PORTA

	lda #(RS | E)
	sta PORTA

	lda #RS
	sta PORTA


	lda #"y"
	sta PORTB

	; tell it that we're sending actual data
	lda #RS
	sta PORTA

	lda #(RS | E)
	sta PORTA

	lda #RS
	sta PORTA


	lda #" "
	sta PORTB

	; tell it that we're sending actual data
	lda #RS
	sta PORTA

	lda #(RS | E)
	sta PORTA

	lda #RS
	sta PORTA


	lda #"M"
	sta PORTB

	; tell it that we're sending actual data
	lda #RS
	sta PORTA

	lda #(RS | E)
	sta PORTA

	lda #RS
	sta PORTA


	lda #"A"
	sta PORB

	; tell it that we're sending actual data
	lda #RS
	sta PORTA

	lda #(RS | E)
	sta PORTA

	lda #RS
	sta PORTA






loop:
  jmp loop
  
  .org $fffc
  .word reset
  .word $0000
