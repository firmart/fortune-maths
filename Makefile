DESTDIR=
FORTUNES=/usr/share/games/fortunes

TEXTS=models logic
DATA=models.dat logic.dat
all: $(TEXTS)

$(TEXTS): 
	python3 cookie2dat.py
	find $@.d -type f,l -name '*.dat' -print0 | LC_ALL=C sort -z | xargs -0r cat | cat >> $@
	perl -i -pe 's|\*(.*)?\*|\033[34;1m\1\033[0m|' $@  > /dev/null
	strfile $@ $@.dat

distclean: clean

clean:
	-rm -f $(DATA)
	-rm -f $(TEXTS)

install: clean all
	mkdir -p $(DESTDIR)$(FORTUNES)
	install -m0644  $(TEXTS) $(DATA)  $(DESTDIR)$(FORTUNES)

.PHONY: install clean distclean all
