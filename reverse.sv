// Reverse bits of a 32 bit integer 

a=0x1a2b3c4d

a= (a & 0xffff0000)>>16 | (a & 0x0000ffff)<<16 // Reverse by word
a= (a & 0xff00ff00) >>8 | (a & 0x00ff00ff)<<8 // Byte Reverse 
a =(a&0xf0f0f0f0)>>4|(a&0x0f0f0f0f)<<4 // Nibble reverse 
a= (a & 0xcccccccc) >> 2 | (a & 0x33333333) << 2
a= (a & 0xaaaaaaaa) >> 1 | (a & 0x55555555) << 1
print(hex(a))
