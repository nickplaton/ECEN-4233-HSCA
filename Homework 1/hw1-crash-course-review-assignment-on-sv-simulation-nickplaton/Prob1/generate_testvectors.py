# ChatGPT used for parts of script
import random

def to_hex(value, width):
    """Format value as zero-padded hex without 0x prefix"""
    return f"{value:0{width // 4}x}"  # width is bits → width//4 hex digits


with open('testvectors.tv', 'w') as f:
    for _ in range(50):
        a = random.randint(0,2**64-1)
        b = random.randint(0,2**64-1)
        prod_us = a * b

        # Signed interpretation of inputs
        a_signed = a if a < 2**63 else a - 2**64
        b_signed = b if b < 2**63 else b - 2**64

        # Signed product
        prod_tc = a_signed * b_signed

        # Mask signed product into 128 bits two's complement
        prod_tc &= (1 << 128) - 1

        # Write as fixed-width hex: A (64), B (64), unsigned (128), signed (128)
        line = (
            f"{to_hex(a,64)}_{to_hex(b,64)}_"
            f"{to_hex(prod_us,128)}_{to_hex(prod_tc,128)}\n"
        )
        f.write(line)