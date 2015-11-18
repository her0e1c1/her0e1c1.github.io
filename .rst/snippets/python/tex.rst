
==========
 Tex Tips
==========

Settings on sphinx
==================

mathjax [#mathjax]_ を利用する。

``conf.py`` に以下を記述する::

  extensions = ["sphinx.ext.mathjax"]
  # 適切なjavasciptのURLを設定すること
  mathjax_path = "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"

.. [#mathjax] http://docs.sphinx-users.jp/ext/math.html#module-sphinx.ext.mathjax

How to write
============

inline要素として、 :math:`\alpha > \beta` 記述する場合

::

 inline要素として、 :math:`\alpha > \beta` 記述する場合

.. math::

  n_{\mathrm{offset}} = \sum_{k=0}^{N-1} s_k n_k

::

  n_{\mathrm{offset}} = \sum_{k=0}^{N-1} s_k n_k

.. math::

  W^{3\beta}_{\delta_1 \rho_1 \sigma_2} \approx U^{3\beta}_{\delta_1 \rho_1}

::

  W^{3\beta}_{\delta_1 \rho_1 \sigma_2} \approx U^{3\beta}_{\delta_1 \rho_1}
