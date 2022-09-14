"""
Find radius of a square matrix.

Made for Ganesh sir.
"""

import math

# Size of square matrix
SIZE = 7

# Input file would have neighbours (separated by spaces)
# of node i in the i-th line
INPUT = "input.txt"

# Initialize distances
edge = []
for i in range(SIZE):
    row = []
    for j in range(SIZE):
        if i == j:
            val = 0
        else:
            val = math.inf
        row.append(val)
    edge.append(row)

# Update distances
with open(INPUT) as fin:
    for i,line in enumerate(fin):
        nos = [int(x) for x in line.split()]
        for no in sorted(nos):
            edge[i][no] = 1

# Floyd-Warshal algorithm: All pairs shortest path
# https://en.wikipedia.org/wiki/Floyd%E2%80%93Warshall_algorithm
for k in range(SIZE):
    for i in range(SIZE):
        for j in range(SIZE):
            t = edge[i][k] + edge[k][j]
            if edge[i][j] > t:
                edge[i][j] = t

l = []
for i in range(SIZE):
    # Maximum value in row
    rmax = max(edge[i])

    # Maximum value in column
    cmax = 0
    for j in range(SIZE):
        if edge[i][j] > cmax:
            cmax = edge[i][j]

    # Maximum of row-wise and column-wise maximums
    l.append(max(rmax, cmax))

# Radius
print(min(l))
