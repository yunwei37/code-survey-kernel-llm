# Makefile for LaTeX compilation

# Main document name (without .tex extension)
MAIN = conference_101719

# LaTeX compiler
LATEX = pdflatex
BIBTEX = bibtex
LATEXFLAGS = -interaction=nonstopmode

# Default target
all: $(MAIN).pdf

# Main compilation rule
$(MAIN).pdf: $(MAIN).tex $(MAIN).bbl
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex

# Bibliography compilation
$(MAIN).bbl: $(MAIN).aux cite.bib
	$(BIBTEX) $(MAIN)

# Initial compilation to generate .aux file
$(MAIN).aux: $(MAIN).tex
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex

# Clean auxiliary files
clean:
	rm -f *.aux *.log *.out *.bbl *.blg *.toc *.lof *.lot *.cut *.gz

# Clean everything including PDF
cleanall: clean
	rm -f $(MAIN).pdf

# Force recompilation
force: clean all

.PHONY: all clean cleanall force