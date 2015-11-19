import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 10)  # from 0 to 10
y = -5 * x + 10
plt.plot(x, y, "r+")  # red + + + +
plt.show()