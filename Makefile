
main = DLUTThesis

latexcmd := xelatex
latexcmden := xelatex
# latexcmden := pdflatex

# stydir = /Users/Khaos/Library/texmf/tex/latex/DJThesis/PhDThesis01
# stydir := $(shell dirname $(shell kpsewhich SUACSEThesis.sty))
stydir := ./Sty
stydirlocal = ./

styfile = dlutthesis.cls
# support := $(styfile:%=$(stydir)/%)
# /Users/Khaos/Library/texmf/tex/latex/pmat/pmat.sty
supportlocal := $(styfile:%=$(stydirlocal)/%)
# pkgsupport := $(shell cat SUACSEThesis.pkgs)

figsrcdir = Figs/Src
figpdfdir = Figs/pdf
figpngdir = Figs/png


origPGFFig := $(patsubst %, $(figpdfdir)/%, \
  )

tikzDeviceFig := $(patsubst %, $(figsrcdir)/%, \
  )

gnuplotFig := $(patsubst %, $(figsrcdir)/%, \
  )

fig-tmp := $(patsubst %, $(figpdfdir)/%, \
  )
figures := $(origPGFFig) $(fig-tmp)

# algdir = ./Algs
# algorithm := $(shell ls ./Algs/*.algx)
# algorithm := $(patsubst %, $(algdir)/%, FPFastICA.tex FPFastICA_modified.tex)

ifeq ($(OS),Windows_NT)
	TEXINPUTS := $(stydirlocal);$(figpdfdir);$(figpngdir);$(TEXINPUTS)
else
	TEXINPUTS := $(stydirlocal):$(figpdfdir):$(figpngdir):$(TEXINPUTS)
endif
# TEXINPUTS.xelatex := $(TEXINPUTS)
# tmpvar := $(chapters:$(main)-%=fig%)
# tmpvar := $(addsuffix .tex,$(chapters))
# tmpvar := $(filter $(figpdfdir)/pgf-o-%.pdf, $(figures))
tmpvar := $(stydir)

.PHONY: show clean test glotest bibtextest bibertest pdfonly pgffig cpsty

# $(chapters) show clean glotest bibtextest bibertest pdflatexonly pgffig cpsty

show: $(main).pdf
	open -a Skim.app $^
	osascript -e 'tell application "Skim" to revert item 1 of (every window whose name contains "'$<'")'

tmpfont = simkai.ttf


test:
	# kpsewhich --help
	echo $(TEXMFCNF)
	which make
	@TEXINPUTS="$(TEXINPUTS)"; \
	echo $(TEXINPUTS); \
	echo $$TEXMFCNF; \
	kpsewhich simkai.ttf; \
	kpsewhich texmf.cnf
	# @echo $$PATH

	# kpsewhich simkai.ttf
	# fc-cache -v
	# fc-list >font.txt
	# fc-list -f "%{family}\n" :lang=zh > fontzh.txt
	# which xelatex

testend:
	# @TEXINPUTS.xelatex="$(TEXINPUTS.xelatex)"; \
	# echo $(TEXINPUTS.xelatex);
	# @echo $(algorithm);
	# @echo $(tmpvar);
	# echo $(support);
	# echo $(supportlocal);
	# echo $(TEXINPUTS)

bibtextest:
	$(latexcmd) -shell-escape -file-line-error $(main); \
	bibtex $(main); \
	$(latexcmd) -shell-escape -file-line-error $(main)

bibertest:
	$(latexcmd) -shell-escape -file-line-error $(main); \
	biber $(main); \
	$(latexcmd) -shell-escape -file-line-error $(main)

glotest:
	$(latexcmd) -shell-escape -file-line-error $(main); \
	makeindex -s $(main).gst -o $(main).gls $(main).glo; \
	$(latexcmd) -shell-escape -file-line-error $(main)

glostest:
	$(latexcmd) -shell-escape -file-line-error $(main); \
	makeglossaries $(main); \
	$(latexcmd) -shell-escape -file-line-error $(main); \
	$(latexcmd) -shell-escape -file-line-error $(main)

pgftest:
	$(latexcmd) -shell-escape -file-line-error $(main); \
	make -f $(main).makefile -B; \
	$(latexcmd) -shell-escape -file-line-error $(main)

pdfonly: $(figures)
	@TEXINPUTS="$(TEXINPUTS)" \
	$(latexcmd) -shell-escape -file-line-error -synctex=1 $(main)
    # open -a Skim.app $(main)cn.pdf
    # osascript -e 'tell application "Skim" to revert item 1 of (every window whose name contains "'$(main)cn.pdf'")'


