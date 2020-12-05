        include define.asm
        output  loader.bin
        org     $5ccb
        ld      de, $ffff
        di
        defb    $de, $c0, $37, $0e, $8f, $39, $96 ; Basic de Paolo Ferraris
        ld      hl, final-1
        ld      bc, final-aqui
        lddr
        jp      aqui-final
        jp      (hl)
aqui    ld      de, length
        ld      hl, $5b00
        call    $07f4
        jp      $7030
final