.DEFAULT_GOAL := all

####################################################################################################

ack-root := ack2
ack      := $(ack-root)/ack-standalone

$(ack):
	cd $(@D) && perl Makefile.PL
	cd $(@D) && $(MAKE) ack-standalone

.PHONY: ack
ack: $(ack)

__all__ += ack

####################################################################################################

emacs-root      := emacs
emacs-configure := $(emacs-root)/configure
emacs-makefile  := $(emacs-root)/Makefile
emacs           := $(emacs-root)/src/emacs

$(emacs-configure):
	cd $(@D) && ./autogen.sh

$(emacs-makefile): $(emacs-configure)
	cd $(@D) && $(emacs-configure) --without-makeinfo --without-x

$(emacs): $(emacs-makefile)
	cd $(@D) && $(MAKE)

.PHONY: emacs
emacs: $(emacs)

__all__ += emacs

####################################################################################################

include _llvm.mk

.PHONY: clang
clang: $(clang)

.PHONY: lld
lld: $(lld)

__all__ += clang lld

####################################################################################################

.PHONY: all
all: $(__all__)
