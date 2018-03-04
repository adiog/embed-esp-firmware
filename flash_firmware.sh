#!/bin/bash

cd $(dirname $0)

FIRMWARE=${1:-./ai-thinker-0.9.5.2-115200.bin}
DEFAULT_DEVICE=`ls -1 /dev/ttyUSB* | head -1`
DEVICE=${2:-${DEFAULT_DEVICE}}

[[ -d ../esptool ]] || git clone https://github.com/adiog/embed-esp-esptool ../esptool

python ../esptool/esptool.py --port ${DEVICE} write_flash 0x00000 ${FIRMWARE}

