        output  example.bin
        define  zxuno_port      $fc3b
      macro modePrism value
        ld      a, $50
        ld      bc, zxuno_port
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
        org     $8000

        di
        modePrism 1
        tobp2
        tobp0   ; ROM0
        ld      hl, buffer
        ld      de, $4000
        ld      bc, $1800
        ldir
        tobp1   ; ROM1
        ld      de, $4000
        ld      bc, $1800
        ldir
        tobp3   ; ROM3
        ld      de, $4000
        ld      bc, $1800
        ldir
        tobp2   ; ROM2
        ld      de, $4000
        ld      bc, $1800
        ldir
        tobp1   ; ROM3
        ei
        ld      b, c
delay   halt
        djnz    delay
        di
        modePrism 0
        halt

buffer: incbin  salida.bp0
        incbin  salida.bp1
        incbin  salida.bp3
        incbin  salida.bp2
