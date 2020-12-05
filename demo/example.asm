        output  example.bin
        define  zxuno_port      $fc3b
      macro modePrism value
        ld      a, $50
        ld      bc, zxuno_port
        out     (c), a
        inc     b
        ld      a, value*$c0
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
caca    modePrism 1
        tobp2
        tobp0   ; ROM0
        ld      hl, $4000
        ld      de, $4001
        ld      bc, $17ff
        ldir
        tobp1   ; ROM1
        ld      hl, $4000
        ld      de, $4001
        ld      bc, $17ff
        ldir
        tobp3   ; ROM3
        ld      hl, $4000
        ld      de, $4001
        ld      bc, $17ff
        ldir
        tobp2   ; ROM2
        ld      hl, $4000
        ld      de, $4001
        ld      bc, $17ff
        ldir
        tobp1   ; ROM3
        
        call    kwait

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
        call    kwait
        modePrism 0
        call    kwait
        jp      caca

kwait   xor     a
        in      a, ($fe)
        or     %11100000
        inc     a
        jr      nz, kwait
waitk   in      a, ($fe)
        or     %11100000
        inc     a
        jr      z, waitk
        ret

buffer: incbin  salida.bp0
        incbin  salida.bp1
        incbin  salida.bp3
        incbin  salida.bp2
