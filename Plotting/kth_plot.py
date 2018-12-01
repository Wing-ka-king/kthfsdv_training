import matplotlib.pyplot as plt
import numpy as np

class plot():

    def _init_(self):
	    self.x = x
	    self.y = y

    def axis_args(self,x1,x2,interval):
	    self.x = np.arange(x1,x2,interval)
	    return self.x
	
    #def axes_scale(self):


    def function(self, x):
	    self.y = 3*np.pi*np.exp(-5*np.sin(2*np.pi*x))
	    return self.y

    def graph(self, x, y):
	    plt.plot(self.x,self.y)
	    plt.show()


if __name__ == '__main__':
    a = plot()
    a.x = a.axis_args(0.0, 2.0, 0.01)
    a.y = a.function(a.x)
    print(a.y[:5])
    a.graph(a.x,a.y)
