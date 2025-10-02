with open('lines_1.awesome', 'w') as f:
    for i in range(16):
        f.write(
            f"bclg4 layer1_{i:<2} ("
            f"g[{i*4 + 3}:{i*4}], p[{i*4 + 3}:{i*4}], c[{i*4}], "
            f"g2[{i}], p2[{i}], c[{i*4 + 3}:{i*4 + 1}]);\n"
        )
    f.write("\n")
    for i in range(4):
        f.write(
            f"bclg4 layer2_{i:<2} ("
            f"g2[{i*4 + 3}:{i*4}], p2[{i*4 + 3}:{i*4}], c[{i*16}], "
            f"g3[{i}], p3[{i}], "
            "{"
            f"c[{i*16 + 12}], c[{i*16 + 8}], c[{i*16 + 4}]"
            "});\n"
        )