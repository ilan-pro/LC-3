#!/bin/bash
#$1 est l'argument donné en ligne de commande

SRC_DIR="asm"
ASM_TOOLS="tools"

"$ASM_TOOLS"/lc3as-wrapper.sh "$SRC_DIR"/"$1"

mv "$SRC_DIR"/*.mem mem

mv "$SRC_DIR"/*.obj obj

mv "$SRC_DIR"/*.sym sym
