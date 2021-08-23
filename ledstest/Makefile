main:
	vasm6502_oldstyle -Fbin -dotdir main.asm

burn:
	minipro -p AT28C256 -w a.out

show:
	hexdump -C a.out
