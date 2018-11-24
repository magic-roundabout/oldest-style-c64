;
; LOGO $D016 SPLITTER
;

; Waits for $d012 on each scanline and changes $d016

		cpy $d012
		bne *-$03
		iny

; Char line $00
logo_split_00	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

		cpy $d012
		bne *-$03
		iny

logo_split_01	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_02	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_03	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_04	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_05	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_06	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_07	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

; Char line $01
logo_split_08	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_09	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_0a	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_0b	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_0c	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_0d	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_0e	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_0f	lda #$08
		cpy $d012
		bne *-$03
		sta $d016
		iny

; Char line $02
logo_split_10	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_11	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_12	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_13	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_14	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_15	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_16	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_17	lda #$08
		cpy $d012
		bne *-$03
		sta $d016
		iny

; Char line $03
logo_split_18	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_19	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_1a	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_1b	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_1c	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_1d	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_1e	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_1f	lda #$08
		cpy $d012
		bne *-$03
		sta $d016
		iny

; Char line $04
logo_split_20	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_21	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_22	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_23	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_24	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_25	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_26	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_27	lda #$08
		cpy $d012
		bne *-$03
		sta $d016
		iny

; Char line $05
logo_split_28	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_29	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_2a	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_2b	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_2c	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_2d	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_2e	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_2f	lda #$08
		cpy $d012
		bne *-$03
		sta $d016
		iny

; Char line $06
logo_split_30	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_31	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_32	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_33	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_34	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_35	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_36	lda #$00
		cpy $d012
		bne *-$03
		sta $d016
		iny

logo_split_37	lda #$08
		cpy $d012
		bne *-$03
		sta $d016
		iny
