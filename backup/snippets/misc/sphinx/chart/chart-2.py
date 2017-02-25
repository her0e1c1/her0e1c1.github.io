import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 10, 20)
y = np.sin(x)
plt.plot(x, y, "*")  # not line but plotting points of a star
plt.show()