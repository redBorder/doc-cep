BASE=cep-documentation
OUTDIR=docs
CHAPTERS=chapters
LANG=es-ES
MAIN=$(BASE).adoc

.PHONY: html
html: $(SOURCES) styles/$(CSS)
	asciidoctor $(MAIN) -a lang=$(LANG) -a stylesheet=./styles/rubygems.css --attribute tabsize=4 -o $(OUTDIR)/$(LANG)/index.html
	cp -r $(CHAPTERS)/images $(OUTDIR)

.PHONY: pdf
pdf: $(SOURCES) styles/$(CSS)
	asciidoctor-pdf $(MAIN) -B chapters --attribute tabsize=4 -o $(OUTDIR)/pdf/$(MAIN).pdf

.PHONY: clean
clean:
	-rm -rf $(OUTDIR)/*

print-%  : ; @echo $* = $($*)
