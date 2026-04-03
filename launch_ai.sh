#!/bin/bash

# =====================================================================
# 🔌 Portable AI USB Launcher (Linux/macOS)
# =====================================================================
# This script scans the /models folder and lets you select which LLM 
# to run using llamafile.
# =====================================================================

# Define colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}===========================================${NC}"
echo -e "${BLUE}🖥️  Portable LLM Launcher (Unix)          ${NC}"
echo -e "${BLUE}===========================================${NC}"
echo

MODEL_PATH="./models"
BIN="./llamafile.exe" # llamafile often uses .exe extension even on Linux

# Check if llamafile exists
if [ ! -f "$BIN" ]; then
    echo -e "${RED}[!] Error: $BIN not found in root directory.${NC}"
    echo "Please place llamafile.exe in the same folder as this script."
    exit 1
fi

# Ensure llamafile is executable
chmod +x "$BIN"

# Scan for models
echo -e "${BLUE}Searching for models in $MODEL_PATH...${NC}"
echo

# Store models in an array
models=($MODEL_PATH/*.gguf)

if [ ${#models[@]} -eq 0 ] || [ ! -e "${models[0]}" ]; then
    echo -e "${RED}[!] No .gguf models found in $MODEL_PATH${NC}"
    echo "Place your model files in the 'models' folder and restart."
    exit 1
fi

# List models
count=0
for model in "${models[@]}"; do
    count=$((count + 1))
    echo "  [$count] $(basename "$model")"
done

echo
read -p "👉 Select a model (1-$count) or 'q' to quit: " choice

if [[ "$choice" == "q" ]]; then
    exit 0
fi

if [[ "$choice" -gt 0 ]] && [[ "$choice" -le "$count" ]]; then
    SELECTED_MODEL="${models[$((choice-1))]}"
    echo
    echo -e "${GREEN}[+] Launching $(basename "$SELECTED_MODEL")...${NC}"
    echo -e "\033[0;90m(The web UI will open in your browser automatically)${NC}"
    echo
    
    "$BIN" -m "$SELECTED_MODEL"
else
    echo -e "${RED}[!] Invalid selection.${NC}"
    exit 1
fi
