SLIDES = codecheck21

MAIN =  $(SLIDES).html $(SLIDES).pdf

 
all: $(SLIDES).html

%.html: %.Rmd
	Rscript -e "rmarkdown::render('$^')"

.PHONY: clean copy show

copy: $(MAIN)
	cp $(MAIN) ~/txt/hugo/bd2/static/talks/2021/
	cp -r $(SLIDES)_files ~/txt/hugo/bd2/static/talks/2021/
	# add ? to end of .css file.
	#sed -i '1,/RE/s/default.css"/default.css?"/' $(MAIN)
	#sed -i '1,/RE/s/default-fonts.css"/default-fonts.css?"/' $(MAIN)
	deploy.sh

## Making pdf version of slides takes a few seconds.
## following webshot advice on
## https://github.com/wch/webshot
## in particular, install_phantomjs() first.
## Another approach is to use the pagedown package
## https://github.com/rstudio/pagedown
$(SLIDES).pdf: $(SLIDES).html
	Rscript -e "pagedown::chrome_print('$^')"
	cp $@ ~/txt/hugo/bd2/static/talks/2021/

## convert first page e.g. for making tweet of slides.
simplesteps.png: simplesteps.pdf
	convert simplsteps.pdf[0] simplesteps.png


eglen-orwg2-4up.pdf: eglen-orwg2.pdf
	pdfnup --nup 2x2 --suffix '4up' eglen-orwg2.pdf

eglen-orwg2-poster.pdf: eglen-orwg2.pdf
	pdfnup --no-landscape  --nup '3x5' $^ -o $@ --frame true --papersize '{89cm,118cm}'

# The sed lines are required to ensure that the css are refreshed, I don't know why!
# The sed lines work on mac and unix, BUT assume they won't match the first line.
# Maybe also we don't need the hack, but just need to periodically restart browser?


clean:
	rm -f $(MAIN) 

show: $(MAIN)
	open $(MAIN)

lib/remark-latest.min.js:
	Rscript -e "xaringan::summon_remark()"
