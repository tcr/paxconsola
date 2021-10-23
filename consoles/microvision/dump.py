infile = sys.argv[1]

in_file = open(infile, "rb")
data = in_file.read()
in_file.close()

i = 0
for b in data:
    asm = "0x%x" % b
    if b == 0x00:
        asm = "mnea"
    if b == 0x01:
        asm = "alem"
    if b == 0x02:
        asm = "ynea"
    if b == 0x03:
        asm = "xma"
    if b == 0x04:
        asm = "dyn"
    if b == 0x05:
        asm = "iyc"
    if b == 0x06:
        asm = "amaac"
    if b == 0x07:
        asm = "dman"
    if b == 0x08:
        asm = "tka"
    if b == 0x09:
        asm = "comx"
    if b == 0x0A:
        asm = "tdo"
    if b == 0x0B:
        asm = "comc"
    if b == 0x0C:
        asm = "rstr"
    if b == 0x0D:
        asm = "setr"
    if b == 0x0E:
        asm = "knez"
    if b == 0x0F:
        asm = "retn"
    if b == 0x10:
        asm = "ldp 0"
    if b == 0x11:
        asm = "ldp 8"
    if b == 0x12:
        asm = "ldp 4"
    if b == 0x13:
        asm = "ldp c"
    if b == 0x14:
        asm = "ldp 2"
    if b == 0x15:
        asm = "ldp a"
    if b == 0x16:
        asm = "ldp 6"
    if b == 0x17:
        asm = "ldp e"
    if b == 0x18:
        asm = "ldp 1"
    if b == 0x19:
        asm = "ldp 9"
    if b == 0x1A:
        asm = "ldp 5"
    if b == 0x1B:
        asm = "ldp d"
    if b == 0x1C:
        asm = "ldp 3"
    if b == 0x1D:
        asm = "ldp b"
    if b == 0x1E:
        asm = "ldp 7"
    if b == 0x1F:
        asm = "ldp f"
    if b == 0x20:
        asm = "tay"
    if b == 0x21:
        asm = "tma"
    if b == 0x22:
        asm = "tmy"
    if b == 0x23:
        asm = "tya"
    if b == 0x24:
        asm = "tamdyn"
    if b == 0x25:
        asm = "tamiyc"
    if b == 0x26:
        asm = "tamza"
    if b == 0x27:
        asm = "tam"
    if b == 0x28:
        asm = "ldx 0"
    if b == 0x29:
        asm = "ldx 4"
    if b == 0x2A:
        asm = "ldx 2"
    if b == 0x2B:
        asm = "ldx 6"
    if b == 0x2C:
        asm = "ldx 1"
    if b == 0x2D:
        asm = "ldx 5"
    if b == 0x2E:
        asm = "ldx 3"
    if b == 0x2F:
        asm = "ldx 7"
    if b == 0x30:
        asm = "sbit 0"
    if b == 0x31:
        asm = "sbit 2"
    if b == 0x32:
        asm = "sbit 1"
    if b == 0x33:
        asm = "sbit 3"
    if b == 0x34:
        asm = "rbit 0"
    if b == 0x35:
        asm = "rbit 2"
    if b == 0x36:
        asm = "rbit 1"
    if b == 0x37:
        asm = "rbit 3"
    if b == 0x38:
        asm = "tbit1 0"
    if b == 0x39:
        asm = "tbit1 2"
    if b == 0x3A:
        asm = "tbit1 1"
    if b == 0x3B:
        asm = "tbit1 3"
    if b == 0x3C:
        asm = "saman"
    if b == 0x3D:
        asm = "cpaiz"
    if b == 0x3E:
        asm = "imac"
    if b == 0x3F:
        asm = "mnez"
    if b == 0x40:
        asm = "tcy 0"
    if b == 0x41:
        asm = "tcy 8"
    if b == 0x42:
        asm = "tcy 4"
    if b == 0x43:
        asm = "tcy c"
    if b == 0x44:
        asm = "tcy 2"
    if b == 0x45:
        asm = "tcy a"
    if b == 0x46:
        asm = "tcy 6"
    if b == 0x47:
        asm = "tcy e"
    if b == 0x48:
        asm = "tcy 1"
    if b == 0x49:
        asm = "tcy 9"
    if b == 0x4A:
        asm = "tcy 5"
    if b == 0x4B:
        asm = "tcy d"
    if b == 0x4C:
        asm = "tcy 3"
    if b == 0x4D:
        asm = "tcy b"
    if b == 0x4E:
        asm = "tcy 7"
    if b == 0x4F:
        asm = "tcy f"
    if b == 0x50:
        asm = "ynec 0"
    if b == 0x51:
        asm = "ynec 8"
    if b == 0x52:
        asm = "ynec 4"
    if b == 0x53:
        asm = "ynec c"
    if b == 0x54:
        asm = "ynec 2"
    if b == 0x55:
        asm = "ynec a"
    if b == 0x56:
        asm = "ynec 6"
    if b == 0x57:
        asm = "ynec e"
    if b == 0x58:
        asm = "ynec 1"
    if b == 0x59:
        asm = "ynec 9"
    if b == 0x5A:
        asm = "ynec 5"
    if b == 0x5B:
        asm = "ynec d"
    if b == 0x5C:
        asm = "ynec 3"
    if b == 0x5D:
        asm = "ynec b"
    if b == 0x5E:
        asm = "ynec 7"
    if b == 0x5F:
        asm = "ynec f"
    if b == 0x60:
        asm = "tcmiy 0"
    if b == 0x61:
        asm = "tcmiy 8"
    if b == 0x62:
        asm = "tcmiy 4"
    if b == 0x63:
        asm = "tcmiy c"
    if b == 0x64:
        asm = "tcmiy 2"
    if b == 0x65:
        asm = "tcmiy a"
    if b == 0x66:
        asm = "tcmiy 6"
    if b == 0x67:
        asm = "tcmiy e"
    if b == 0x68:
        asm = "tcmiy 1"
    if b == 0x69:
        asm = "tcmiy 9"
    if b == 0x6A:
        asm = "tcmiy 5"
    if b == 0x6B:
        asm = "tcmiy d"
    if b == 0x6C:
        asm = "tcmiy 3"
    if b == 0x6D:
        asm = "tcmiy b"
    if b == 0x6E:
        asm = "tcmiy 7"
    if b == 0x6F:
        asm = "tcmiy f"
    if b == 0x70:
        asm = "iac"
    if b == 0x71:
        asm = "a9aac"
    if b == 0x72:
        asm = "a5aac"
    if b == 0x73:
        asm = "a13aac"
    if b == 0x74:
        asm = "a3aac"
    if b == 0x75:
        asm = "a11aac"
    if b == 0x76:
        asm = "a7aac"
    if b == 0x77:
        asm = "dan"
    if b == 0x78:
        asm = "a2aac"
    if b == 0x79:
        asm = "a10aac"
    if b == 0x7A:
        asm = "a6aac"
    if b == 0x7B:
        asm = "a14aac"
    if b == 0x7C:
        asm = "a4aac"
    if b == 0x7D:
        asm = "a12aac"
    if b == 0x7E:
        asm = "a8aac"
    if b == 0x7F:
        asm = "cla"
    if b == 0x80:
        asm = "br 0"
    if b == 0x81:
        asm = "br 1"
    if b == 0x82:
        asm = "br 2"
    if b == 0x83:
        asm = "br 3"
    if b == 0x84:
        asm = "br 4"
    if b == 0x85:
        asm = "br 5"
    if b == 0x86:
        asm = "br 6"
    if b == 0x87:
        asm = "br 7"
    if b == 0x88:
        asm = "br 8"
    if b == 0x89:
        asm = "br 9"
    if b == 0x8A:
        asm = "br a"
    if b == 0x8B:
        asm = "br b"
    if b == 0x8C:
        asm = "br c"
    if b == 0x8D:
        asm = "br d"
    if b == 0x8E:
        asm = "br e"
    if b == 0x8F:
        asm = "br f"
    if b == 0x90:
        asm = "br 10"
    if b == 0x91:
        asm = "br 11"
    if b == 0x92:
        asm = "br 12"
    if b == 0x93:
        asm = "br 13"
    if b == 0x94:
        asm = "br 14"
    if b == 0x95:
        asm = "br 15"
    if b == 0x96:
        asm = "br 16"
    if b == 0x97:
        asm = "br 17"
    if b == 0x98:
        asm = "br 18"
    if b == 0x99:
        asm = "br 19"
    if b == 0x9A:
        asm = "br 1a"
    if b == 0x9B:
        asm = "br 1b"
    if b == 0x9C:
        asm = "br 1c"
    if b == 0x9D:
        asm = "br 1d"
    if b == 0x9E:
        asm = "br 1e"
    if b == 0x9F:
        asm = "br 1f"
    if b == 0xA0:
        asm = "br 20"
    if b == 0xA1:
        asm = "br 21"
    if b == 0xA2:
        asm = "br 22"
    if b == 0xA3:
        asm = "br 23"
    if b == 0xA4:
        asm = "br 24"
    if b == 0xA5:
        asm = "br 25"
    if b == 0xA6:
        asm = "br 26"
    if b == 0xA7:
        asm = "br 27"
    if b == 0xA8:
        asm = "br 28"
    if b == 0xA9:
        asm = "br 29"
    if b == 0xAA:
        asm = "br 2a"
    if b == 0xAB:
        asm = "br 2b"
    if b == 0xAC:
        asm = "br 2c"
    if b == 0xAD:
        asm = "br 2d"
    if b == 0xAE:
        asm = "br 2e"
    if b == 0xAF:
        asm = "br 2f"
    if b == 0xB0:
        asm = "br 30"
    if b == 0xB1:
        asm = "br 31"
    if b == 0xB2:
        asm = "br 32"
    if b == 0xB3:
        asm = "br 33"
    if b == 0xB4:
        asm = "br 34"
    if b == 0xB5:
        asm = "br 35"
    if b == 0xB6:
        asm = "br 36"
    if b == 0xB7:
        asm = "br 37"
    if b == 0xB8:
        asm = "br 38"
    if b == 0xB9:
        asm = "br 39"
    if b == 0xBA:
        asm = "br 3a"
    if b == 0xBB:
        asm = "br 3b"
    if b == 0xBC:
        asm = "br 3c"
    if b == 0xBD:
        asm = "br 3d"
    if b == 0xBE:
        asm = "br 3e"
    if b == 0xBF:
        asm = "br 3f"
    if b == 0xC0:
        asm = "call 0"
    if b == 0xC1:
        asm = "call 1"
    if b == 0xC2:
        asm = "call 2"
    if b == 0xC3:
        asm = "call 3"
    if b == 0xC4:
        asm = "call 4"
    if b == 0xC5:
        asm = "call 5"
    if b == 0xC6:
        asm = "call 6"
    if b == 0xC7:
        asm = "call 7"
    if b == 0xC8:
        asm = "call 8"
    if b == 0xC9:
        asm = "call 9"
    if b == 0xCA:
        asm = "call a"
    if b == 0xCB:
        asm = "call b"
    if b == 0xCC:
        asm = "call c"
    if b == 0xCD:
        asm = "call d"
    if b == 0xCE:
        asm = "call e"
    if b == 0xCF:
        asm = "call f"
    if b == 0xD0:
        asm = "call 10"
    if b == 0xD1:
        asm = "call 11"
    if b == 0xD2:
        asm = "call 12"
    if b == 0xD3:
        asm = "call 13"
    if b == 0xD4:
        asm = "call 14"
    if b == 0xD5:
        asm = "call 15"
    if b == 0xD6:
        asm = "call 16"
    if b == 0xD7:
        asm = "call 17"
    if b == 0xD8:
        asm = "call 18"
    if b == 0xD9:
        asm = "call 19"
    if b == 0xDA:
        asm = "call 1a"
    if b == 0xDB:
        asm = "call 1b"
    if b == 0xDC:
        asm = "call 1c"
    if b == 0xDD:
        asm = "call 1d"
    if b == 0xDE:
        asm = "call 1e"
    if b == 0xDF:
        asm = "call 1f"
    if b == 0xE0:
        asm = "call 20"
    if b == 0xE1:
        asm = "call 21"
    if b == 0xE2:
        asm = "call 22"
    if b == 0xE3:
        asm = "call 23"
    if b == 0xE4:
        asm = "call 24"
    if b == 0xE5:
        asm = "call 25"
    if b == 0xE6:
        asm = "call 26"
    if b == 0xE7:
        asm = "call 27"
    if b == 0xE8:
        asm = "call 28"
    if b == 0xE9:
        asm = "call 29"
    if b == 0xEA:
        asm = "call 2a"
    if b == 0xEB:
        asm = "call 2b"
    if b == 0xEC:
        asm = "call 2c"
    if b == 0xED:
        asm = "call 2d"
    if b == 0xEE:
        asm = "call 2e"
    if b == 0xEF:
        asm = "call 2f"
    if b == 0xF0:
        asm = "call 30"
    if b == 0xF1:
        asm = "call 31"
    if b == 0xF2:
        asm = "call 32"
    if b == 0xF3:
        asm = "call 33"
    if b == 0xF4:
        asm = "call 34"
    if b == 0xF5:
        asm = "call 35"
    if b == 0xF6:
        asm = "call 36"
    if b == 0xF7:
        asm = "call 37"
    if b == 0xF8:
        asm = "call 38"
    if b == 0xF9:
        asm = "call 39"
    if b == 0xFA:
        asm = "call 3a"
    if b == 0xFB:
        asm = "call 3b"
    if b == 0xFC:
        asm = "call 3c"
    if b == 0xFD:
        asm = "call 3d"
    if b == 0xFE:
        asm = "call 3e"
    if b == 0xFF:
        asm = "call 3f"

    print("%3x: %s" % (i, asm))
    i += 1
