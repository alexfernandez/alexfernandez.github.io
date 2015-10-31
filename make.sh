#!/bin/bash
# Alex 2015-10-04: generate all files, add, commit and push

date=$(date +"%Y-%m-%dT%H:%M:%SZ")

# English
pandoc --template read-only.html -s md/index.md -o index.html
sed -i -e 's/"\.\.\//"/g' index.html
pandoc --template read-only.html -s md/developer-discipline.md -o 2012/developer-discipline.html
pandoc --template read-only.html -s md/continuous-deployment.md -o 2012/continuous-deployment.html
pandoc --template read-only.html -s md/locked-to-the-cloud.md -o 2012/locked-to-the-cloud.html
pandoc --template read-only.html -s md/reversible-engineering-part-1.md -o 2012/reversible-engineering-part-1.html
pandoc --template read-only.html -s md/reversible-engineering-part-2.md -o 2012/reversible-engineering-part-2.html
pandoc --template read-only.html -s md/reversible-engineering-part-3.md -o 2012/reversible-engineering-part-3.html
pandoc --template read-only.html -s md/from-ground-to-cloud.md -o 2012/from-ground-to-cloud.html
pandoc --template read-only.html -s md/ode-to-telecommuting.md -o 2012/ode-to-telecommuting.html
pandoc --template read-only.html -s md/closing-the-gap.md -o 2012/closing-the-gap.html
pandoc --template read-only.html -s md/performance-review.md -o 2012/performance-review.html
pandoc --template read-only.html -s md/sources-of-irreversibility.md -o 2012/sources-of-irreversibility.html
pandoc --template read-only.html -s md/iterative-evolution.md -o 2012/iterative-evolution.html
pandoc --template read-only.html -s md/reporting-problems-part-1.md -o 2012/reporting-problems-part-1.html
pandoc --template read-only.html -s md/reporting-problems-part-2.md -o 2012/reporting-problems-part-2.html
pandoc --template read-only.html -s md/human-body-engineered-system.md -o 2013/human-body-engineered-system.html
pandoc --template read-only.html -s md/walk-through-my-code.md -o 2015/walk-through-my-code.html
pandoc --template read-only.html -s md/the-intelligent-designer.md -o 2015/the-intelligent-designer.html

# Español
pandoc --template read-only.html -s md/optimizando-sockets.md -o 2013/optimizando-sockets.html
pandoc --template read-only.html -s md/pruebas-de-carga.md -o 2013/pruebas-de-carga.html
pandoc --template read-only.html -s md/nodejs-rapido-como-el-rayo.md -o 2013/nodejs-rapido-como-el-rayo.html
pandoc --template read-only.html -s md/modo-cluster.md -o 2013/modo-cluster.html
pandoc --template read-only.html -s md/pruebas-asincronas.md -o 2013/pruebas-asincronas.html

git add -A
git commit -am "Make on $date"
git push

