      macro modep
        push    bc
        ex      af, af'
        ld      a, $50
        ld      bc, $fc3b
        out     (c), a
        inc     b
        ex      af, af'
        out     (c), a
        pop     bc
        ret
      endm

      macro tobp1
        ld      a, $10
        ld      bc, $7ffd
      endm
      macro tobp3
        ld      a, $04
        ld      bc, $1ffd
      endm
      macro tobp2
        ld      a, $00
        ld      bc, $7ffd
      endm
      macro tobp0
        ld      a, $00
        ld      bc, $1ffd
      endm
; 00->01->11->10->00
        output  roms.bin
        org     $3000

aqui0   out     (c), a
        call    $7395 ; DrawBlacked
        tobp1
        jr      aqui0


        block   $3ff1-$
        modep
        org     $3000
        
aqui1   out     (c), a
        call    $7395 ; DrawBlacked
        tobp3
        block   6
        out     (c), a

        block   $3ff1-$
        modep
        org     $3000
      
aqui2   out     (c), a
        call    $7395 ; DrawBlacked
        tobp0
        jr      aqui2

        out     (c), a
        block   $3ff1-$
        modep
        org     $3000

drawb:  out     (c), a
        di
        call    $7395 ; DrawBlacked
        ld      a, %11000000
        call    $3ff1
        tobp2
        jr      drawb
        ld      a, %10000000
        call    $3ff1
        ei
        ret

setmo   call    $8dc2
        ld      a, %10000000
        call    $3ff1
        ret


        block   $3ff1-$
        modep
