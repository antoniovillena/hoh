        output  example.bin
        define  zxuno_port      $fc3b
      macro tobp1
        ld      a, $10
        ld      bc, $7ffd
        out     (c), a
      endm
      macro tobp3
        ld      a, $04
        ld      b, $1f
        out     (c), a
      endm
      macro tobp2
        xor     a
        ld      b, $7f
        out     (c), a
      endm
      macro tobp0
        ld      b, $1f
        out     (c), a
      endm
        org     $8000

        ld      a, $50
        ld      bc, zxuno_port
        out     (c), a
        inc     b
        ld      a, $80
        out     (c), a
        
        ld      hl, buffer
        ld      de, $4000
        ld      bc, $1800
        ldir
        ld      b, 10
delay1  halt
        djnz    delay1
        tobp1
        ld      de, $4000
        ld      bc, $1800
        ldir
        ld      b, 10
delay2  halt
        djnz    delay2
        tobp3
        ld      de, $4000
        ld      bc, $1800
        ldir
        ld      b, 10
delay3  halt
        djnz    delay3
        tobp2
        ld      de, $4000
        ld      bc, $1800
        ldir
        ld      b, 10
        tobp0
        di
        halt

buffer: incbin  salida.bp0
        incbin  salida.bp1
        incbin  salida.bp3
        incbin  salida.bp2

