#!/bin/bash
# Alex 2020-02-16: generate one file with template

file=$1
canonical="${file%.*}"

pandoc --template read-only.html --variable canonical=$canonical $2 -s "$canonical.md" -o "$canonical.html"

