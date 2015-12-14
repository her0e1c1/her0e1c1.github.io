export SNIPPETS_SRC=.rst/src

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

# need -i optoin to use an alias for sh
rst:
	for p in `find . -name "*.sh"`;do sh -i $$p; done

# TODO: rstが存在しているものは作らないようにする
create:
	for p in `find . -name "*.sh"`;do sh -i $$p > `echo $$p | sed s/.sh/.rst/` ;done

sphinx-build:
	sphinx-build -b html .rst .

cp:
	cp -r * /home/mbp/Desktop/out

clean:
	rm -fr $(OBJS)

all: clean create sphinx-build cp
