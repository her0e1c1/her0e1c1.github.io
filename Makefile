
OBJS = \
_images \
_sources \
_static \
about_me.html \
genindex.html \
index.html \
objects.inv \
products.html \
search.html \
searchindex.js \
snippets \
static \
images \
.buildinfo \
.doctrees \

build:
	sphinx-build -b html .rst .

clean:
	rm -fr $(OBJS)
