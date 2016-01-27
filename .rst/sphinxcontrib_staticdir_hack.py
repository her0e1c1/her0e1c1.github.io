# -*- coding: utf-8 -*-
#
# Sphinx extension for renaming _static/ directory
#
# Author: Takeshi KOMIYA / License: BSD
#

import re
import os
import shutil
from docutils.io import StringOutput
from sphinx.util.osutil import relative_uri


def write_doc(self, docname, doctree):
    destination = StringOutput(encoding='utf-8')
    doctree.settings = self.docsettings

    self.secnumbers = self.env.toc_secnumbers.get(docname, {})
    self.fignumbers = self.env.toc_fignumbers.get(docname, {})
    self.imgpath = relative_uri(self.get_target_uri(docname), 'images')
    self.dlpath = relative_uri(self.get_target_uri(docname), '_downloads')
    self.current_docname = docname
    self.docwriter.write(doctree, destination)
    self.docwriter.assemble_parts()
    body = self.docwriter.parts['fragment']
    metatags = self.docwriter.clean_meta

    ctx = self.get_doc_context(docname, body, metatags)
    self.handle_page(docname, ctx, event_arg=doctree)


def on_builder_inited(app):
    if app.builder.name == 'html':
        unusedjs = ["underscore.js", "doctools.js"]
        replacer = lambda uri: re.sub('^_static/', app.config.staticdir_name, uri)
        files = [js for js in app.builder.script_files if os.path.basename(js) not in unusedjs]
        app.builder.script_files = map(replacer, files)
        app.builder.css_files = map(replacer, app.builder.css_files)
        app.builder.imagedir = "images"
        app.builder.write_doc = lambda docname, doctree: write_doc(app.builder, docname, doctree)


def on_html_page_context(app, pagename, templatename, context, doctree):
    original_pathto = context['pathto']

    def pathto(otheruri, *args, **kwargs):
        otheruri = re.sub('^_static/', app.config.staticdir_name, otheruri)
        return original_pathto(otheruri, *args, **kwargs)

    context['pathto'] = pathto


def on_build_finished(app, exception):
    if app.builder.name == 'html' and exception is None:
        staticdir = os.path.join(app.outdir, '_static')
        if os.path.exists(staticdir):
            new_staticdir = os.path.join(app.outdir, app.config.staticdir_name)
            shutil.move(staticdir, new_staticdir)

        imagecdir = os.path.join(app.outdir, '_images')
        if os.path.exists(imagecdir):
            shutil.move(staticdir, os.path.join(app.outdir, app.config.imagedir_name))


def setup(app):
    app.add_config_value('staticdir_name', '_my_static/', 'html')
    app.connect('builder-inited', on_builder_inited)
    app.connect('html-page-context', on_html_page_context)
    app.connect('build-finished', on_build_finished)
