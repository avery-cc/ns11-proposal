VPATH = src

LFLAGS = -interaction=nonstopmode -output-directory=build -synctex=1
RFLAGS = --pdf

all: ns11-proposal-uvm-vtc.pdf

ns11-proposal-uvm-vtc.pdf: ns11-proposal-uvm-vtc.tex
	pdflatex $(LFLAGS) $<
	pdflatex $(LFLAGS) $<

ns11-proposal-uvm-vtc.tex: structure.tex header.tex \
abstract.tex project_narrative.tex statement_of_objectives.tex impact.tex \
research_effort.tex key_personnel.tex facilities.tex equipment.tex \
budget.tex milestones.tex \
footer.tex
	cat $^ > $@

.PHONY: clean
clean:
	rm -rfv *~ build/* *.tex
