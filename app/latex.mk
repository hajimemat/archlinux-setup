include config.mk
install: ~/.latexmkrc
	$(yaourt) texlive-core texlive-most texlive-lang ghostscript poppler-data evince
