# =============================================================
# Dockerfile pro GitHub Codespaces — šablona maturitní práce
#
# Základ: mcr.microsoft.com/devcontainers/base:ubuntu-24.04
#   → oficiální Microsoft obraz testovaný pro Codespaces
#   → uživatel 'vscode' je v něm již připraven
#
# Instalujeme: texlive-full (plný TeX Live) + latexmk + make + zip
# Obraz se sestaví při prvním spuštění Codespace (~15 min),
# GitHub ho pak cachuje — každé další spuštění je okamžité.
# =============================================================

FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
        texlive-full   \
        latexmk        \
        make           \
        zip            \
    && apt-get clean   \
    && rm -rf /var/lib/apt/lists/*
