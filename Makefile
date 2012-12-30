
%: 
	echo making $@.md to $@.pdf
	pandoc -s $@.md -o $@.tex
	xelatex $@.tex
	gnome-open $@.pdf
	
TEM = /usr/share/pandoc-1.9.1.1/templates/default.latex 	
DIR = $(dir $(TEM))
FILE = $(notdir $(TEM))

tem:
	echo $(TEM)
	echo $(DIR)
	echo $(FILE)
	sed '1d' $(TEM) > t.latex
	cat modify.tex t.latex > $(FILE)
new:
	sudo cp $(TEM) $(DIR)$(FILE).bak
	ls $(DIR)
	sudo cp $(FILE) $(TEM)
	more $(TEM)

