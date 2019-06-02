DESTDIR=
FORTUNES=/usr/share/games/fortunes

TEXTS=models logic
DATA=models.dat logic.dat
all: $(TEXTS)

$(TEXTS): 
	python3 cookie2dat.py
	find $@.d -type f,l -name '*.dat' -print0 | LC_ALL=C sort -z | xargs -0r cat | cat >> $@
	strfile $@ $@.dat

#models.dat: 
#	touch chinese
#	find chinese.d -type f,l -name '*.dat' -print0 | LC_ALL=C sort -z | xargs -0r cat | cat >> chinese
#	awk '{if ($$0 ~ /--/) {print "[33m" $$0 "[m"} else {print}}' chinese > chinese_colorize
#	sed -i -e 's/《/[32m《/g' -e 's/》/》[m/g' chinese_colorize
#	mv chinese_colorize chinese
#	strfile chinese

distclean: clean

clean:
	-rm -f $(DATA)
	-rm -f $(TEXTS)

install: all
	mkdir -p $(DESTDIR)$(FORTUNES)
	install -m0644  $(TEXTS) $(DATA)  $(DESTDIR)$(FORTUNES)

.PHONY: install clean distclean all
