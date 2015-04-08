ROOT   := $(realpath $(dir $(firstword $(MAKEFILE_LIST))))
PREFIX := $(realpath $(ROOT)/..)
BUILD  := $(ROOT)/build

.DEFAULT_GOAL := all

####################################################################################################

ack-root := $(ROOT)/ack2

#---------------------------------------------------------------------------------------------------

ack := $(ack-root)/ack-standalone
$(ack):
	cd $(@D) && perl Makefile.PL
	cd $(@D) && $(MAKE) ack-standalone

.PHONY: ack
ack: $(ack)

__all__ += ack

####################################################################################################

emacs-root := $(ROOT)/emacs

#---------------------------------------------------------------------------------------------------

emacs-configure := $(emacs-root)/configure
$(emacs-configure):
	cd $(@D) && ./autogen.sh

#---------------------------------------------------------------------------------------------------

emacs-makefile := $(emacs-root)/Makefile
$(emacs-makefile): $(emacs-configure)
	cd $(@D) && \
		$(emacs-configure) \
			--prefix=$(PREFIX) \
			--without-makeinfo \
			--without-x

#---------------------------------------------------------------------------------------------------

emacs := $(emacs-root)/src/emacs
$(emacs): $(emacs-makefile)
	cd $(@D) && $(MAKE)

.PHONY: emacs
emacs: $(emacs)

__all__ += emacs

####################################################################################################

help2man-version := 1.46.5

#---------------------------------------------------------------------------------------------------

help2man-root := $(ROOT)/help2man-$(help2man-version)
$(help2man-root):
	curl \
		http://mirrors.syringanetworks.net/gnu/help2man/help2man-$(help2man-version).tar.xz \
	| tar \
		--directory=$(@D) \
		--file - \
		--extract \
		--xz

#---------------------------------------------------------------------------------------------------

help2man-makefile := $(help2man-root)/Makefile
$(help2man-makefile): | $(help2man-root)
	cd $(@D) && \
		./configure \
			--prefix=$(PREFIX)

#---------------------------------------------------------------------------------------------------

help2man := $(help2man-root)/help2man
$(help2man): $(help2man-makefile)
	cd $(@D) && \
		$(MAKE)

.PHONY: help2man
help2man: $(help2man)

__all__ += help2man

####################################################################################################

clang-root    := $(ROOT)/clang
lld-root      := $(ROOT)/lld
llvm-root     := $(ROOT)/llvm

#---------------------------------------------------------------------------------------------------

llvm-build := $(BUILD)/llvm
$(llvm-build):
	mkdir -p $@

#---------------------------------------------------------------------------------------------------

llvm-makefile := $(llvm-build)/Makefile
$(llvm-makefile): | $(llvm-build)
	cd $(@D) && \
		cmake \
			-D CMAKE_BUILD_TYPE:STRING=Release \
			-D CLANG_INCLUDE_DOCS:BOOL=OFF \
			-D CLANG_INCLUDE_TESTS:BOOL=OFF \
			-D LLVM_ENABLE_PIC:BOOL=OFF \
			-D LLVM_EXTERNAL_CLANG_SOURCE_DIR:PATH=$(clang-root) \
			-D LLVM_EXTERNAL_LLD_SOURCE_DIR:PATH=$(lld-root) \
			-D LLVM_INCLUDE_EXAMPLES:BOOL=OFF \
			-D LLVM_INCLUDE_TESTS:BOOL=OFF \
			 $(llvm-root)

#---------------------------------------------------------------------------------------------------

clang := $(llvm-build)/bin/clang
$(clang): $(llvm-build)/Makefile
	cd $(llvm-build) && $(MAKE) clang

.PHONY: clang
clang: $(clang)

__all__ += clang

#---------------------------------------------------------------------------------------------------

lld := $(llvm-build)/bin/lld
$(lld): $(llvm-build)/Makefile
	cd $(llvm-build) && $(MAKE) lld

.PHONY: lld
lld: $(lld)

__all__ += clang lld

####################################################################################################

python-root := $(ROOT)/cpython

#---------------------------------------------------------------------------------------------------

python-makefile := $(python-root)/Makefile
$(python-makefile):
	cd $(@D) && \
		./configure \
			--prefix=$(PREFIX)

#---------------------------------------------------------------------------------------------------

python := $(python-root)/python
$(python): $(python-makefile)
	cd $(@D) && $(MAKE)

.PHONY: python
python: $(python)

__all__ := python

####################################################################################################

.PHONY: all
all: $(__all__)
