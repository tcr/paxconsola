; TODO https://github.com/gbdk-2020/gbdk-2020/blob/develop/gbdk-lib/libc/targets/gbz80/set_xy_t.s

PAXEXT_write2Dchar2Dat:
    ; TODO
    SWAP    E
    RLC     E
    LD      A,E
    AND     $03
    ADD     H
    LD      B,A
    LD      A, $E0
    AND     E
    ADD     D
    LD      C,A             ; dest BC = HL + 0x20 * Y + X
    ret
