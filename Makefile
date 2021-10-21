#
# built using mmark 2.

DIRNAME := $(shell basename $(CURDIR))

DOCNAME = $(DIRNAME)
VERSION = 01

ADOPTED =

OUTDIR=$(DOCNAME)-$(VERSION)

# OUTDIREXISTS=$(OUTDIR)/.f

all: $(DOCNAME)-$(VERSION).txt $(DOCNAME)-$(VERSION).html

$(DOCNAME)-$(VERSION).txt: $(DOCNAME)-$(VERSION).xml
	@xml2rfc --text -o $@ $<
	@sed -e '1s/^/```\n/' $@ | sed '$$ s/$$/\n```/' > README.md

$(DOCNAME)-$(VERSION).html: $(DOCNAME)-$(VERSION).xml
	@xml2rfc --html -o $@ $<

$(DOCNAME)-$(VERSION).xml: $(DOCNAME).md
	@sed 's/@DOCNAME@/$(DOCNAME)-$(VERSION)/g' $< | mmark   > $@

clean:
	@rm -f $(DOCNAME)-$(VERSION).txt $(DOCNAME)-$(VERSION).html $(DOCNAME)-$(VERSION).xml

