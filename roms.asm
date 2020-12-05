      macro modePrism value
        push    bc
        push    af
        ld      a, $50
        ld      bc, $fc3b
        out     (c), a
        inc     b
        ld      a, value<<7
        out     (c), a
        pop     af
        pop     bc
      endm
        output  roms.bin
        org     $3000
        CALL    $8dc2 ;CrownScreen
        ret

        block   $4000-$
        org     $3000
        CALL    $8dc2 ;CrownScreen
        ret

        block   $4000-$
        org     $3000
        CALL    $8dc2 ;CrownScreen
        ret

        block   $4000-$
        org     $3000
        CALL    $8dc2 ;CrownScreen
        modePrism 1
        ret

        block   $4000-$
        