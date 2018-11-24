;
; TEXT AREA COLOUR SPLITTER UPDATE
;

; Updates the self mod for txt_splt.asm

		lda text_col_data+$00,y
		sta txt_splt_00+$01

		lda text_col_data+$01,y
		sta txt_splt_01+$01

		lda text_col_data+$02,y
		sta txt_splt_02+$01
		sta txt_splt_08+$01

		lda text_col_data+$03,y
		sta txt_splt_03+$01
		sta txt_splt_09+$01

		lda text_col_data+$04,y
		sta txt_splt_04+$01
		sta txt_splt_0a+$01
		sta txt_splt_10+$01

		lda text_col_data+$05,y
		sta txt_splt_05+$01
		sta txt_splt_0b+$01
		sta txt_splt_11+$01

		lda text_col_data+$06,y
		sta txt_splt_06+$01
		sta txt_splt_0c+$01
		sta txt_splt_12+$01
		sta txt_splt_18+$01

		lda text_col_data+$07,y
		sta txt_splt_07+$01
		sta txt_splt_0d+$01
		sta txt_splt_13+$01
		sta txt_splt_19+$01

		lda text_col_data+$08,y
		sta txt_splt_0e+$01
		sta txt_splt_14+$01
		sta txt_splt_1a+$01
		sta txt_splt_20+$01

		lda text_col_data+$09,y
		sta txt_splt_0f+$01
		sta txt_splt_15+$01
		sta txt_splt_1b+$01
		sta txt_splt_21+$01

		lda text_col_data+$0a,y
		sta txt_splt_16+$01
		sta txt_splt_1c+$01
		sta txt_splt_22+$01
		sta txt_splt_28+$01	;

		lda text_col_data+$0b,y
		sta txt_splt_17+$01
		sta txt_splt_1d+$01
		sta txt_splt_23+$01
		sta txt_splt_29+$01

		lda text_col_data+$0c,y
		sta txt_splt_1e+$01
		sta txt_splt_24+$01
		sta txt_splt_2a+$01
		sta txt_splt_30+$01	;

		lda text_col_data+$0d,y
		sta txt_splt_1f+$01
		sta txt_splt_25+$01
		sta txt_splt_2b+$01
		sta txt_splt_31+$01

		lda text_col_data+$0e,y
		sta txt_splt_26+$01
		sta txt_splt_2c+$01
		sta txt_splt_32+$01
		sta txt_splt_38+$01	;

		lda text_col_data+$0f,y
		sta txt_splt_27+$01
		sta txt_splt_2d+$01
		sta txt_splt_33+$01
		sta txt_splt_39+$01

		lda text_col_data+$10,y
		sta txt_splt_2e+$01
		sta txt_splt_34+$01
		sta txt_splt_3a+$01
		sta txt_splt_40+$01	;

		lda text_col_data+$11,y
		sta txt_splt_2f+$01
		sta txt_splt_35+$01
		sta txt_splt_3b+$01
		sta txt_splt_41+$01

		lda text_col_data+$12,y
		sta txt_splt_36+$01
		sta txt_splt_3c+$01
		sta txt_splt_42+$01
		sta txt_splt_48+$01	;

		lda text_col_data+$13,y
		sta txt_splt_37+$01
		sta txt_splt_3d+$01
		sta txt_splt_43+$01
		sta txt_splt_49+$01

		lda text_col_data+$14,y
		sta txt_splt_3e+$01
		sta txt_splt_44+$01
		sta txt_splt_4a+$01
		sta txt_splt_50+$01	;

		lda text_col_data+$15,y
		sta txt_splt_3f+$01
		sta txt_splt_45+$01
		sta txt_splt_4b+$01
		sta txt_splt_51+$01

		lda text_col_data+$16,y
		sta txt_splt_46+$01
		sta txt_splt_4c+$01
		sta txt_splt_52+$01
		sta txt_splt_58+$01	;

		lda text_col_data+$17,y
		sta txt_splt_47+$01
		sta txt_splt_4d+$01
		sta txt_splt_53+$01
		sta txt_splt_59+$01

		lda text_col_data+$18,y
		sta txt_splt_4e+$01
		sta txt_splt_54+$01
		sta txt_splt_5a+$01
		sta txt_splt_60+$01	;

		lda text_col_data+$19,y
		sta txt_splt_4f+$01
		sta txt_splt_55+$01
		sta txt_splt_5b+$01
		sta txt_splt_61+$01

		lda text_col_data+$1a,y
		sta txt_splt_56+$01
		sta txt_splt_5c+$01
		sta txt_splt_62+$01
		sta txt_splt_68+$01	;

		lda text_col_data+$1b,y
		sta txt_splt_57+$01
		sta txt_splt_5d+$01
		sta txt_splt_63+$01
		sta txt_splt_69+$01

		lda text_col_data+$1c,y
		sta txt_splt_5e+$01
		sta txt_splt_64+$01
		sta txt_splt_6a+$01

		lda text_col_data+$1d,y
		sta txt_splt_5f+$01
		sta txt_splt_65+$01
		sta txt_splt_6b+$01

		lda text_col_data+$1e,y
		sta txt_splt_66+$01
		sta txt_splt_6c+$01

		lda text_col_data+$1f,y
		sta txt_splt_67+$01
		sta txt_splt_6d+$01

		lda text_col_data+$20,y
		sta txt_splt_6e+$01

		lda text_col_data+$21,y
		sta txt_splt_6f+$01
