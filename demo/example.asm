        output  example.bin
        define  zxuno_port      $fc3b
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
        ld      a, $50
        ld      bc, zxuno_port
        out     (c), a
        inc     b
        ld      a, $80
        out     (c), a
        tobp2
        tobp0
        ld      hl, buffer
        ld      de, $4000
        ld      bc, $1800
        ldir
        tobp1
        ld      de, $4000
        ld      bc, $1800
        ldir
        tobp3
        ld      de, $4000
        ld      bc, $1800
        ldir
        tobp2
        ld      de, $4000
        ld      bc, $1800
        ldir
        tobp1
        tobp3
        ei
        ld      b, c
delay   halt
        djnz    delay
        di
        ld      a, $50
        ld      bc, zxuno_port
        out     (c), a
        inc     b
        xor     a
        out     (c), a
        halt

buffer: incbin  salida.bp0
        incbin  salida.bp1
        incbin  salida.bp3
        incbin  salida.bp2
