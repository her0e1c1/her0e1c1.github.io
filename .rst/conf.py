# -*- coding: utf-8 -*-
import sys, os
sys.path.append(os.path.abspath('sphinxext'))

extensions = [
    "sphinx.ext.mathjax",
    # 'matplotlib.sphinxext.mathmpl',  # conflicts mathjax! Don't use at a time
    # pip install matplotlib ipython
    'matplotlib.sphinxext.only_directives',
    'matplotlib.sphinxext.plot_directive',
    'sphinx.ext.autodoc',
    'sphinx.ext.doctest',
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
copyright = u'2015, Hiroyuki Ishii'

# The version info for the project you're documenting, acts as replacement for
# |version| and |release|, also used in various other places throughout the
# built documents.
#
# The short X.Y version.
exclude_patterns = ['_build', 'sample']

pygments_style = 'sphinx'
html_theme = 'haiku'
html_static_path = ['static']
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

html_title = "BOKUNMICHI"
# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title, author, documentclass [howto/manual]).
latex_documents = [('index', 'Learning.tex', u'Learning Documentation',)]

# One entry per manual page. List of tuples
# (source start file, name, description, authors, manual section).
man_pages = [('index', 'learning', u'Learning Documentation',)]

# If true, show URL addresses after external links.
#man_show_urls = False

texinfo_documents = [('index', 'Learning', u'Learning Documentation', 'Miscellaneous'),]

# on github you can't acceess the url starting with an undersocre.
sys.path.insert(0, os.path.abspath('.'))

extensions += ['sphinxcontrib_staticdir_hack']
staticdir_name = "static/"
imagedir_name = "images/"


import sphinx_bootstrap_theme
# Activate the theme.
html_theme = 'bootstrap'
html_theme_path = sphinx_bootstrap_theme.get_html_theme_path()

html_theme_options = {
    # Navigation bar title. (Default: ``project`` value)
    'navbar_title': "BOKUNMICHI",
    # Tab name for entire site. (Default: "Site")
    'navbar_site_name': "Site",
    # A list of tuples containing pages or urls to link to.
    # Valid tuples should be in the following forms:
    #    (name, page)                 # a link to a page
    #    (name, "/aa/bb", 1)          # a link to an arbitrary relative url
    #    (name, "http://example.com", True) # arbitrary absolute url
    # Note the "1" or "True" value above as the third argument to indicate an arbitrary url.
    'navbar_links': [
        ("Products", "products"),
        ("Snippets", "snippets/index"),
        ("About Me", "about_me"),
    ],
    # Render the next and previous page links in navbar. (Default: true)
    'navbar_sidebarrel': True,
    # Render the current pages TOC in the navbar. (Default: true)
    'navbar_pagenav': True,
    # Global TOC depth for "site" navbar tab. (Default: 1)
    # Switching to -1 shows all levels.
    'globaltoc_depth': 2,
    # Include hidden TOCs in Site navbar?
    #
    # Note: If this is "false", you cannot have mixed ``:hidden:`` and
    # non-hidden ``toctree`` directives in the same page, or else the build
    # will break.
    #
    # Values: "true" (default) or "false"
    'globaltoc_includehidden': "true",
    # HTML navbar class (Default: "navbar") to attach to <div> element.
    # For black navbar, do "navbar navbar-inverse"
    'navbar_class': "navbar navbar-inverse",
    # Fix navigation bar to top of page?
    # Values: "true" (default) or "false"
    'navbar_fixed_top': "true",
    # Location of link to source.
    # Options are "nav" (default), "footer" or anything else to exclude.
    'source_link_position': "nav",
    # Bootswatch (http://bootswatch.com/) theme.
    # Options are nothing (default) or the name of a valid theme
    # such as "amelia" or "cosmo".
    'bootswatch_theme': "united",
    # Choose Bootstrap version.
    # Values: "3" (default) or "2" (in quotes)
    'bootstrap_version': "3",
}
