#!/bin/bash
# Alex 2015-10-04: generate all files, add, commit and push

date=$(date +"%Y-%m-%dT%H:%M:%SZ")

# English
pandoc -w html5 -s md/index.md -o index.html
pandoc -w html5 -s md/developer-discipline.md -o 2012/developer-discipline.html
pandoc -w html5 -s md/continuous-deployment.md -o 2012/continuous-deployment.html
pandoc -w html5 -s md/automating-the-automation.md -o 2012/automating-the-automation.html
pandoc -w html5 -s md/from-ground-to-cloud.md -o 2012/from-ground-to-cloud.html
pandoc -w html5 -s md/walk-through-my-code.md -o 2015/walk-through-my-code.html

# Español
pandoc -w html5 -s md/pruebas-asincronas.md -o 2013/pruebas-asincronas.html
pandoc -w html5 -s md/modo-cluster.md -o 2013/modo-cluster.html
pandoc -w html5 -s md/pruebas-de-carga.md -o 2013/pruebas-de-carga.html
pandoc -w html5 -s md/nodejs-rapido-como-el-rayo.md -o 2013/nodejs-rapido-como-el-rayo.html
pandoc -w html5 -s md/optimizando-sockets.md -o 2013/optimizando-sockets.html

git add -A
git commit -am "Make on $date"
git push

