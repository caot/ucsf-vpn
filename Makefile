SHELL:=/bin/bash

README.md: README.md.tmpl bin/ucsf-vpn
	@bfr=`cat $<`; \
	help=`bin/ucsf-vpn --help`; \
	bfr=`echo "$${bfr/\{\{ HELP \}\}/$$help}"`; \
	printf "$$bfr" > $@
	@echo "README.md"


.PHONY: test

check:
	shellcheck bin/ucsf
	shellcheck bin/ucsf-vpn

spelling:
	Rscript -e 'spelling::spell_check_files(c("NEWS.md", "README.md"), ignore = readLines("WORDLIST"))'