$(main).pdf: $(main).tex $(addsuffix .tex,$(chapters)) \
  $(addsuffix .tex,$(auxparts)) $(support) $(algorithm) $(figures)
	@TEXINPUTS="$(TEXINPUTS)" \
	$(latexcmd) -shell-escape -file-line-error $(main); \
	biber $(main); \
	makeglossaries $(main); \
	$(latexcmd) -shell-escape -file-line-error $(main); \
	makeglossaries $(main); \
	$(latexcmd) -shell-escape -file-line-error $(main); \
	$(latexcmd) -shell-escape -file-line-error -synctex=1 $(main)

clean:
	-rm -f *.pdf *.log *.aux *.out *.bbl *.bcf *.blg \
		*.figlist *.glo *.gls *.lof *.lot *.xml *.gz *.toc \
		*.acn *.acr *.alg *.glg *.ilg *.ist
	-rm -f Figs/pdf/pgf-*.*

cleanroot:
	-rm -f *.pdf *.log *.aux *.out *.bbl *.bcf *.blg \
		*.figlist *.glo *.gls *.lof *.lot *.xml *.gz *.toc \
		*.acn *.acr *.alg *.glg *.ilg *.ist

$(supportlocal):


# $(supportlocal): $(stydirlocal)/%: $(stydir)/%
	# cp $< $(stydirlocal)


	# biber $(main); \
	# makeglossaries $(main); \
	# $(latexcmd) -shell-escape -file-line-error $(main); \
	# makeglossaries $(main); \
	# $(latexcmd) -shell-escape -file-line-error $(main); \
	# $(latexcmd) -shell-escape -file-line-error -synctex=1 $(main)


# $(main).pdf: $(main).tex $(addsuffix .tex,$(chapters)) \
#   $(addsuffix .tex,$(auxparts)) $(support) $(algorithm) $(figures)

# thesis: $(main).pdf

# bibtextest:
# 	$(latexcmd) -shell-escape -file-line-error $(main); \
# 	bibtex $(main); \
# 	$(latexcmd) -shell-escape -file-line-error $(main)
#
# bibertest:
# 	$(latexcmd) -shell-escape -file-line-error $(main); \
# 	biber $(main); \
# 	$(latexcmd) -shell-escape -file-line-error $(main)
#
# glotest:
# 	$(latexcmd) -shell-escape -file-line-error $(main); \
# 	makeindex -s $(main).gst -o $(main).gls $(main).glo; \
# 	$(latexcmd) -shell-escape -file-line-error $(main)
#
# glostest:
# 	$(latexcmd) -shell-escape -file-line-error $(main); \
# 	makeglossaries $(main); \
# 	$(latexcmd) -shell-escape -file-line-error $(main); \
# 	$(latexcmd) -shell-escape -file-line-error $(main)
#
# pgftest:
# 	$(latexcmd) -shell-escape -file-line-error $(main); \
# 	make -f $(main).makefile -B; \
# 	$(latexcmd) -shell-escape -file-line-error $(main)
#
# pl:
# 	$(latexcmd) -shell-escape -file-line-error -synctex=1 $(main)
#
# pgffig: $(filter $(figpdfdir)/pgf-%.pdf, $(figures))
#
# 	# make -f $(main).makefile -B
#
# cpsty: $(supportlocal) $(stydirlocal)/pmat.sty
#
# clean:
# 	-rm -f *.pdf *.log *.aux *.bbl *.bcf *.blg \
# 		*.figlist *.glo *.gls *.lof *.lot *.xml *.gz *.toc \
# 		*.acn *.acr *.alg *.glg *.ilg *.ist
# 	-rm -f Figs/pdf/pgf-*.*
#
# cleanroot:
# 	-rm -f *.pdf *.log *.aux *.bbl *.bcf *.blg \
# 		*.figlist *.glo *.gls *.lof *.lot *.xml *.gz *.toc \
# 		*.acn *.acr *.alg *.glg *.ilg *.ist
#
# $(main).pdf: $(main).tex $(addsuffix .tex,$(chapters)) \
#   $(addsuffix .tex,$(auxparts)) $(support) $(algorithm) $(figures)
# 	@TEXINPUTS="$(TEXINPUTS)" \
# 	$(latexcmd) -shell-escape -file-line-error $(main); \
# 	biber $(main); \
# 	makeglossaries $(main); \
# 	$(latexcmd) -shell-escape -file-line-error $(main); \
# 	makeglossaries $(main); \
# 	$(latexcmd) -shell-escape -file-line-error $(main); \
# 	$(latexcmd) -shell-escape -file-line-error -synctex=1 $(main)
#
# 	# make -f $(main).makefile -B; \
#
#
# .SECONDEXPANSION:
# $(addsuffix .tex,$(chapters)): $(main)-%.tex: $$(fig%)
#
# 	# $(latexcmd) -shell-escape -file-line-error $(main)
#
# Normal PGF figure
$(filter $(figpdfdir)/pgf-o-%.pdf, $(figures)): $(figpdfdir)/pgf-o-%.pdf: $(figsrcdir)/%.tikz
	@TEXINPUTS="$(TEXINPUTS)" \
	$(latexcmd) -shell-escape -halt-on-error -interaction=batchmode -jobname "$(figpdfdir)/pgf-o-$*" "$(main)"

