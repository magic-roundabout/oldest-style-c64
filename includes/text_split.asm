;
; TEXT AREA COLOUR SPLITTER
;

; Waits for $d012 on each scanline and changes $d021

; Char line $00
txt_splt_00	lda #$06
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_01	lda #$0b
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_02	lda #$04
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_03	lda #$0e
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_04	lda #$05
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_05	lda #$03
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_06	lda #$0d
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_07	lda #$01
		cpy $d012
		bne *-$03
		sta $d021
		iny

; Char line $01
txt_splt_08	lda #$07
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_09	lda #$0f
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_0a	lda #$0a
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_0b	lda #$0c
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_0c	lda #$08
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_0d	lda #$02
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_0e	lda #$09
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_0f	lda #$00
		cpy $d012
		bne *-$03
		sta $d021
		iny

; Char line $02
txt_splt_10	lda #$06
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_11	lda #$0b
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_12	lda #$04
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_13	lda #$0e
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_14	lda #$05
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_15	lda #$03
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_16	lda #$0d
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_17	lda #$01
		cpy $d012
		bne *-$03
		sta $d021
		iny

; Char line $03
txt_splt_18	lda #$07
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_19	lda #$0f
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_1a	lda #$0a
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_1b	lda #$0c
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_1c	lda #$08
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_1d	lda #$02
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_1e	lda #$09
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_1f	lda #$00
		cpy $d012
		bne *-$03
		sta $d021
		iny

; Char line $04
txt_splt_20	lda #$06
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_21	lda #$0b
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_22	lda #$04
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_23	lda #$0e
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_24	lda #$05
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_25	lda #$03
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_26	lda #$0d
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_27	lda #$01
		cpy $d012
		bne *-$03
		sta $d021
		iny

; Char line $05
txt_splt_28	lda #$07
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_29	lda #$0f
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_2a	lda #$0a
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_2b	lda #$0c
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_2c	lda #$08
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_2d	lda #$02
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_2e	lda #$09
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_2f	lda #$00
		cpy $d012
		bne *-$03
		sta $d021
		iny

; Char line $06
txt_splt_30	lda #$06
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_31	lda #$0b
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_32	lda #$04
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_33	lda #$0e
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_34	lda #$05
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_35	lda #$03
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_36	lda #$0d
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_37	lda #$01
		cpy $d012
		bne *-$03
		sta $d021
		iny

; Char line $07
txt_splt_38	lda #$07
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_39	lda #$0f
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_3a	lda #$0a
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_3b	lda #$0c
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_3c	lda #$08
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_3d	lda #$02
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_3e	lda #$09
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_3f	lda #$00
		cpy $d012
		bne *-$03
		sta $d021
		iny

; Char line $08
txt_splt_40	lda #$06
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_41	lda #$0b
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_42	lda #$04
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_43	lda #$0e
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_44	lda #$05
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_45	lda #$03
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_46	lda #$0d
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_47	lda #$01
		cpy $d012
		bne *-$03
		sta $d021
		iny

; Char line $09
txt_splt_48	lda #$07
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_49	lda #$0f
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_4a	lda #$0a
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_4b	lda #$0c
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_4c	lda #$08
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_4d	lda #$02
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_4e	lda #$09
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_4f	lda #$00
		cpy $d012
		bne *-$03
		sta $d021
		iny

; Char line $0a
txt_splt_50	lda #$06
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_51	lda #$0b
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_52	lda #$04
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_53	lda #$0e
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_54	lda #$05
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_55	lda #$03
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_56	lda #$0d
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_57	lda #$01
		cpy $d012
		bne *-$03
		sta $d021
		iny

; Char line $0b
txt_splt_58	lda #$07
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_59	lda #$0f
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_5a	lda #$0a
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_5b	lda #$0c
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_5c	lda #$08
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_5d	lda #$02
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_5e	lda #$09
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_5f	lda #$00
		cpy $d012
		bne *-$03
		sta $d021
		iny

; Char line $0c
txt_splt_60	lda #$06
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_61	lda #$0b
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_62	lda #$04
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_63	lda #$0e
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_64	lda #$05
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_65	lda #$03
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_66	lda #$0d
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_67	lda #$01
		cpy $d012
		bne *-$03
		sta $d021
		iny

; Char line $0d
txt_splt_68	lda #$07
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_69	lda #$0f
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_6a	lda #$0a
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_6b	lda #$0c
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_6c	lda #$08
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_6d	lda #$02
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_6e	lda #$09
		cpy $d012
		bne *-$03
		sta $d021
		iny

txt_splt_6f	lda #$00
		cpy $d012
		bne *-$03
		sta $d021
		iny
