import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 10, 20)  # from 0 to 10 stepped by 20 times
y = x ** 2
plt.plot(x, y, "g-")  # green consecutive line
plt.show()