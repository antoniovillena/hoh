        output  loader.bin
        org     $5ccb
        ld      de, $faac+final-aqui-1
        di
        defb    $de, $c0, $37, $0e, $8f, $39, $96 ; Basic de Paolo Ferraris
        ld      hl, final-1
        ld      bc, final-aqui
        lddr
        ex      de, hl
        jp      (hl)
aqui    ld      de, $9fac
        ld      hl, $5b00
        call    $07f4
        jp      $7030
final