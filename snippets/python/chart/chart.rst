
=======
 chart
=======

.. contents:

:math:`y = x^2`
---------------
.. plot::

   import matplotlib.pyplot as plt
   import numpy as np

   x = np.linspace(0, 10, 20)  # from 0 to 10 stepped by 20 times
   y = x ** 2
   plt.plot(x, y, "g-")  # green consecutive line
   plt.show()

:math:`y = sin(x)`
------------------
.. plot::

   import matplotlib.pyplot as plt
   import numpy as np

   x = np.linspace(0, 10, 20) 
   y = np.sin(x)
   plt.plot(x, y, "*")  # not line but plotting points of a star
   plt.show()
   
:math:`y = ax + b`
------------------
バグってるみたい

.. plot::

    import matplotlib.pyplot as plt
    import numpy as np

    x = np.linspace(0, 10)  # from 0 to 10
    y = -5 * x + 10
    plt.plot(x, y, "r+")  # red + + + + 
    plt.show()
