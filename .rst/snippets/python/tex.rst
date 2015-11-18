
==========
 Tex Tips
==========

Settings on sphinx
==================

using mathjax [#mathjax]_

write the settings in ``conf.py``  ::

  extensions += ["sphinx.ext.mathjax"]
  # you need an appropriate url
  mathjax_path = "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"

.. [#mathjax] http://docs.sphinx-users.jp/ext/math.html#module-sphinx.ext.mathjax

How to write
============
::

   you write :math:`\alpha > \beta` as an inline element

you write :math:`\alpha > \beta` as an inline element

Or use math delective like ::

  .. math::

     n_{\mathrm{offset}} = \sum_{k=0}^{N-1} s_k n_k

.. math::

  n_{\mathrm{offset}} = \sum_{k=0}^{N-1} s_k n_k

Expressions
===========
.. math::

  W^{3\beta}_{\delta_1 \rho_1 \sigma_2} \approx U^{3\beta}_{\delta_1 \rho_1}

::

  W^{3\beta}_{\delta_1 \rho_1 \sigma_2} \approx U^{3\beta}_{\delta_1 \rho_1}
