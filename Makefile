
prefix=/usr

ALL: install

INSTALL = /usr/bin/install -c -m 0755
INSTALLDATA = /usr/bin/install -c -m 0644


install: plottr.py
	test -d $(prefix) || mkdir --parents $(prefix)
	test -d $(prefix)/share || mkdir --parents $(prefix)/share
	test -d $(prefix)/share/plottr || mkdir --parents $(prefix)/share/plottr

	$(INSTALL) -m 0755 plottr.py $(prefix)/share/plottr

	rm -f $(prefix)/bin/plottr
	ln -s $(prefix)/share/plottr/plottr.py $(prefix)/bin/plottr


uninstall:
	rm -rf $(prefix)/share/plottr
	rm -rf $(prefix)/bin/plottr


.PHONY: install uninstall
