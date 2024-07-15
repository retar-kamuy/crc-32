import binascii

def main():
    print(hex(binascii.crc32(b"a")))