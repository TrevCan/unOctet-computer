; data address for PORT B IO (8 pins)
PORTB = $6000

; data address for PORT B IO (8 pins)
PORTA = $6001

; register addresses to set to either Input
; or Output
DDRB = $6002
DDRA = $6003

; literal 11111111 binary
; all outputs in IO W65C22

; IOSETOUTS = #$ff


E = %00000001
RW = %00000010
RS = %00000100



	.org $8000

reset:
  ; setup IO pins with W65C22
  
  
  ; write literal 0xff (11111111 binary) to Data direction register B
  ; to indicate that we are using all PORT B pins as outputs
  ; initialize all PORTB pins (PB0.... PB7)
  
  ; lda #$ff
  lda #$ff
  sta DDRB
  
  ; set DDRA pins 2,3,4 to OUTPUTS
  lda #%00000111
  sta DDRA
  
  ; init LCD 
  ; shift all bits in D0...D8 to the right
  ; ;sta PORTB
  
  ; lda #$50
  ; sta PORTB
  
  lda #%00111000 ;set 8 bit mode, 2-line display, 8X5 point character mode
  sta PORTB
  lda #0
  sta PORTA
  lda #E
  sta PORTA
  lda #0
  sta PORTA
  
  ; begin display config
  
  lda #%00001110 ;turn on display, cursor on, blinking on
  sta PORTB
  lda #0
  sta PORTA
  lda #E
  sta PORTA
  lda #0
  sta PORTA
  
  
  ; Cursor counting...
  
  lda #%00000110 ;  Increment and shift cursor; don't shift display
  sta PORTB
  lda #0
  sta PORTA
  lda #E
  sta PORTA
  lda #0
  sta PORTA
  
  ; Write Ascii code..
  
  lda #"H" ; write letter H
  sta PORTB
  lda #RS
  sta PORTA
  lda #(RS | E)
  ; set register select and enable
  sta PORTA
  lda #RS	
  sta PORTA
  
loop:
  jmp loop
  
  .org $fffc
  .word reset
  .word $0000
