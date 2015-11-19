import matplotlib.pyplot as plt
import numpy as np
x = np.linspace(0, 10, 20)
fig, axes = plt.subplots(3, 2, figsize=(5,5))
cnt = 0
for ax_row in axes:
  for ax in ax_row:
    ax.plot(x, x + cnt * 10)
    cnt += 1