import matplotlib.pyplot as plt
import numpy as np


def f(t):
    return 3*np.pi*np.exp(-5*np.sin(2*np.pi*t))


t1 = np.arange(0.0, 2.0, 0.01)

plt.plot(t1,f(t1),'k')
plt.show()
