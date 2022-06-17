import sys

infile = sys.argv[1]
outfile = sys.argv[2]

lfsr = [
    0x00,
    0x01,
    0x03,
    0x07,
    0x0F,
    0x1F,
    0x3F,
    0x3E,
    0x3D,
    0x3B,
    0x37,
    0x2F,
    0x1E,
    0x3C,
    0x39,
    0x33,
    0x27,
    0x0E,
    0x1D,
    0x3A,
    0x35,
    0x2B,
    0x16,
    0x2C,
    0x18,
    0x30,
    0x21,
    0x02,
    0x05,
    0x0B,
    0x17,
    0x2E,
    0x1C,
    0x38,
    0x31,
    0x23,
    0x06,
    0x0D,
    0x1B,
    0x36,
    0x2D,
    0x1A,
    0x34,
    0x29,
    0x12,
    0x24,
    0x08,
    0x11,
    0x22,
    0x04,
    0x09,
    0x13,
    0x26,
    0x0C,
    0x19,
    0x32,
    0x25,
    0x0A,
    0x15,
    0x2A,
    0x14,
    0x28,
    0x10,
    0x20,
]

in_file = open(infile, "rb")  # opening for [r]eading as [b]inary
data = in_file.read()  # if you only wanted to read 512 bytes, do .read(512)
in_file.close()

out_file = open(outfile, "wb")

idx = 0
while idx < len(data):
    lfsr_out = [0 for x in lfsr]
    for pos in lfsr:
        if data[idx] >= 0x80 and data[idx] < 0xC0:
            lfsr_out[pos] = lfsr[data[idx] & 0x3F] + 0x80
        elif data[idx] >= 0xC0:
            lfsr_out[pos] = lfsr[data[idx] & 0x3F] + 0xC0
        else:
            lfsr_out[pos] = data[idx]
        idx += 1
    out_file.write(bytes(lfsr_out))
    # idx += len(lfsr)