#!/usr/bin/python
# Generate graph using Python

# importing the required module
import matplotlib.pyplot as plt
import csv

computer = {
        '8bit': '#ccccff',
        '16bit': '#aaccff',
        '32bit': '#ccaaff',
        '64bit': '#aaeeff',
        }

mobile = {
        '8bit': '#ffcccc',
        '16bit': '#ffeecc',
        '32bit': '#ffdddd',
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
        color = mobile.get(row[3], 'gray')
        plt.plot([1976, 2020], [y, y], color='gray')
        plt.text(1974, y, row[1], horizontalalignment='left',
                verticalalignment='center', fontsize=12, bbox=dict(facecolor='white', alpha=0.8, lw=0))

# naming the x axis
plt.xlabel('year')
# naming the y axis
plt.ylabel('bytes')

# giving a title to my graph
plt.title('ROM sizes')

# function to show the plot
plt.show()

