# ChatGPT used for parts of script
import random

def to_bin(value, width):
    """Format value as zero-padded binary without 0b prefix"""
    return f"{value:0{width}b}"


with open('testvectors.tv', 'w') as f:
    for _ in range(50):
        a = random.randint(0,2**64-1)
        b = random.randint(0,2**64-1)
        sum_g = a + b

        # Write as fixed-width hex: A (64), B (64), unsigned (128), signed (128)
        line = (
            f"{to_bin(a,64)}_{to_bin(b,64)}_"
            f"{to_bin(sum_g,65)}\n"
        )
        f.write(line)