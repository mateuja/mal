SRCS = step0_repl.hs
BINS = $(SRCS:%.hs=%)
ghc_flags = -Wall

all = $(BINS)

dist: mal

mal: $(word $(words $(BINS)),$(BINS))
	cp $< $@

$(BINS): %all: $(BINS)

dist: mal

mal: $(word $(words $(BINS)),$(BINS))
	cp $< $@

$(BINS): %: %.hs $(OTHER_SRCS)
	ghc ${ghc_flags} --make $< -o $@

clean:
	rm -f $(BINS) mal *.hi *.o
