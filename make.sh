#!/bin/bash
# Alex 2015-10-04: generate all files, add, commit and push

date=$(date +"%Y-%m-%dT%H:%M:%SZ")

# Generate all
pandoc --template read-only.html --variable canonical= -s "index.md" -o "index.html"
./generate.sh 2021/understanding-einstein
./generate.sh 2021/bacterias-tecnologia
./generate.sh 2021/bacterias-simbiosis
./generate.sh 2021/bacterias-autoinmunes
./generate.sh 2021/bacterias-estrellas
./generate.sh 2021/bacterias-conclusiones
./generate.sh 2021/bacterias-bonita
./generate.sh 2021/bacterias-maquinas
./generate.sh 2021/understanding-quantum-mechanics
./generate.sh 2021/api-first
./generate.sh 2021/remote-memory
./generate.sh 2021/understanding-simulation
./generate.sh 2021/understanding-entropy
./generate.sh 2021/ttp
./generate.sh 2021/repaso-propositos-2020
./generate.sh 2020/cinco-cos
./generate.sh 2020/tpp
./generate.sh 2020/curso-escalabilidad-2
./generate.sh 2020/curso-escalabilidad
./generate.sh 2020/insane-plane-prices
./generate.sh 2020/repaso-propositos
./generate.sh 2019/high-speeds
./generate.sh 2019/devops-on-the-cheap
./generate.sh 2019/curso-unix
./generate.sh 2018/more-golang-adventures
./generate.sh 2018/has-anyone-else-seen-your-code
./generate.sh 2018/building-space-launcher.md "-f markdown-tex_math_dollars"
./generate.sh 2017/diversidad-tecnologia
./generate.sh 2017/jsdayes-2017-cost
./generate.sh 2017/build-your-own-devops-infrastructure
./generate.sh 2017/origins-language
./generate.sh 2016/cuanto-costo-jsdayes-2016
./generate.sh 2016/sobre-intrusismo-profesional
./generate.sh 2016/against-craftsmanship
./generate.sh 2016/event-attendance
./generate.sh 2016/golang-adventures
./generate.sh 2016/stridercd
./generate.sh 2016/nginx-balancer
./generate.sh 2016/build-or-not
./generate.sh 2016/mib-five-years-later
./generate.sh 2016/becoming-a-better-developer
./generate.sh 2016/start-me-up
./generate.sh 2016/advice-for-the-novice
./generate.sh 2016/get-ahead-of-the-curve
./generate.sh 2016/top-of-the-cream-of-the-crop
./generate.sh 2016/the-amazing-mind
./generate.sh 2015/ofertas-salarios
./generate.sh 2015/entrevista-devuse
./generate.sh 2015/arquitectura-fluida-1-arquitectura-perfecta
./generate.sh 2015/arquitectura-fluida-2-estrategias-migracion
./generate.sh 2015/walk-through-my-code
./generate.sh 2013/human-body-engineered-system
./generate.sh 2013/optimizando-sockets
./generate.sh 2013/pruebas-de-carga
./generate.sh 2013/nodejs-rapido-como-el-rayo
./generate.sh 2013/modo-cluster
./generate.sh 2013/pruebas-asincronas
./generate.sh 2012/developer-discipline
./generate.sh 2012/continuous-deployment
./generate.sh 2012/locked-to-the-cloud
./generate.sh 2012/reversible-engineering-part-1
./generate.sh 2012/reversible-engineering-part-2
./generate.sh 2012/reversible-engineering-part-3
./generate.sh 2012/from-ground-to-cloud
./generate.sh 2012/ode-to-telecommuting
./generate.sh 2012/closing-the-gap
./generate.sh 2012/performance-review
./generate.sh 2012/sources-of-irreversibility
./generate.sh 2012/iterative-evolution
./generate.sh 2012/reporting-problems-part-1
./generate.sh 2012/reporting-problems-part-2
./generate.sh 2012/automating-the-automation

./generate.sh permanent/cv
./generate.sh permanent/speaker
pandoc -V linkcolor:blue -s permanent/standalone-cv.md -o permanent/cv-alex-fernandez.pdf

git add -A
git commit -am "Make on $date"
git push

