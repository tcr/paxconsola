unsigned char ptr = 0x7e;
unsigned char gfx = 0x40;

int main()
{
    if (ptr == 0x1)
    {
        gfx = 1;
    }
    ptr = 0;
    return 0;
}
