#!/bin/bash
# Alex 2023-08-13: generate files locally.

pandoc -V urlcolor:Blue -V fontsize:12pt -V geometry:margin=1in -s permanent/custom/cv-recent.md -o permanent/custom/cv-alex-fernandez.pdf