# # PGF figure using the 'signalflowdiagram' library
# $(filter $(figpdfdir)/pgf-x-%.pdf, $(figures)): $(figpdfdir)/pgf-x-%.pdf: $(figsrcdir)/%.tikz
# 	$(latexcmd) -shell-escape -halt-on-error -interaction=batchmode -jobname "$(figpdfdir)/pgf-x-$*" "\newif\ifsignalflowdiagram\signalflowdiagramtrue\input{$(main)}"
#
# # PGF figure using the 'chains' library
# $(filter $(figpdfdir)/pgf-c-%.pdf, $(figures)): $(figpdfdir)/pgf-c-%.pdf: $(figsrcdir)/%.tikz
# 	$(latexcmd) -shell-escape -halt-on-error -interaction=batchmode -jobname "$(figpdfdir)/pgf-c-$*" "\newif\ifloadchains\loadchainstrue\input{$(main)}"
#
# # PGF figure requiring large memory
# $(filter $(figpdfdir)/pgf-l-%.pdf, $(figures)): $(figpdfdir)/pgf-l-%.pdf: $(figsrcdir)/%.tikz
# 	$(latexcmd) -shell-escape -halt-on-error -interaction=batchmode -jobname "$(figpdfdir)/pgf-l-$*" "$(main)"
#
# # PGF figure generated using R
# $(filter $(figpdfdir)/pgf-r-%.pdf, $(figures)): $(figpdfdir)/pgf-r-%.pdf: $(figsrcdir)/%.tikz
# 	$(latexcmd) -shell-escape -halt-on-error -interaction=batchmode -jobname "$(figpdfdir)/pgf-r-$*" "$(main)"
#
# # Create tikz script from R script
# $(filter $(figsrcdir)/%.tikz, $(tikzDeviceFig)): $(figsrcdir)/%.tikz: $(figsrcdir)/%.R
# 	R CMD BATCH --no-save "$(figsrcdir)/$*.R" "$(figsrcdir)/$*.Rout"
#
# # PGF figure generated using gnuplot
# $(filter $(figpdfdir)/pgf-g-%.pdf, $(figures)): $(figpdfdir)/pgf-g-%.pdf: $(figsrcdir)/%.tikz
# 	$(latexcmd) -shell-escape -halt-on-error -interaction=batchmode -jobname "$(figpdfdir)/pgf-g-$*" "$(main)"
#
# # Create tikz script from gnuplot script
# $(filter $(figsrcdir)/%.tikz, $(gnuplotFig)): $(figsrcdir)/%.tikz: $(figsrcdir)/%.gp
# 	gnuplot "$(figsrcdir)/$*.gp"
#
#
# $(chapters): %: ch-%.pdf
# 	open -a Skim.app $<
# 	osascript -e 'tell application "Skim" to revert item 1 of (every window whose name contains "'$<'")'
#
# ch-%.pdf: %.tex ch-%.bbl ch-%.aux $(support)
# 	cp $(main).pdf $(main)-backup.pdf; \
# 	$(latexcmd) --shell-escape \
# 	  "\includeonly{$*}\input{$(main)}"; \
# 	cp $(main).pdf ch-$*.pdf; \
# 	rm $(main).pdf; \
# 	cp $(main)-backup.pdf $(main).pdf; \
# 	rm $(main)-backup.pdf
#
# ch-%.bbl: $(main).bbl
# 	cp $(main).bbl ch-$*.bbl
#
# ch-%.aux: $(main).aux
# 	cp $(main).aux ch-$*.aux
#
# $(supportlocal): $(stydirlocal)/%: $(stydir)/%
# 	cp $< $(stydirlocal)
#
# $(stydirlocal)/pmat.sty: $(shell kpsewhich pmat.sty)
# 	cp $(shell kpsewhich pmat.sty) $(stydirlocal)
