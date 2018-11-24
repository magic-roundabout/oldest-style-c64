; This is a cheap and cheerful way to add the text line about
; using an 8580 SID that appears during loading!

; Run build.bat to assemble the main file, crunch it and
; then assemble this for a final executable.

; Select an output filename
		!to "oldest_linked.prg",cbm

; Text message
		* = $07c0
		!scr "  -=- please use an 8580 sid chip! -=-  "

; Include the crunched file
		* = $0801
		!binary "oldest_exo.prg",,2