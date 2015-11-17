# -*- coding: utf-8 -*-
import sys, os
sys.path.append(os.path.abspath('sphinxext'))
extensions = [
    "sphinx.ext.mathjax",
    # pip install matplotlib ipython
    'matplotlib.sphinxext.mathmpl',
    'matplotlib.sphinxext.only_directives',
    'matplotlib.sphinxext.plot_directive',
    'sphinx.ext.autodoc',
    'sphinx.ext.doctest',
    #'matplotlib.sphinxext.ipython_directive',
    #'ipython_console_highlighting',
    #'inheritance_diagram',
    #'numpydoc'
]

# Use the MathJax Content Delivery Network (CDN)
mathjax_path = "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# The suffix of source filenames.
source_suffix = '.rst'

# The encoding of source files.
#source_encoding = 'utf-8-sig'

# The master toctree document.
master_doc = 'index'

# General information about the project.
project = u'Learning'
copyright = u'2013, her0e1c1'

# The version info for the project you're documenting, acts as replacement for
# |version| and |release|, also used in various other places throughout the
# built documents.
#
# The short X.Y version.
version = '1'
# The full version, including alpha/beta/rc tags.
release = '1'
exclude_patterns = ['_build', 'sample']

pygments_style = 'sphinx'
html_theme = 'haiku'
html_static_path = ['_static']
htmlhelp_basename = 'Learningdoc'

# -- Options for LaTeX output --------------------------------------------------

latex_elements = {
# The paper size ('letterpaper' or 'a4paper').
#'papersize': 'letterpaper',

# The font size ('10pt', '11pt' or '12pt').
#'pointsize': '10pt',

# Additional stuff for the LaTeX preamble.
#'preamble': '',
}

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title, author, documentclass [howto/manual]).
latex_documents = [('index', 'Learning.tex', u'Learning Documentation',)]

# One entry per manual page. List of tuples
# (source start file, name, description, authors, manual section).
man_pages = [('index', 'learning', u'Learning Documentation',)]

# If true, show URL addresses after external links.
#man_show_urls = False

texinfo_documents = [('index', 'Learning', u'Learning Documentation', 'Miscellaneous'),]
