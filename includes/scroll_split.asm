;
; SCROLLING MESSAGE COLOUR SPLITTER
;

; Waits for $d012 on each scanline and changes $d021

; Char line $00
scr_splt_00	lda #$06
		cpy $d012
		bne *-$03
		sta $d021
		iny

scr_splt_01	lda #$0b
		cpy $d012
		bne *-$03
		sta $d021
		iny

scr_splt_02	lda #$04
		cpy $d012
		bne *-$03
		sta $d021
		iny

scr_splt_03	lda #$0e
		cpy $d012
		bne *-$03
		sta $d021
		iny

scr_splt_04	lda #$05
		cpy $d012
		bne *-$03
		sta $d021
		iny

scr_splt_05	lda #$03
		cpy $d012
		bne *-$03
		sta $d021
		iny

scr_splt_06	lda #$0d
		cpy $d012
		bne *-$03
		sta $d021
		iny

scr_splt_07	lda #$01
		cpy $d012
		bne *-$03
		sta $d021
		iny

; Char line $01
scr_splt_08	lda #$07
		cpy $d012
		bne *-$03
		sta $d021
		iny

scr_splt_09	lda #$0f
		cpy $d012
		bne *-$03
		sta $d021
		iny

scr_splt_0a	lda #$0a
		cpy $d012
		bne *-$03
		sta $d021
		iny

scr_splt_0b	lda #$0c
		cpy $d012
		bne *-$03
		sta $d021
		iny

scr_splt_0c	lda #$08
		cpy $d012
		bne *-$03
		sta $d021
		iny

scr_splt_0d	lda #$02
		cpy $d012
		bne *-$03
		sta $d021
		iny

scr_splt_0e	lda #$09
		cpy $d012
		bne *-$03
		sta $d021
		iny

scr_splt_0f	lda #$00
		cpy $d012
		bne *-$03
		sta $d021
		iny
