#!/usr/bin/python
# -*- coding: utf8 -*-
# Alex 2020-01-26: Generate graph using Python

# importing the required module
import matplotlib.pyplot as plt
import unicodecsv as csv
size = (1920, 960)
dpi = 96
plt.figure(num=None, figsize=(size[0]/dpi, size[1]/dpi), dpi=dpi)

computer = {
        '8bit': '#ccccff',
        '16bit': '#aaccff',
        '32bit': '#eeccff',
        '64bit': '#aaeeff',
        }

mobile = {
        '8bit': '#ffcccc',
        '16bit': '#ffdddd',
        '32bit': '#ffeecc',
        '64bit': '#ffffcc',
        }

plt.yscale('log')

with open('rom-sizes-computers.csv', 'r') as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    next(plots)
    for row in plots:
        if not row[9]:
            continue
        x = int(row[8])
        y = int(row[9])
        color = computer.get(row[3], 'gray')
        plt.scatter(x, y, marker='+', color='white')
        plt.text(x, y, row[1], horizontalalignment='center',
                verticalalignment='center', fontsize=12, bbox=dict(facecolor=color, alpha=0.8, ls='-'))

with open('rom-sizes-mobile.csv', 'r') as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    next(plots)
    for row in plots:
        if not row[8]:
            continue
        x = int(row[7])
        y = int(row[8])
        color = mobile.get(row[3], 'gray')
        plt.scatter(x, y, marker='.', color='white')
        plt.text(x, y, row[1], horizontalalignment='center',
                verticalalignment='center', fontsize=12, bbox=dict(facecolor=color, alpha=0.8, ls='--'))

with open('rom-sizes-living.csv', 'r') as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    next(plots)
    for row in plots:
        if not row[3]:
            continue
        y = int(row[3])
        color = mobile.get(row[3], 'grey')
        plt.plot([1976, 2020], [y, y], color='#cccccc')
        plt.text(1974.2, y, row[0], horizontalalignment='left',
                verticalalignment='center', fontsize=12, bbox=dict(facecolor='#fffff8', alpha=0.8, lw=0))

plt.xticks(fontsize=12)
plt.yticks(fontsize=12)
plt.xlabel(u'año', fontdict = {'fontsize' : 14})
plt.ylabel('bytes', fontdict = {'fontsize' : 14})
plt.title(u'Tamaños de ROM', fontdict = {'fontsize' : 18})

ylocs = []
ylabels = []
i = 0
for i in range(2, 11):
    ylocs.append(10**i)
    ylabels.append("$10^{{{0}}}$".format(i))

ylocs[4] = 1509950
ylabels[4] = '1 floppy'
ylocs[7] = 734003200
ylabels[7] = '1 CD'
ylocs.append(5046586573)
ylabels.append('1 DVD')
plt.yticks(ylocs, ylabels)

plt.savefig('../pics/bacterias-roms.png', bbox_inches='tight', pad_inches=0.1)

#plt.show()

