        define  zxuno_port      $fc3b
        define  master_conf     0
        define  master_mapper   1
      macro wreg  dir, dato
        call    rst28
        defb    dir, dato
      endm
        include define.asm
        output  loader.bin
        org     $5ccb
        ld      de, romlength
        di
        defb    $de, $c0, $37, $0e, $8f, $39, $96 ; Basic de Paolo Ferraris
        ld      hl, $8000
        call    $07f4
        di
        wreg    master_conf, 1
        ld      hl, $8000
        ld      sp, hl
        ld      a, master_mapper
        dec     b
        out     (c), a
        inc     b
        ld      a, 8
conti3  push    bc
        out     (c), a
        ld      bc, $1000
        ld      de, $f000
        ldir
        pop     bc
        inc     a
        cp      12
        jr      nz, conti3
        wreg    master_conf, 0


        ld      de, $ffff
        ld      hl, final-1
        ld      bc, final-aqui
        lddr
        jp      aqui-final
aqui    ld      sp, aqui-final
        call    rst28-final
        defb    $50, $80
        call    rst28-final
        defb    $50, $00
        ld      de, length
        ld      hl, $5b00
        call    $07f4
        jp      $7030
rst28   ld      bc, zxuno_port + $100
        pop     hl
        outi
        ld      b, (zxuno_port >> 8)+2
        outi
        jp      (hl)
final