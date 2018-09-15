#! /usr/bin/env python3

from pyqtgraph.Qt import QtGui, QtCore
import pyqtgraph as pq
import numpy as nm
import sys

class adv_graphs:
    def __init__(self, graph_name):
		self.y = [0]
		qapp=pq.mkQApp()

		win = pq.GraphicsWindow(title = graph_name)
		win.setWindowTitle('graph name')
		t = 'TEST:'
		pq.setConfigOptions(antialias=True)
		
		self.graph = win.addPlot()
		self.index = 0
		x = nm.linspace(0,20,num=1000)
		self.y = 3*nm.pi*nm.exp(-1*5*nm.sin(2*nm.pi*x))
		self.curve = self.graph.plot(self.y[:self.index], pen = 'y')

		timer = pq.QtCore.QTimer()
		timer.timeout.connect(self.plot_graph)
		timer.start(60)
		sys.exit(qapp.exec_())
    
    def plot_graph(self):
		self.index = self.index + 1
		self.curve.setData(self.y[:self.index])
		self.graph.setXRange(self.index-100, self.index+50)


if __name__ == '__main__':
	p1 = adv_graphs("Updating Plot")
	
	
    


