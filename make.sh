#!/bin/bash
# Alex 2015-10-04: generate all files, add, commit and push

date=$(date -Iseconds -u)

# English
pandoc -w html5 -s md/index.md -o index.html
pandoc -w html5 -s md/from-ground-to-cloud.md -o 2012/from-ground-to-cloud.html
pandoc -w html5 -s md/developer-discipline.md -o 2012/developer-discipline.html

# Español
pandoc -w html5 -s md/optimizando-sockets.md -o 2013/optimizando-sockets.html
pandoc -w html5 -s md/nodejs-rapido-como-el-rayo.md -o 2013/nodejs-rapido-como-el-rayo.html

git add -A
git commit -am "Make on $date"
git push

