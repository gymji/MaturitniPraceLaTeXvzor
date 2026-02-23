#!/usr/bin/env python3
"""
Generátor Mandelbrotovy množiny pro šablonu maturitní práce.
Výstup: images/mandelbrot.png

Spuštění:
    pip install numpy matplotlib
    python generate_mandelbrot.py
"""

import numpy as np
import matplotlib.pyplot as plt


def mandelbrot_array(width=1200, height=800,
                     x_min=-2.5, x_max=1.0,
                     y_min=-1.2,  y_max=1.2,
                     max_iter=256):
    """Vygeneruje pole hodnot Mandelbrotovy množiny (vektorizovaně).

    Používá smooth coloring: místo celého čísla iterace vrací
    plynulou hodnotu, která umožní hladké barevné přechody.
    """
    x = np.linspace(x_min, x_max, width)
    y = np.linspace(y_min, y_max, height)
    C = x[np.newaxis, :] + 1j * y[:, np.newaxis]
    Z = np.zeros_like(C)
    escape = np.full(C.shape, float(max_iter))

    for i in range(max_iter):
        mask = np.abs(Z) <= 2
        Z[mask] = Z[mask] ** 2 + C[mask]
        # body, která právě "utekla" v této iteraci
        newly = mask & (np.abs(Z) > 2)
        if np.any(newly):
            abs_z = np.abs(Z[newly])
            # smooth escape time formula
            escape[newly] = i + 1 - np.log2(np.log2(abs_z))

    return escape


print("Generuji Mandelbrotovu množinu (může trvat několik sekund)...")
data = mandelbrot_array()

fig, ax = plt.subplots(figsize=(10, 6.67), dpi=150)
img = ax.imshow(
    data,
    extent=[-2.5, 1.0, -1.2, 1.2],
    cmap="inferno",
    origin="lower",
    interpolation="bilinear",
)
ax.axis("off")
plt.tight_layout(pad=0)
plt.savefig("images/mandelbrot.png", dpi=150, bbox_inches="tight", pad_inches=0)
plt.close()
print("Hotovo: images/mandelbrot.png")
