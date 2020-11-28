	;;
	;; data_trailer.asm
	;;
	;; Data that occurs after the main code section.
	;; 
	;; Mostly sprites and, er, the stack.
	;;
	;; FIXME: Identify the remaining bits and pieces.
	;;
        

	;; Start of area that gets moved down...
MoveDownStart:

PanelFlips:	DEFB $00,$00,$00,$00,$00,$00,$00,$00

;; Bitmap of whether the nth sprite is store in flipped format.
SpriteFlips:	DEFS $10,$00

	;;  Background wall tiles
IMG_WALLS:
  .incbin "bin/img_walls.bin"

	DEFB $90,$00,$A0,$00

IMG_3x56:
  .incbin "bin/img_3x56.bin"
IMG_3x32:	
  .incbin "bin/img_3x32.bin"
IMG_3x24:			
  .incbin "bin/img_3x24.bin"
IMG_4x28:			
  .incbin "bin/img_4x28.bin"
IMG_2x24:
  .incbin "bin/img_2x24.bin"
IMG_CHARS:
  .incbin "bin/img_chars.bin"

	;; FIXME: Make into binaries
IMG_ColTop:
        DEFB $00,$03,$00,$03
        DEFB $00,$3C,$00,$CF
        DEFB $01,$F3,$0E,$7C
        DEFB $3F,$9F,$FF,$3C
        DEFB $FC,$F3,$F3,$CF
        DEFB $CF,$3E,$3C,$F8
        DEFB $F3,$E4,$CF,$9C
        DEFB $3E,$78,$79,$F8
        DEFB $67,$F0,$07,$C8

IMG_ColMid:
        DEFB $78,$3C,$1F,$F0
        DEFB $27,$C8,$38,$38
        DEFB $5F,$F4,$4C,$64
        DEFB $73,$9C,$1E,$F0
        DEFB $23,$88,$3C,$78
        DEFB $1F,$F0,$27,$C8

IMG_ColBottom:
        DEFB $78,$3C,$7F,$FC
        DEFB $3F,$F8,$0F,$E0
        DEFB $00,$00,$00,$00
        DEFB $00,$00,$00,$00

;; End of area that gets moved down.
MoveDownEnd:

