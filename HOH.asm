;;
;; HOH.asm
;;
;; Main Head Over Heels source file
;;
;; Glues together all the individual source files
;;
      macro modePrism value
        ld      a, $50
        ld      bc, $fc3b
        out     (c), a
        inc     b
        ld      a, value<<7
        out     (c), a
      endm
      macro tobp1
        ld      a, $10
        ld      bc, $7ffd
        out     (c), a
      endm
      macro tobp3
        ld      a, $04
        ld      bc, $1ffd
        out     (c), a
      endm
      macro tobp2
        xor     a
        ld      bc, $7ffd
        out     (c), a
      endm
      macro tobp0
        xor     a
        ld      bc, $1ffd
        out     (c), a
      endm

    output hoh.bin
    org $5b00

; MAGIC_OFFSET is the offset by which the data in the higher area of
; memory is moved down by. Before this area is the 128K-specific sound code,
; which is copied into a different bank if it's needed, before the
; higher data is moved down, leaving space at the top for extra
; temporary data to be written.
MAGIC_OFFSET   EQU 360

;  incbin "../bin/screen.scr"
  include "room_data.asm"
  include "mainloop.asm"
  include "interrupts.asm"
  include "draw_blacked.asm"
  include "attr_scheme.asm"
  include "char_code.asm"
  include "controls.asm"
  include "columns.asm"
  include "room.asm"
  include "stuff.asm"
  include "menus.asm"
  include "occlude.asm"
  include "objects.asm"
  include "walls.asm"
  include "specials.asm"
  include "scoring.asm"
  include "directions.asm"
  include "helpers.asm"
  include "lists.asm"
  include "sprite_stuff.asm"
  include "obj_fns.asm"
  include "screen_vars.asm"
  include "blit_screen.asm"
  include "screen_bits.asm"
  include "controls2.asm"
  include "sound48k.asm"
  include "blit_mask.asm"
  include "background.asm"
  include "blit_rot.asm"
  include "scene.asm"
  include "room_utils.asm"
  include "fill_zero.asm"
  include "state.asm"
  include "wiggle.asm"
  include "character.asm"
  include "contact.asm"
  include "get_sprite.asm"
  include "procobj.asm"
  include "depthcmp.asm"
  include "movement.asm"
  include "print_char.asm"
  include "patch.asm"
  include "sound128k.asm"
  include "data_space.asm"
  include "data_trailer.asm"
