;
; OLDEST STYLE
;

; Code and graphics by T.M.R/Cosine
; Music by aNdy/Cosine


; This source code is formatted for the ACME cross assembler from
; http://sourceforge.net/projects/acme-crossass/
; Compression is handled with Exomizer which can be downloaded at
; http://csdb.dk/release/?id=141402

; build.bat will call both to create an assembled file and then the
; crunched release version.


; Select an output filename
		!to "oldest.prg",cbm


; Yank in binary data
		* = $0400
		!binary "data/spindly_col.raw",$118

		* = $05b8
text_area_1	!binary "data/screen_1.raw"

		* = $0800
		!binary "data/charset.raw"

		* = $1000
music		!binary "data/bas_braster.prg",,2

		* = $2000
		!binary "data/spindly_bmp.raw",$8c0

		* = $1dd0
text_area_2	!binary "data/screen_2.raw"


; Constants
rstr1p		= $00
rstr2p		= $2e

; Labels
rn		= $40
cos_at_1	= $41

scroll_x	= $42
scroll_speed	= $43
scroll_width	= $44
scroll_col_tmr	= $45

text_col_cnt	= $46
text_wipe_cnt	= $47
text_pulse_cnt	= $48


; Entry point at $28c0
		* = $28c0
entry		sei

; Turn off ROMs and set up interrupts
		lda #$35
		sta $01

		lda #<nmi
		sta $fffa
		lda #>nmi
		sta $fffb

		lda #<int
		sta $fffe
		lda #>int
		sta $ffff

		lda #$7f
		sta $dc0d
		sta $dd0d

		lda $dc0d
		lda $dd0d

		lda #rstr1p
		sta $d012

		lda #$1b
		sta $d011
		lda #$01
		sta $d019
		sta $d01a

; Set the colour RAM
		ldx #$00
		lda #$00
colour_init_1	sta $d800,x
		sta $d900,x
		sta $da00,x
		sta $dae8,x
		inx
		bne colour_init_1

		ldx #$00
		lda #$0b
colour_init_2	sta $d918,x
		sta $d990,x
		inx
		cpx #$28
		bne colour_init_2

; Set up whatever bits of the screen aren't already populated
		ldx #$00
		lda #$20
scrn_init_1	sta $0518,x
		inx
		cpx #$a0
		bne scrn_init_1

; Clear the label space and set a few up
		ldx #$40
		lda #$00
zp_nuke		sta $00,x
		inx
		bne zp_nuke

		lda #$01
		sta rn

		lda #$03
		sta scroll_speed

		lda #$ff
		sta text_wipe_cnt

; Reset the scrolling message
		jsr reset

; Initialise the music
		lda #$00
		jsr music+$00

		cli

; Check to see if space has been pressed
main_loop	lda $dc01
		cmp #$ef
		bne main_loop

; Stop everything and reset the C64
		sei
		lda #$00
		sta $d011
		sta $d020
		sta $d021
		sta $d418

		lda #$37
		sta $01
		jmp $fce2


; IRQ interrupt
int		pha
		txa
		pha
		tya
		pha

		lda $d019
		and #$01
		sta $d019
		bne ya
		jmp ea31

ya		lda rn
		cmp #$02
		bne *+$05
		jmp rout2


; Raster split 1
rout1		lda #$0b
		sta $d020
		sta $d021

		lda #$3b
		sta $d011
		lda #$00
		sta $d016
		lda #$18
		sta $d018

; Update the logo's self mod
		lda cos_at_1
		clc
		adc #$01
		sta cos_at_1
		tax
		ldy d016_cos,x

		!src "includes/logo_update.asm"

; Play the music
		jsr music+$03

; Set up for the second raster split
		lda #$02
		sta rn
		lda #rstr2p
		sta $d012

		jmp ea31


; Raster split 2
rout2

; Split $d016 for the logo
		ldy #rstr2p
		iny
		iny
		iny
		!src "includes/logo_split.asm"

; Set video registers for the scroller
		ldx #$07
		dex
		bne *-$01

		lda scroll_x
		and #$07
		eor #$07

		ldx #$1b
		ldy #$12
		stx $d011
		sta $d016
		sty $d018

; Split $d021 for the scroller
		ldy #$73
		!src "includes/scroll_split.asm"

		ldx #$07
		dex
		bne *-$01
		bit $ea

		lda #$07
		sta $d016

; Split $d021 for the text area
		ldy #$8b
		!src "includes/text_split.asm"

		lda text_col_cnt
		clc
		adc #$01
		cmp #$8c
		bne *+$04
		lda #$00
		sta text_col_cnt

		lsr
		tay
		!src "includes/text_update.asm"

; Update the scrolling message
		ldy scroll_speed

scroll_loop	ldx scroll_x
		inx
		cpx #$08
		bne sx_xb

		ldx #$00
mover		lda $0541,x
		sta $0540,x
		lda $0569,x
		sta $0568,x

		inx
		cpx #$26
		bne mover

		lda scroll_width
		beq mread

; No new character due
		inc $0566
		inc $058e
		dec scroll_width
		jmp sx_xb-$02

; New character due
mread		lda scroll_text
		bne okay
		jsr reset
		jmp mread

okay		cmp #$40
		bcc okay_2

		and #$0f
		sta scroll_speed

		lda #$20
okay_2		tax
		lda char_pos_dcd,x
		sta $0566
		clc
		adc #$20
		sta $058e

		lda char_width_dcd,x
		sta scroll_width

		inc mread+$01
		bne *+$05
		inc mread+$02

		ldx #$00
sx_xb		stx scroll_x

		dey
		bne scroll_loop

; Colour effect for the scroller
		ldx #$26
colour_shift_1	lda $d940,x
		sta $d941,x
		sta $d969,x
		dex
		bpl colour_shift_1

		ldx scroll_col_tmr
		inx
		cpx #$b0
		bne *+$04
		ldx #$00
		stx scroll_col_tmr

		cpx #$1f
		bcc *+$04
		ldx #$1f

		lda scroll_colours,x
		sta $d940
		sta $d968

; Overwrite the colour in the top two lines of the text area
		ldy text_pulse_cnt
		iny
		cpy #$99
		bcc *+$04
		ldy #$00
		sty text_pulse_cnt

		tya
		lsr
		tay
		cpy #$0f
		bcc *+$04
		lda #$0f
		tay

		ldx #$00
		lda text_colours,y
colour_shift_2	sta $d9b8,x
		sta $d9e0,x
		inx
		cpx #$28
		bne colour_shift_2

; Text wiper - update the counter and swap bytes around if needed
		dec text_wipe_cnt

		ldx text_wipe_cnt
		cpx #$26
		bcs *+$0f

		lda text_area_1,x
		ldy text_area_2,x
		sta text_area_2,x
		tya
		sta text_area_1,x

!set line_cnt=$01
!do {
		dex
		cpx #$26
		bcs *+$0f

		lda text_area_1+(line_cnt*$28),x
		ldy text_area_2+(line_cnt*$28),x
		sta text_area_2+(line_cnt*$28),x
		tya
		sta text_area_1+(line_cnt*$28),x

		!set line_cnt=line_cnt+$01
} until line_cnt=$0e

; Set up for the first raster split
		lda #$01
		sta rn
		lda #rstr1p
		sta $d012

; Exit interrupt
ea31		pla
		tay
		pla
		tax
		pla
nmi		rti

; Reset the self mod for the scroller
reset		lda #<scroll_text
		sta mread+$01
		lda #>scroll_text
		sta mread+$02
		rts


