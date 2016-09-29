DOC=smpp-router
DOC_EXTRA_DEPS=rest.txt

VER=$(shell xmllint --xpath "//revision[last()]/revnumber/text()" $(DOC)-docinfo.xml)

all: $(DOC)-v$(VER).pdf _sphinx/index.rst

$(DOC)-v$(VER).pdf: $(DOC)-docinfo.xml $(DOC).txt styles/custom-dblatex.sty $(DOC_EXTRA_DEPS)
	a2x -L --dblatex-opts=" -s styles/custom-dblatex.sty" -a docinfo $(DOC).txt
	mv $(DOC).pdf $(DOC)-v$(VER).pdf

$(DOC).xml: $(DOC)-docinfo.xml $(DOC).txt styles/custom-dblatex.sty $(DOC_EXTRA_DEPS)
	a2x -L -a docinfo -f docbook $(DOC).txt

_sphinx/index.rst: $(DOC).xml
	 pandoc -s -f docbook -t rst -o _sphinx/index.rst $(DOC).xml

clean:
	$(RM) $(DOC)*.pdf *.xml
