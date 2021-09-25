VPATH = src build images

LFLAGS = -interaction=nonstopmode -output-directory=build -synctex=1
RFLAGS = --pdf

all: ns11-proposal-uvm-vtc.pdf

ns11-proposal-uvm-vtc.pdf: ns11-proposal-uvm-vtc.tex

%.pdf: %.tex %.aux
	pdflatex $(LFLAGS) $<
	pdflatex $(LFLAGS) $<

%.aux: %.tex
	pdflatex $(LFLAGS) $<
	bibtex build/$@
	pdflatex $(LFLAGS) $<

ns11-proposal-uvm-vtc.tex: structure.tex header.tex \
abstract.tex project_narrative.tex statement_of_objectives.tex impact.tex \
research_effort.tex key_personnel.tex facilities.tex equipment.tex \
budget.tex milestones.tex \
footer.tex
	cat $^ > $@

.PHONY: clean
clean:
	rm -rfv *~ *.tex build/* src/*~
