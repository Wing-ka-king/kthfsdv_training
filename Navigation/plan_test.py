#! /usr/bin/env python3

class SquareGrid:
    def __init__(self, width, height):
        self.width = width
        self.height = height
        self.walls = []

    def in_bounds(self, id):
        (x, y) = id
        return 0 <= x < self.width and 0 <= y < self.height

    def passable(self, id):
        return id not in self.walls

    def neighbors(self, id):
        (x, y) = id
        results = [(x + 1, y), (x, y - 1), (x - 1, y), (x, y + 1)]
        if (x + y) % 2 == 0: results.reverse()  # aesthetics
        results = filter(self.in_bounds, results)
        results = filter(self.passable, results)
        return results

g = SquareGrid(30, 15)
g.walls = [(1,1),(2,1),(3,1), (10,11),(11,11),(12,11),(13,11),(23,15),(24,15),(25,15),(26,15),(27,15),(28,15),(29,15),(30,15)] # long list, [(21, 0), (21, 2), ...]
draw_grid(g)