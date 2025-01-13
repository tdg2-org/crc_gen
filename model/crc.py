import crcmod

# Define CRC-8-CCITT with polynomial 0x07, initial value 0x00, no final XOR, no reflection
crc8_ccitt = crcmod.mkCrcFun(0x107, initCrc=0x00, xorOut=0x00, rev=False)

# Input 0xAB
input_data = bytes([0xAB])

# Calculate CRC
crc_result = crc8_ccitt(input_data)

# Print result in hexadecimal
print(f"CRC-8-CCITT result: 0x{crc_result:02X}")