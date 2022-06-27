---
title: '⚙️ Tecnología bacteriana'
subtitle: 'Parte 2 de la serie «🦠 Bacterias: máquinas que dominan el universo»'
footer: Publicado el 2022-03-06, modificado el 2022-03-06.
  [¿Comentarios, sugerencias?](mailto:alexfernandeznpm@gmail.com)
abstract:
  'La tecnología que despliegan las bacterias es impresionante:
  virus usados como memorias externas, replicación ultrarrápida de código genético
  o refactorización radical de código duplicado.'
image: https://pinchito.es/2022/pics/bacterias-inyector-toxinas.jpg

---

![Esta proteína tan bonita es en realidad una máquina infernal para inyectar toxinas en una célula. Usada por bacterias que producen, entre otras patologías: cánceres gástricos, la tosferina y la enfermedad del legionario. [Fuente](https://phys.org/news/2019-05-dangerous-pathogens-sophisticated-machinery-infect.html).](pics/bacterias-inyector-toxinas.jpg "Una proteína simulada por ordenador en color falso. Similar a una corona o a un rotor, con múltiples segmentos circulares.")

Si eres tecnóloga o tecnólogo,
la fascinación por estas pequeñas amiguitas sólo puede crecer
al estudiar la sofisticada tecnología que son capaces de desplegar.

# La estructura del ADN

Vamos a empezar con una historia fundacional digna de una superheroína como
[Rosalind Franklin](https://en.wikipedia.org/wiki/Rosalind_Franklin).

Corría el año 1953.
Varios laboratorios a ambos lados del Atlántico intentaban craquear el código genético.
El ácido desoxirribonucleico (ADN, o DNA en inglés)
era el mayor sospechoso de albergar la información genética de la célula.
Rosalind Franklin, cristalógrafa del King's College,
intentaba dilucidar [la estructura del ADN](https://profiles.nlm.nih.gov/spotlight/kr/feature/dna)
por difracción de rayos X.

Watson y Crick por su parte estaban sentando las
[bases matemáticas para analizar la molécula](https://www.theguardian.com/science/2015/jun/23/sexism-in-science-did-watson-and-crick-really-steal-rosalind-franklins-data).
Por caminos oscuros obtuvieron el trabajo de Franklin,
el más avanzado de la época,
y lo usaron para descifrar la doble hélice.
Como resultado Watson, Crick y Wilkins,
éste último compañero de Franklin, recibieron
[el premio Nobel de medicina en 1962](https://www.nobelprize.org/prizes/medicine/1962/summary/).
Por su parte, Franklin murió en 1958 de cáncer de ovarios,
posiblemente provocado por
[su trabajo con rayos X](https://blogs.scientificamerican.com/observations/rosalind-franklin-and-dna-how-wronged-was-she/).

![Descubridores de la estructura del ADN: Watson, Crick, Wilkins y Franklin. No por orden de importancia. [Fuente](https://www.researchgate.net/publication/242012620_Ciencia_e_Tecnologia_um_Dialogo_Permanente).](pics/bacterias-watson-crick-wilkins-franklin.jpg "Fotos adjuntas de los cuatro descubridores.")

Esta historia es muy susceptible de interpretarse como la de una mártir feminista heroica,
traicionada por sus colegas sexistas que le robaron el premio Nobel;
de hecho es la idea que yo tenía antes de escribir este artículo.
Pero siempre es interesante seguir cavando un poco más.
Su biógrafa Brenda Maddox
[no está de acuerdo con esta interpretación](https://profiles.nlm.nih.gov/spotlight/kr/feature/biographical),
y cree que debe ponerse más el foco en su brillante carrera científica.
Parece que a ella personalmente sólo le preocupó el avance científico y no el reconocimiento,
y siempre estuvo lejos de ser la figura amargada y hosca que Watson describe en
[_The Double Helix_](https://en.wikipedia.org/wiki/The_Double_Helix).
Pero, ¿acaso no fue una injusticia que no se le reconociera en el premio Nobel?
La realidad es que el premio Nobel sólo se concede a personas vivas
(salvo rarísimas excepciones),
así que no había posibilidad de reconocer el trabajo de Franklin.
Podemos ver el nombramiento de Wilkins como un reconocimiento implícito a una gran científica.

Que cada cual saque sus propias conclusiones;
yo por mi parte tengo claro que Watson y Crick no habrían descubierto nada sin Franklin,
pero Franklin seguramente habría llegado a la doble hélice por sí sola.
En cualquier caso este descubrimiento abrió la puerta a un mundo apasionante
que a día de hoy sigue dándonos sorpresas.

# Material genético

El genoma es el conjunto de material genético (ADN o ARN) de un organismo vivo.
Contiene las instrucciones para fabricar todas sus proteínas,
que a su vez serán las encargadas de realizar todas las funciones de cada célula.
El [proceso de transcripción](https://www.nature.com/scitable/topicpage/dna-transcription-426/)
funciona como un ordenador de 6 bits:
cada "palabra" consiste en tres pares de bases que contienen dos bits cada uno,
y se traduce en un aminoácido distinto siguiendo una
[tabla que varía según el tipo de organismo](https://www.ncbi.nlm.nih.gov/Taxonomy/Utils/wprintgc.cgi).
Este "código ensamblador" traduce los 64 posibles valores a 20 aminoácidos + inicio + fin,
con una sofisticada
[corrección de errores](https://life.ibs.re.kr/papers/PhysLifeRev2010.pdf).

![Tabla de transcripción del código genético. Cada par de bases se muestra en un círculo concéntrico, de dentro a fuera, y el aminoácido resultante en el exterior. [Fuente](https://commons.wikimedia.org/wiki/File:Codons_aminoacids_table.png).](pics/bacterias-transcription-table.png "Cada par de bases puede ser A, G, U o C. El primero se muestra en el centro, el siguiente círculo tiene el segundo par, y el tercer par se muestra en el exterior. Así, la secuencia GGG corresponde al aminoácido Gly o glicina. De hecho, cualquier secuencia GG* se transcribe a glicina.")

Cada proteína es una secuencia fija de aminoácidos que se pliega consiguiendo estructuras complejísimas,
que veremos más abajo.
El problema del
[plegamiento de proteínas en 3D](http://cmb.path.uab.edu/pages/documents/papers/Compiani_Biochemistry2013.pdf)
es computacionalmente muy intensivo:
resulta casi imposible predecir la estructura final sin una simulación detalladísima de las fuerzas de cada aminoácido.

Esta introducción es muy somera y no tiene en cuenta factores como
[pseudo-genes](http://downloads.hindawi.com/journals/cfg/2012/424526.pdf)
o
[material no codificante](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2434389/),
sobre cuyas funciones todavía no hay consenso;
ni siquiera sabemos si tienen utilidad o no
(_spoiler alert_: casi seguro que sí).
Más abajo veremos algunos detalles más.
Pero vamos a ver cómo se traducen estos mecanismos a otros que seguramente serán más familiares.

# Memoria

En los ordenadores modernos distinguimos entre memoria de sólo lectura (ROM)
donde suele venir la información escrita de fábrica;
y memoria de acceso aleatorio (RAM), que se usa para escribir datos y puede modificarse.

## Tamaño de ROM

El genoma es en principio memoria de sólo lectura,
y podemos por tanto compararlo con la ROM de un ordenador.
La unidad usada se corresponde con un nucleótido,
pareado siempre con otro en la doble hélice;
de ahí que se midan pares de bases
(o "bp" en inglés, por _base pairs_).

![Estructura de la doble hélice. Adaptado del [original en tamil](https://commons.wikimedia.org/wiki/File:Diagram_showing_a_double_helix_of_a_chromosome_CRUK_065-ta.svg).](pics/bacterias-doble-helice.svg "El ADN es una escalera de caracol, con el exterior formado por grupos fosfato y desoxirribosa. Los peldaños están formados por un par de aminoácidos adenina, guanina, timina y citosina; la citosina se aparea siempre con guanina, y la adenina con timina.")

Los virus tienen un genoma que oscila entre
[1700 pares de bases y 2.8 millones de pares de bases](http://book.bionumbers.org/how-big-are-genomes/).
El rango más habitual es
[entre 4 kbp y 20 kbp](https://www.frontiersin.org/articles/10.3389/fevo.2015.00143/full).
Las bacterias están  en un rango más estrecho;
quitando anomalías como micoplasmas,
sus genomas tienen
[entre 1 y 10 Mbp](https://metode.org/issues/monographs/the-size-of-the-genome-and-the-complexity-of-living-beings.html).

Las eucariotas unicelulares ocupan el siguiente escalón:
[alrededor de 10 Mbp](https://www.researchgate.net/publication/49759737_Chromosome_Size_in_Diploid_Eukaryotic_Species_Centers_on_the_Average_Length_with_a_Conserved_Boundary).
Invertebrados, plantas y mamíferos están
entre 100 Mbp y 10 Gbp,
con
[múltiples anomalías de criaturas con genomas enormes](https://metode.org/issues/monographs/the-size-of-the-genome-and-the-complexity-of-living-beings.html).
Por ejemplo la cebolla común _Allium cepa_ tiene,
por algún motivo,
cinco veces más pares de bases (18 Gbp) que un ser humano (3.2 Gbp).
Es un ejemplo lo que se conoce como
[enigma de los _C-values_](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4571570/):
no hay una relación estricta entre complejidad de un organismo y el tamaño de su genoma.
Y mejor no hablemos de _Paris japonica_,
una planta con
[150 Gbp](https://academic.oup.com/botlinnean/article/164/1/10/2418538).

Resulta que cada par de bases (bp) son dos bits,
así que un byte serán 4 bp.
Con esta sencilla equivalencia podemos dar un salto conceptual a otra de nuestras áreas favoritas:
los ordenadores personales y de bolsillo,
éstos últimos más conocidos como _smartphones_.
Podemos mirar la memoria que trae escrita de fábrica (ROM),
o si el sistema operativo se carga bajo demanda
buscar el tamaño de la imagen original.
Así podemos comparar la información que llevan de fábrica nuestros dispositivos y los organismos vivos.

![Tamaños de ROM de diversos ordenadores, dispositivos móviles y seres vivos. <a href="pics/bacterias-roms.png" target="_blank">🔍 Ampliar</a>. Fuente: elaboración propia. Datos: [ordenadores](rom-sizes/rom-sizes-computers.csv), [móviles](rom-sizes/rom-sizes-mobile.csv), [seres vivos](rom-sizes/rom-sizes-living.csv).](pics/bacterias-roms.png "En la gráfica se muestran los tamaños de ROM de diversos organismos, y una escala temporal de ROMs en ordenadores y dispositivos móviles.")

Un virus tiene la misma ROM que un ZX Spectrum,
legendario ordenador de 8 bits.
Una bacteria contiene la información equivalente a una PDA Psion Siena,
una consola de 16 bits.
La levadura de panadero equivale a una Palm Tugsten T,
de 32 bits.
Por su parte, las eucariotas van de un Windows 95 (32 bits) a un Windows Vista (64 bits),
o bien de un Nokia 7650 (32 bits) a una Android 10 (64 bits).
El ser humano tiene algo más de información que un CD-Rom,
y por lo tanto que la distribución de Knoppix en CD;
y algo menos que un móvil con Android 8.

Pero esto es sólo el sistema operativo,
sin tener en cuenta todavía programas y aplicaciones.
¿Cuál sería su equivalente en el genoma?

## Memoria interna

En un organismo vivo es necesario primero transcribir el ADN en ARN.
El ARN es por tanto similar a la RAM o memoria de lectura y escritura:
suele hacer de
[mensajero](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3078976/)
y de [regulador de la generación de proteínas](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3132550/).
En las bacterias hay
[unas seis veces más ARN que ADN](http://book.bionumbers.org/what-is-the-macromolecular-composition-of-the-cell/)

La cosa no acaba ahí.
Las bacterias tienen,
igual que las eucariotas,
[memoria epigenética](https://mmbr.asm.org/content/70/3/830):
ciertas condiciones del entorno (encontradas localmente o incluso heredadas)
pueden hacer que se expresen ciertos genes y se supriman otros.
Esto se consigue de varias formas,
entre ellas marcando químicamente partes del genoma (con grupos metilo).

Toda esta información está dentro de la "memoria de trabajo" de una célula.
Es así como la célula se adapta al medio en el que trabaja.

## Memorias externas

¿Hay alguna posibilidad de acceder a más memoria en una célula?
Por supuesto, hay varios mecanismos bastante sofisticados.

Las bacterias pueden también recibir genes externos a través de virus:
los bacteriófagos pueden funcionar
[como reserva de genes](https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.0040234)
para sus anfitriones bacterianos.
Los fagos "templados" pueden reproducirse
[sin destruir a las bacterias anfitrionas](https://www.nature.com/articles/ismej201716).
Incluso los fagos virulentos
pueden permitir a las bacterias anfitrionas
[reproducirse durante muchas generaciones](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.522.4481&rep=rep1&type=pdf).

En las cianobacterias del mar, por ejemplo,
los cianófagos almacenan genes de fotosíntesis
que pueden aportar a sus víctimas en el momento de infectarlas.
Lo mismo ocurre [en tierra firme](https://www.pnas.org/content/pnas/102/52/19009.full.pdf),
y en las profundidades marinas con
[genes para alimentarse de sulfuros](https://www.researchgate.net/profile/Melissa_Duhaime/publication/262019905_Sulfur_Oxidation_Genes_in_Diverse_Deep-Sea_Viruses/links/0deec53a08f3b471d8000000/Sulfur-Oxidation-Genes-in-Diverse-Deep-Sea-Viruses.pdf).

Estos virus servirían pues como discos duros externos:
se guardan un gen que luego pueden aportar si se deteriora el gen original.
O incluso servir de librería genética en un momento dado.
Podemos imaginar este mecanismo como un tipo de _backup_ en la nube.
Todavía hay mucho que investigar en este campo,
y seguro que nos tienen guardadas muchas sorpresas.

## Red de redes

Hablando de la nube,
¿se comunican unas bacterias con otras?
¿Pueden intercambiar genes directamente?

Existen mecanismos como los
[priones](https://en.wikipedia.org/wiki/Prion)
que permiten compartir estos cambios rápidamente entre una población entera de bacterias.
Se trata de unas proteinas que cambian de forma al entrar en contacto con la forma modificada.
La enfermedad de las vacas locas (encefalopatía espongiforme bovina)
está causada por un prión.
Se puede transmitir poca información de esta forma:
para ser exactos, un bit (prión inactivo -> prión activo).

También hay intercambio directo de genes.
Algo que se conoce desde hace tiempo es la
[conjugación bacteriana](https://onlinelibrary.wiley.com/doi/full/10.1046/j.1365-2958.2002.03014.x):
una bacteria inyecta un trocito de ADN llamado plásmido en otra.

![Diagrama esquemático de la conjugación bacteriana. _Biiij, qué ascazo_. <a href="pics/bacterias-conjugacion.svg" target="_blank">🔍 Ampliar</a>. [Fuente](https://commons.wikimedia.org/wiki/File:Conjugation-es.svg).](pics/bacterias-conjugacion.svg "Conjugación en cuatro fases. 1: la célula donante produce un pilus. 2: el pilus alcanza otra célula, uniéndolas. 3: el plásmido se duplica, y una hebra de ADN se transfiere a la célula receptora. 4: ambas células vuelven a circularizar sus plásmidos, sintetizan una segunda hebra, y reproducen los pelos; ambas células son ahora donantes viables.")

La cosa no queda ahí.
Las bacterias pueden de hecho tomar plásmidos que están sueltos por ahí en el medio
e integrarlos en su ADN:
es lo que se llama
[transformación genética](http://web.biosci.utexas.edu/psaxena/BIO366/articles/050801DNA%20transformation.pdf).
Si todavía no tienes miedo,
piensa que hay plásmidos en entornos contaminados
que codifican
[resistencia a múltiples antibióticos y a metales pesados](https://mbio.asm.org/content/mbio/5/5/e01918-14.full.pdf).
Las bacterias integran  los plásmidos cuando los necesitan,
y [los pierden](https://pdfs.semanticscholar.org/9947/d4ff6aac909bff725edb06ee231351661980.pdf)
cuando dejan de ser útiles.

La transferencia de genes no sólo ocurre en procariotas.
Si le damos de comer al nematodo _C. elegans_
[un plásmido fluorescente](https://dev.biologists.org/content/develop/124/3/637.full.pdf),
se lo traga y empieza a expresar la proteína.
El resultado es muy bonito y útil a la vez para discriminar cuándo expresa ciertos genes.

![Un ejemplar de _C. elegans_ tuneado posa para nosotros, expresando una variante verde de la molécula fluorescente GFP en su intestino. [Fuente](https://dev.biologists.org/content/develop/124/3/637.full.pdf).](pics/bacterias-c-elegans-plasmid.jpg "Los dos nematodos de arriba expresan el gen de la molécula GFP de formas diferentes: el de la izquierda muestra verde en el intestino, el de la derecha en dos leucocitos en forma de rosco.")

Los genetistas están empezando a darse cuenta de la
[importancia de la transferencia horizontal](https://www.pnas.org/content/96/7/3801https://www.pnas.org/content/96/7/3801)
en la evolución.

![Transferencia horizontal de genes en el árbol de la vida. <a href="pics/bacterias-horizontal-gene-transfer.jpg" target="_blank">🔍 Ampliar</a>. [Fuente](https://commons.wikimedia.org/wiki/File:Horizontal-gene-transfer.jpg).](pics/bacterias-horizontal-gene-transfer.jpg "Se muestra el árbol de bacterias, arqueas y eucariotas, con ciertos eventos de transferencias horizontales. A destacar: integración de mitocondrias en eucariotas, integración de plástidos en plantas, y transferencias entre bacterias y arqueas. Detalle con eventos de transferencias entre bacterias.")

# Limpieza de código

Al igual que en cualquier desarrollo de software,
en el genoma se va acumulando código muerto en forma de
[pseudo-genes](http://downloads.hindawi.com/journals/cfg/2012/424526.pdf):
vestigios de genes que ya no funcionan.
Como en cualquier programa informático,
llega el momento en el que es buena idea limpiar y reducir el tamaño del código generado.
En un equipo de desarrollo ya es una tarea bastante difícil.
¿Cómo se hace esto en la Naturaleza?

Puede ser instructivo estudiar
[el genoma de las aves](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4390078/),
que es mucho más reducido que el de mamíferos y reptiles.
Además tiene menos repeticiones y muchas más deleciones
(pérdidas de secuencias de ADN).
Cualquier desarrolladora que se precie sabe que el código repetido es la pesadilla de una buena profesional del software,
y que se elimina con una costosa refactorización.
Así que podemos decir con tranquilidad que el genoma de los pájaros
[está mejor refactorizado](https://bmcevolbiol.biomedcentral.com/articles/10.1186/1471-2148-5-12)
y tiene
[menos código muerto](https://bmcevolbiol.biomedcentral.com/articles/10.1186/1471-2148-4-17)
que el de los mamíferos.
¿Qué guía esta reducción de código?

¿Podría ser una reducción de peso que ayude a volar?
No es descabellado;
al fin y al cabo el genoma representa
[el 1% del peso de una célula en mamíferos](http://manalis-lab.mit.edu/publications/delgado_cermak_PLOS_2013.pdf),
o más bien el 5% si contamos ARN que podemos suponer proporcional.
Un ser humano adulto de 70 kg lleva encima una mochilita de 3.5 kg de ADN y ARN.
Además esta reducción de genoma se da más a menudo en
[pájaros y murciélagos](https://www.pnas.org/content/114/8/E1460);
y el ave con el genoma más grande es el avestruz,
que casualmente no vuela.

La realidad parece que es
[más complicada](https://royalsocietypublishing.org/doi/pdf/10.1098/rspb.2009.1004):
el tamaño del genoma determina el tamaño de la célula,
y éste a su vez la eficiencia del metabolismo.
Personalmente no descarto que el peso del genoma haya sido también un factor.

En las bacterias es el azar quien guía el proceso,
con ciertas ayudas.
Nuestras amigas tienen una
[fuerte tendencia a eliminar código genético](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1189353/).
Si el resultado es viable,
es probable que en unas cuantas generaciones el genoma se reduzca.
Sería interesante entender por qué es ventajoso para una bacteria reducir su genoma,
aunque nos puede dar una pista pensar que ADN+ARN representan
[el 23% del peso de _E. coli_](http://manalis-lab.mit.edu/publications/delgado_cermak_PLOS_2013.pdf):
una variante con menos genes necesitará menos recursos para reproducirse.

Este proceso puede hacerse manualmente.
Por ejemplo un equipo de científicos consiguió una reducción manual de genoma en _E. coli_:
[de 4.4 Mbp a 4.263 Mbp](https://genome.cshlp.org/content/12/4/640.full).
Pero parece que la evolución es mucho más fina.

Por ejemplo,
[_Mycobacterium leprae_](https://www.sciencedirect.com/science/article/pii/S0092867402006657)
tiene 3.3 Mbp,
mientras que su antecesor _M. tuberculosis_ tiene 4.4 Mbp.
Por el camino _M. leprae_ ha perdido unos 2000 genes;
ahora depende de las células del anfitrión para multitud de funciones vitales.
Vemos cómo durante la evolución una bacteria puede eliminar no sólo código genético,
sino incluso funcionalidades enteras que se podrían considerar esenciales.

# Máquinas

Hasta ahora hemos revisado el código genético,
pero en las bacterias hay muchas más cosas.
Los genes codifican unas proteínas que las convierten de forma efectiva en máquinas.
Cada proteína es una macromolécula que actúa como una herramienta muy pequeñita,
con un papel determinado para conseguir sus fines.
Este vídeo muestra cómo funciona un pelo de bacteria:
extensión y retractación rápidas que le permiten moverse.

<iframe class="video" src="https://www.youtube-nocookie.com/embed/HGvnrWrudpA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

La generación de energía se realiza en la proteína ATP sintasa,
una especie de motor que funciona con una eficiencia
[cercana al 100%](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1692765/pdf/10836501.pdf),
impensable para
[motores industriales](https://www.electricmotorengineering.com/high-efficiency-motors-and-sustainability/).
A mí me recuerda mucho a un molinillo de café.

<iframe class="video" src="https://www.youtube-nocookie.com/embed/XI8m6o0gXDY?start=52" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Las kinesinas y dineínas son maquinitas moleculares que
meten nutrientes y sacan los desperdicios de la célula usando ATP como combustible.
Caminan por los microtúbulos,
una especie de autopistas celulares exclusivas de las eucariotas,
aunque en 2011 se descubrió [el equivalente bacteriano](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3232192/).

<iframe class="video" src="https://www.youtube-nocookie.com/embed/gpjcW-ltOFo?start=152" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

En el futuro es posible que podamos usar bacterias como nanobots,
por ejemplo con
[regulación magnética](https://lonelyspore.wordpress.com/2014/07/07/could-magnetic-bacteria-be-the-next-generation-of-microbots/).
También como almacenamiento de información o incluso como
[procesadores biológicos](https://www.sngular.com/es/microbiologia-bacterias-futuro-tecnologia/).

## PCR

Todo esto está muy bien,
pero nos sirve de poco al género humano.
¿Hay algo por ahí que podamos usar nosotros?
Hablemos de la 
[polymerase chain reaction](https://en.wikipedia.org/wiki/Polymerase_chain_reaction)
o PCR, una herramienta bacteriana usada por ejemplo en los famosos tests que detectan el coronavirus.
Su descubrimiento le valió un premio Nobel a
[Kary Mullis](https://en.wikipedia.org/wiki/Kary_Mullis)
en 1993.
Consiste en usar una polimerasa obtenida de la bacteria
[_Thermus aquaticus_](https://en.wikipedia.org/wiki/Thermus_aquaticus)
para amplificar un fragmento de ADN.
Esto sirve para detectar el código genético de un ser vivo cualquiera,
por ejemplo un virus patógeno.
Pero también se puede usar para analizar genes humanos,
amplificar ADN de fósiles o pruebas de paternidad.

Vamos a terminar esta sección con una nota triste.
En agosto de 2019
[Mullins murió de neumonía](https://mynewsla.com/education/2019/08/08/nobel-winner-kary-banks-mullis-who-revolutionized-dna-research-dies-in-o-c/).
¿Es posible que finalmente las bacterias tuvieran su revancha?

## Virus y simplicidad

Los virus son mucho más sencillos que las bacterias:
como hemos visto, por el tamaño de ROM son equivalentes a un ordenador de 8 bits.
Para empezar no se pueden reproducir por sí solos,
sino que dependen completamente de la maquinaria de las células que invaden.
Pero siguen siendo máquinas muy efectivas.

Al ser más sencillos también son más fáciles de modelar.
Janet Iwasa ha realizado una
[animación bastante completa](http://scienceofhiv.org/wp/?page_id=20)
de cómo funciona el virus del SIDA.
Aquí podemos apreciar cómo toda la maquinaria molecular funciona junta:

<iframe class="video" src="https://player.vimeo.com/video/260291607?title=0&byline=0&portrait=0" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>

## Replicación

Una bacteria tiene una maquinaria molecular mucho más compleja y autosuficiente.
Esto le permite replicarse completamente en
[tan solo 18 minutos](https://bio.libretexts.org/Bookshelves/Genetics/Book%3A_Working_with_Molecular_Genetics_(Hardison)/Unit_II%3A_Replication_Maintenance_and_Alteration_of_the_Genetic_Material/6._DNA_replication_II%3A_Start%2C_stop_and_control/Replication_in_Bacteria),
aunque otras bacterias como _M leprae_ (causante de la lepra)
pueden tardar
[hasta 14 días](https://varuncnmicro.blogspot.com/2016/09/btb9-bacterial-growth-curve.html).
Por otra parte, si las condiciones no son óptimas algunas bacterias pueden tardar algo más:
¿qué tal [diez mil años](https://www.bbc.com/news/science-environment-23855436)?

En el mejor de los casos los seres humanos tardamos décadas en reproducirnos.
Esto nos da una idea de lo desigual de la evolución en estos ámbitos tan diferentes.
En el próximo capítulo veremos cómo estos tiempos de replicación son cruciales
para estudiar las enfermedades causadas por bacterias.

# Continuará…

Este artículo es la segunda parte de la
[serie sobre bacterias](/bacterias).
Continuará.
<!--
Sigue a la
[parte 3: El largo camino a la simbiosis](bacterias-simbiosis),
donde estudiaremos el sistema inmune y sus modos de fallo.
-->

* ← Parte 1: [🦠 Y las bacterias, bonita](/2021/bacterias-bonita).
* ↑ Parte 2: ⚙️ Tecnología bacteriana.
<!--
* → Parte 3: [🖇️ El largo camino a la simbiosis](bacterias-simbiosis).
* → Parte 4: [Enfermedades autoinmunes](bacterias-autoinmunes).
* → Parte 5: [¿Venimos de las estrellas?](bacterias-estrellas)
* → Parte 6: [Conclusiones](bacterias-conclusiones).
-->

