#!/usr/bin/env python3
"""
Generátor barevné Mandelbrotovy množiny pro šablonu maturitní práce.
Výstup: images/mandelbrot.png (relativně ke kořeni projektu)

Spuštění:
    pip install numpy matplotlib
    python scripts/generate_mandelbrot.py
"""

import os
import numpy as np
import matplotlib.pyplot as plt


def mandelbrot_array(width=1200, height=800,
                     x_min=-2.5, x_max=1.0,
                     y_min=-1.2,  y_max=1.2,
                     max_iter=256):
    """Vygeneruje pole hodnot Mandelbrotovy množiny (vektorizovaně).

    Používá smooth coloring: plynulé hodnoty umožní hladké barevné přechody.
    Body uvnitř množiny (nevytekly) mají hodnotu max_iter.
    """
    x = np.linspace(x_min, x_max, width)
    y = np.linspace(y_min, y_max, height)
    C = x[np.newaxis, :] + 1j * y[:, np.newaxis]
    Z = np.zeros_like(C)
    escape = np.full(C.shape, float(max_iter))

    for i in range(max_iter):
        mask = np.abs(Z) <= 2
        Z[mask] = Z[mask] ** 2 + C[mask]
        newly = mask & (np.abs(Z) > 2)
        if np.any(newly):
            abs_z = np.abs(Z[newly])
            escape[newly] = i + 1 - np.log2(np.log2(np.maximum(abs_z, 1.0001)))

    return escape


print("Generuji barevnou Mandelbrotovu množinu (může trvat několik sekund)...")

max_iter = 256
data = mandelbrot_array(max_iter=max_iter)

# --- Barevné cyklické zobrazení ---
# Escape time se cyklicky mapuje na odstín (hue) pomocí HSV palety.
# Krátký cyklus (period=30) vytvoří husté duhové prstence kolem množiny.
period = 30
normalized = (data % period) / period

rgba = plt.cm.hsv(normalized)

# Vnitřek množiny (body, které nevytekly) → černá
interior = data >= max_iter - 0.5
rgba[interior] = [0.0, 0.0, 0.0, 1.0]

# --- Uložení ---
script_dir = os.path.dirname(os.path.abspath(__file__))
project_root = os.path.dirname(script_dir)
output_path = os.path.join(project_root, "images", "mandelbrot.png")

fig, ax = plt.subplots(figsize=(10, 6.67), dpi=150)
ax.imshow(rgba, extent=[-2.5, 1.0, -1.2, 1.2], origin="lower", interpolation="bilinear")
ax.axis("off")
plt.tight_layout(pad=0)
plt.savefig(output_path, dpi=150, bbox_inches="tight", pad_inches=0)
plt.close()

print(f"Hotovo: {output_path}")