; Scrolling message, innit
scroll_text	!scr $43,"welcome to"
		!scr "        "

		!scr $41,"--- oldest style ---"
		!scr "        "

		!scr $43,"a contribution to the csdb icc 2018 from "
		!scr "cosine's secret bunker in the uk (off the a64, "
		!scr "just outside leeds)."
		!scr "        "

		!scr $42,"coding and graphics are by",$41,"t.m.r"
		!scr $42,"with musical stylings from",$41,"andy...",$42
		!scr "            "

		!scr $43,"memory isn't as perilously tight now as it "
		!scr "was before andy worked his magic - i got an "
		!scr "unexpected but welcome block of ram back that had "
		!scr "been reserved for music - but there's still some "
		!scr "memory-eating oddness happening that probably "
		!scr "isn't obvious at first glance;  "

		!scr "the d016 and d021 splits are timed by waiting for "
		!scr "d012 to change, but to make that work on every "
		!scr "scanline i had to completely unroll the loop and "
		!scr "avoid using tables...  so the 184 scanlines of "
		!scr "splitting are being done that way, with 168 of "
		!scr "those lines being modified by more unrolled code "
		!scr "to get things moving!"
		!scr "        "

		!scr $44,"that's where the name ''oldest style'' comes "
		!scr "from, waiting for d012 was how i tried doing "
		!scr "raster splits thirty odd years ago whilst "
		!scr "learning how to code in the 1980s..."
		!scr "     "

		!scr $42,"but i've hopefully got a little better "
		!scr "since then?"
		!scr "        "

		!scr $45,"and now i've had a quick ramble, let's get "
		!scr "the greetings out of the way with some rapidly "
		!scr "scrolling hellos whizzing towards...  "

		!scr $48,"absence, "
		!scr "abyss connection, "
		!scr "arkanix labs, "
		!scr "artstate, "
		!scr "ate bit, "
		!scr "atlantis, "

		!scr "booze design, "

		!scr "camelot, "
		!scr "censor design, "
		!scr "chorus, "
		!scr "chrome, "
		!scr "cncd, "
		!scr "cpu, "
		!scr "crescent, "
		!scr "crest, "
		!scr "covert bitops, "

		!scr "defence force, "
		!scr "dekadence, "
		!scr "desire, "
		!scr "dac, "
		!scr "dmagic, "
		!scr "dual crew, "

		!scr "exclusive on, "

		!scr "fairlight, "
		!scr "f4cg, "
		!scr "fire, "
		!scr "flat 3, "
		!scr "focus, "
		!scr "french touch, "
		!scr "funkscientist productions, "

		!scr "genesis project, "
		!scr "gheymaid inc, "

		!scr "hitmen, "
		!scr "hoaxers, "
		!scr "hokuto force, "

		!scr "legion of doom, "
		!scr "level 64, "

		!scr "maniacs of noise, "
		!scr "mayday, "
		!scr "meanteam, "
		!scr "metalvotze, "

		!scr "noname, "
		!scr "nostalgia, "
		!scr "nuance, "

		!scr "offence, "
		!scr "onslaught, "
		!scr "orb, "
		!scr "oxyron, "

		!scr "padua, "
		!scr "performers, "
		!scr "plush, "
		!scr "ppcs, "
		!scr "psytronik, "

		!scr "reptilia, "
		!scr "resource, "
		!scr "rgcd, "

		!scr "secure, "
		!scr "shape, "
		!scr "side b, "
		!scr "singular, "
		!scr "slash, "
		!scr "slipstream, "
		!scr "success and trc, "
		!scr "style, "
		!scr "suicyco industries, "

		!scr "taquart, "
		!scr "tempest, "
		!scr "tek, "
		!scr "triad, "
		!scr "trsi, "

		!scr "viruz, "
		!scr "vision, "

		!scr "wow, "
		!scr "wrath, "
		!scr "xenon...  "

		!scr "and anyone else we're somehow still "
		!scr "managing to forget!"
		!scr "        "

		!scr $43,"we'll just add the now traditional "
		!scr "mention of cosine's interweb presence at"
		!scr $41,"http://cosine.org.uk/",$43,"and a "
		!scr "truly shameless plug for my blog",$41
		!scr "http://jasonkelk.me.uk/",$43,"for good "
		!scr "measure..."
		!scr "    "

		!scr $43,"and with all of that sorted, i'm going "
		!scr "to make myself scarce now before i "
		!scr "completely run out of space!"
		!scr "        "

		!scr $46,"this was t.m.r on 2018-11-24 - "
		!scr "signing off and wrapping... .. .  ."
		!scr "                 "

		!byte $00	; end of text marker


