PREFIX := /usr/local

site-lisp := ${PREFIX}/share/emacs/site-lisp

%.elc: %.el
	emacs -batch -no-site-file -q -f batch-byte-compile $<

${site-lisp}/%.elc: %.elc
	install -D $< $@

compile: cc-mode.compile markdown-mode.compile
.PHONY: compile

install: cc-mode.install markdown-mode.install
.PHONY: install

cc-mode.sources := ${wildcard cc-mode/*.el}
cc-mode.compiled := ${patsubst %.el,%.elc,${cc-mode.sources}}
cc-mode.installed := ${patsubst %,${site-lisp}/%,${cc-mode.compiled}}

cc-mode.compile: ${cc-mode.compiled}
.PHONY: cc-mode.compile

cc-mode.install: ${cc-mode.installed}
.PHONY: cc-mode.install

markdown-mode.sources := markdown-mode/markdown-mode.el
markdown-mode.compiled := ${patsubst %.el,%.elc,${markdown-mode.sources}}
markdown-mode.installed := ${patsubst %,${site-lisp}/%,${markdown-mode.compiled}}

markdown-mode.compile: ${markdown-mode.compiled}
.PHONY: markdown-mode.compile

markdown-mode.install: ${markdown-mode.installed}
.PHONY: markdown-mode.install
