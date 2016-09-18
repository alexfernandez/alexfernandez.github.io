#!/bin/bash
# Alex 2015-10-04: generate all files, add, commit and push

date=$(date +"%Y-%m-%dT%H:%M:%SZ")

# English
pandoc --template read-only.html -s index.md -o index.html
sed -i -e 's/"\.\.\//"/g' index.html
pandoc --template read-only.html -s 2012/developer-discipline.md -o 2012/developer-discipline.html
pandoc --template read-only.html -s 2012/continuous-deployment.md -o 2012/continuous-deployment.html
pandoc --template read-only.html -s 2012/locked-to-the-cloud.md -o 2012/locked-to-the-cloud.html
pandoc --template read-only.html -s 2012/reversible-engineering-part-1.md -o 2012/reversible-engineering-part-1.html
pandoc --template read-only.html -s 2012/reversible-engineering-part-2.md -o 2012/reversible-engineering-part-2.html
pandoc --template read-only.html -s 2012/reversible-engineering-part-3.md -o 2012/reversible-engineering-part-3.html
pandoc --template read-only.html -s 2012/from-ground-to-cloud.md -o 2012/from-ground-to-cloud.html
pandoc --template read-only.html -s 2012/ode-to-telecommuting.md -o 2012/ode-to-telecommuting.html
pandoc --template read-only.html -s 2012/closing-the-gap.md -o 2012/closing-the-gap.html
pandoc --template read-only.html -s 2012/performance-review.md -o 2012/performance-review.html
pandoc --template read-only.html -s 2012/sources-of-irreversibility.md -o 2012/sources-of-irreversibility.html
pandoc --template read-only.html -s 2012/iterative-evolution.md -o 2012/iterative-evolution.html
pandoc --template read-only.html -s 2012/reporting-problems-part-1.md -o 2012/reporting-problems-part-1.html
pandoc --template read-only.html -s 2012/reporting-problems-part-2.md -o 2012/reporting-problems-part-2.html
pandoc --template read-only.html -s 2013/human-body-engineered-system.md -o 2013/human-body-engineered-system.html
pandoc --template read-only.html -s 2015/walk-through-my-code.md -o 2015/walk-through-my-code.html
pandoc --template read-only.html -s 2016/against-craftsmanship.md -o 2016/against-craftsmanship.html
pandoc --template read-only.html -s 2016/event-attendance.md -o 2016/event-attendance.html
pandoc --template read-only.html -s 2016/golang-adventures.md -o 2016/golang-adventures.html
pandoc --template read-only.html -s 2016/stridercd.md -o 2016/stridercd.html
pandoc --template read-only.html -s 2016/nginx-balancer.md -o 2016/nginx-balancer.html
pandoc --template read-only.html -s 2016/build-or-not.md -o 2016/build-or-not.html
pandoc --template read-only.html -s 2016/mib-five-years-later.md -o 2016/mib-five-years-later.html --toc -V toctitle:'Contents'
pandoc --template read-only.html -s 2016/becoming-a-better-developer.md -o 2016/becoming-a-better-developer.html
pandoc --template read-only.html -s permanent/cv.md -o permanent/cv.html

# Español
pandoc --template read-only.html -s 2013/optimizando-sockets.md -o 2013/optimizando-sockets.html
pandoc --template read-only.html -s 2013/pruebas-de-carga.md -o 2013/pruebas-de-carga.html
pandoc --template read-only.html -s 2013/nodejs-rapido-como-el-rayo.md -o 2013/nodejs-rapido-como-el-rayo.html
pandoc --template read-only.html -s 2013/modo-cluster.md -o 2013/modo-cluster.html
pandoc --template read-only.html -s 2013/pruebas-asincronas.md -o 2013/pruebas-asincronas.html
pandoc --template read-only.html -s 2015/ofertas-salarios.md -o 2015/ofertas-salarios.html
pandoc --template read-only.html -s 2015/entrevista-devuse.md -o 2015/entrevista-devuse.html
pandoc --template read-only.html -s 2015/arquitectura-fluida-1-arquitectura-perfecta.md -o 2015/arquitectura-fluida-1-arquitectura-perfecta.html
pandoc --template read-only.html -s 2015/arquitectura-fluida-2-estrategias-migracion.md -o 2015/arquitectura-fluida-2-estrategias-migracion.html
pandoc --template read-only.html -s 2016/cuanto-costo-jsdayes-2016.md -o 2016/cuanto-costo-jsdayes-2016.html
pandoc --template read-only.html -s 2016/sobre-intrusismo-profesional.md -o 2016/sobre-intrusismo-profesional.html

git add -A
git commit -am "Make on $date"
git push

