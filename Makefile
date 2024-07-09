#-------------------------------------------------------------------------------
# Makefile
# 
# Файл для компиляции результата и очистки директории от лишних файлов
#
# Автор шаблона: Гордеев Иван
#-------------------------------------------------------------------------------

# LaTeX version:
# -pdf		= pdflatex
# -pdfdvi	= pdflatex with dvi
# -pdfps	= pdflatex with ps
# -pdfxe	= xelatex with dvi (faster than -xelatex)
# -xelatex	= xelatex without dvi
# -pdflua	= lualatex with dvi  (faster than -lualatex)
# -lualatex	= lualatex without dvi
BACKEND ?= -lualatex

TARGET ?= 0Main
SOURCE ?= 0Main

define compile
	latexmk $(BACKEND) -jobname=$(TARGET) $(SOURCE)
endef

define copy
	cp $(SOURCE).pdf result/НИР_$(shell date "+%d-%m-%Y").pdf
endef

pdf:	TARGET=0Main
pdf:	SOURCE=0Main

pdf:	
	$(compile)
	$(copy)

clean:
	rm *.out chapters/*.aux *.aux *.bbl *blx.bib *.bcf *.run.xml *.spl *.blg *.fls *.log *.fdb_latexmk *.toc *.synctex.gz *.pdf