; The remaining data all lives at $1a00 onwards (after the music)
; to leave room for the scroll text!
		* = $1a00

; Logo $D016 wave data
d016_data	!byte $00,$00,$00,$00,$00,$00,$00,$00
		!byte $00,$00,$00,$00,$00,$00,$00,$00
		!byte $00,$00,$00,$00,$00,$00,$00,$00

		!byte $00,$00,$00,$00,$01,$01,$01,$02
		!byte $02,$03,$04,$05,$05,$06,$06,$06
		!byte $07,$07,$07,$07,$06,$06,$06,$05
		!byte $05,$04,$03,$02,$02,$01,$01,$01

		!byte $00,$00,$00,$00,$01,$01,$02,$03
		!byte $04,$05,$06,$06
		!byte $07,$07,$07,$07,$06,$06,$05,$04
		!byte $03,$02,$01,$01

		!byte $00,$01,$02,$03,$04,$05,$06,$07
		!byte $06,$05,$04,$03,$02,$01
		!byte $00,$01,$02,$03,$04,$05,$06,$07

		!byte $07,$07,$07,$07,$06,$06,$05,$04
		!byte $03,$02,$01,$01
		!byte $00,$00,$00,$00,$01,$01,$02,$03
		!byte $04,$05,$06,$06

		!byte $07,$07,$07,$07,$06,$06,$06,$05
		!byte $05,$04,$03,$02,$02,$01,$01,$01
		!byte $00,$00,$00,$00,$01,$01,$01,$02
		!byte $02,$03,$04,$05,$05,$06,$06,$06

		!byte $07,$07,$07,$07,$07,$07,$07,$07
		!byte $07,$07,$07,$07,$07,$07,$07,$07
		!byte $07,$07,$07,$07,$07,$07,$07,$07

; Cosine table for the $d016 movement
d016_cos	!byte $7e,$7e,$7e,$7e,$7e,$7e,$7e,$7e
		!byte $7d,$7d,$7d,$7c,$7c,$7b,$7b,$7a
		!byte $7a,$79,$78,$78,$77,$76,$75,$75
		!byte $74,$73,$72,$71,$70,$6f,$6e,$6d
		!byte $6c,$6b,$6a,$68,$67,$66,$65,$64
		!byte $62,$61,$60,$5e,$5d,$5b,$5a,$59
		!byte $57,$56,$54,$53,$51,$50,$4e,$4d
		!byte $4b,$4a,$48,$47,$45,$44,$42,$40

		!byte $3f,$3d,$3c,$3a,$39,$37,$36,$34
		!byte $32,$31,$2f,$2e,$2c,$2b,$29,$28
		!byte $27,$25,$24,$22,$21,$20,$1e,$1d
		!byte $1c,$1a,$19,$18,$17,$15,$14,$13
		!byte $12,$11,$10,$0f,$0e,$0d,$0c,$0b
		!byte $0a,$09,$08,$08,$07,$06,$06,$05
		!byte $04,$04,$03,$03,$02,$02,$01,$01
		!byte $01,$00,$00,$00,$00,$00,$00,$00

		!byte $00,$00,$00,$00,$00,$00,$00,$00
		!byte $01,$01,$01,$02,$02,$03,$03,$04
		!byte $04,$05,$06,$06,$07,$08,$09,$09
		!byte $0a,$0b,$0c,$0d,$0e,$0f,$10,$11
		!byte $12,$13,$15,$16,$17,$18,$19,$1b
		!byte $1c,$1d,$1f,$20,$21,$23,$24,$26
		!byte $27,$28,$2a,$2b,$2d,$2e,$30,$31
		!byte $33,$34,$36,$38,$39,$3b,$3c,$3e

		!byte $3f,$41,$42,$44,$46,$47,$49,$4a
		!byte $4c,$4d,$4f,$50,$52,$53,$55,$56
		!byte $58,$59,$5a,$5c,$5d,$5f,$60,$61
		!byte $63,$64,$65,$66,$68,$69,$6a,$6b
		!byte $6c,$6d,$6e,$6f,$70,$71,$72,$73
		!byte $74,$75,$76,$76,$77,$78,$79,$79
		!byte $7a,$7a,$7b,$7b,$7c,$7c,$7d,$7d
		!byte $7d,$7e,$7e,$7e,$7e,$7e,$7e,$7e

