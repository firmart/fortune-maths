PREFIX=/usr/local
DESTDIR=
GAMES=$(PREFIX)/games
FORTUNES=$(PREFIX)/share/games/fortunes
PROOFSDIR=$(DESTDIR)$(FORTUNES)/proofs

TEXTS=$(patsubst %.d,%,$(wildcard *.d))
DATA=$(patsubst %,%.dat, $(TEXTS))
PROOFS=$(shell find $(wildcard *.d) -type f,l -name '*.tex')
all: clean $(TEXTS)


data: 
	python3 cookie2dat.py

$(TEXTS): data
	find $@.d -type f,l -name '*.dat' -print0 | LC_ALL=C sort -z | xargs -0r cat | cat >> $@
	strfile $@ $@.dat

distclean: clean

clean:
	-rm -f $(DATA)
	find *.d -type f,l -name '*.dat' -delete
	-rm -f $(TEXTS)
	#-rm -rf math.d/* maths 

install: clean all
	mkdir -p $(DESTDIR)$(FORTUNES)
	mkdir -p $(PROOFSDIR)
	install -m0644  $(PROOFS) $(PROOFSDIR)
	install -m0755  fortune-maths      $(DESTDIR)$(GAMES)
	install -m0644  $(TEXTS) $(DATA)  $(DESTDIR)$(FORTUNES)

.PHONY: install clean distclean all
