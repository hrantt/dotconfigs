#!/bin/bash
wmtitle=$(xtitle $1)
[[ $wmtitle = "Emulator" ]] && echo state=pseudo_tiled