; Double font character offsets and widths
char_pos_dcd	!byte $40,$42,$44,$46,$48,$4a,$4c,$4e		; @ to G
		!byte $50,$52,$54,$56,$58,$5a,$5c,$5e		; H to O
		!byte $80,$82,$84,$86,$88,$8a,$8c,$8e		; P to W
		!byte $90,$92,$94,$00,$00,$00,$00,$00		; X to Z, 5 * punct.
		!byte $40,$96,$00,$00,$00,$00,$00,$97		; space to '
		!byte $98,$9a,$00,$00,$9d,$9e,$9c,$c0		; ( to /
		!byte $c2,$c4,$c6,$c8,$ca,$cc,$ce,$d0		; 0 to 7
		!byte $d2,$d4,$d6,$d7,$00,$00,$00,$d8		; 8 to ?

char_width_dcd	!byte $00,$01,$01,$01,$01,$01,$01,$01		; @ to G
		!byte $01,$00,$01,$01,$01,$01,$01,$01		; H to O
		!byte $01,$01,$01,$01,$01,$01,$01,$01		; P to W
		!byte $01,$01,$01,$01,$01,$01,$01,$01		; X to Z, 5 * punct.
		!byte $00,$00,$01,$01,$01,$01,$01,$00		; space to '
		!byte $01,$01,$01,$01,$00,$01,$00,$01		; ( to /
		!byte $01,$01,$01,$01,$01,$01,$01,$01		; 0 to 7
		!byte $01,$01,$00,$00,$01,$01,$01,$01		; 8 to ?

; Scroller's moving colour effect values
scroll_colours	!byte $01,$01,$07,$01,$07,$07,$0f,$07
		!byte $0f,$0f,$0a,$0f,$0a,$0a,$08,$0a
		!byte $08,$08,$02,$08,$02,$02,$09,$02
		!byte $09,$09,$00,$09,$00,$00,$00,$00

; Colour pulse data for the top two lines of the text area
text_colours	!byte $06,$02,$04,$0e,$05,$03,$0d,$01
		!byte $07,$0f,$0a,$0c,$08,$02,$09,$00

; Text area raster colours
text_col_data	!byte $09,$02,$08,$0a,$0f,$07,$01,$07
		!byte $0f,$0a,$08,$02,$09,$00

		!byte $09,$0b,$08,$0a,$03,$07,$01,$0d
		!byte $0f,$0a,$04,$02,$09,$00

		!byte $06,$0b,$04,$0e,$03,$0d,$01,$0d
		!byte $03,$0e,$04,$0b,$06,$00


		!byte $06,$0b,$08,$0e,$03,$07,$01,$0d
		!byte $0f,$0e,$04,$02,$06,$00

		!byte $06,$0b,$08,$0e,$03,$07,$01,$0d
		!byte $0f,$0e,$04,$02,$06,$00

		!byte $09,$0b,$08,$0a,$03,$07,$01,$0d
		!byte $0f,$0a,$04,$02,$09,$00

		!byte $09,$02,$08,$0a,$0f,$07,$01,$07
		!byte $0f,$0a,$08,$02,$09,$00


		!byte $06,$0b,$08,$0e,$03,$07,$01,$0d
		!byte $0f,$0e,$04,$02,$06,$00

		!byte $01,$01,$01,$01,$01,$01,$01,$01
