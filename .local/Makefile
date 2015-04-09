PREFIX  := $(realpath $(dir $(firstword $(MAKEFILE_LIST))))

BIN     := $(PREFIX)/bin
BUILD   := $(PREFIX)/.build
INCLUDE := $(PREFIX)/include
LIB     := $(PREFIX)/lib
SHARE   := $(PREFIX)/share
SRC     := $(PREFIX)/src

.DEFAULT_GOAL := all

####################################################################################################

define target

.PHONY: $(1)
$(1): $$($(1))

__all__ += $(1)

endef

####################################################################################################

ack-source := $(SRC)/ack2

#---------------------------------------------------------------------------------------------------

ack := $(ack-source)/ack-standalone
$(ack):
	cd $(@D) && perl Makefile.PL
	cd $(@D) && $(MAKE) ack-standalone

$(eval $(call target,ack))

####################################################################################################

emacs-source := $(SRC)/emacs

#---------------------------------------------------------------------------------------------------

emacs-configure := $(emacs-source)/configure
$(emacs-configure):
	cd $(@D) && ./autogen.sh

#---------------------------------------------------------------------------------------------------

emacs-makefile := $(emacs-source)/Makefile
$(emacs-makefile): $(emacs-configure)
	cd $(@D) && \
		$(emacs-configure) \
			--prefix=$(PREFIX) \
			--without-makeinfo \
			--without-x

#---------------------------------------------------------------------------------------------------

emacs := $(emacs-source)/src/emacs
$(emacs): $(emacs-makefile)
	cd $(@D) && $(MAKE)

$(eval $(call target,emacs))

####################################################################################################

help2man-version := 1.46.5

#---------------------------------------------------------------------------------------------------

help2man-source := $(SRC)/help2man-$(help2man-version)
$(help2man-source):
	curl \
		http://mirrors.syringanetworks.net/gnu/help2man/help2man-$(help2man-version).tar.xz \
	| tar \
		--directory=$(@D) \
		--file - \
		--extract \
		--xz

#---------------------------------------------------------------------------------------------------

help2man-makefile := $(help2man-source)/Makefile
$(help2man-makefile): | $(help2man-source)
	cd $(@D) && \
		./configure \
			--prefix=$(PREFIX)

#---------------------------------------------------------------------------------------------------

help2man := $(help2man-source)/help2man
$(help2man): $(help2man-makefile)
	cd $(@D) && \
		$(MAKE)

$(eval $(call target,help2man))

####################################################################################################

texinfo-version := 5.2

#---------------------------------------------------------------------------------------------------

texinfo-source := $(SRC)/texinfo-$(texinfo-version)
$(texinfo-source):
	curl \
		http://ftp.gnu.org/gnu/texinfo/texinfo-$(texinfo-version).tar.xz \
	| tar \
		--directory=$(@D) \
		--file - \
		--extract \
		--xz

#---------------------------------------------------------------------------------------------------

texinfo-makefile := $(texinfo-source)/Makefile
$(texinfo-makefile): | $(texinfo-source)
	cd $(@D) && \
		./configure \
			--prefix=$(PREFIX)

#---------------------------------------------------------------------------------------------------

makeinfo := $(texinfo-source)/tp/texi2any
$(makeinfo): $(texinfo-makefile)
	cd $(@D) && \
		$(MAKE)

$(eval $(call target,makeinfo))

####################################################################################################

libtool-source := $(SRC)/libtool

#---------------------------------------------------------------------------------------------------

libtool-configure := $(libtool-source)/configure
$(libtool-configure): | $(help2man) $(makeinfo)
	cd $(@D) && \
		./bootstrap

#---------------------------------------------------------------------------------------------------

libtool-makefile := $(libtool-source)/Makefile
$(libtool-makefile): $(libtool-configure)
	cd $(@D) && \
		./configure \
			--prefix=$(PREFIX)

#---------------------------------------------------------------------------------------------------

libtool := $(libtool-source)/libtool
$(libtool): $(libtool-makefile)
	cd $(@D) && \
		$(MAKE)

$(eval $(call target,libtool))

#---------------------------------------------------------------------------------------------------

libtoolize := $(libtool-source)/libtoolize
$(libtoolize): $(libtool-makefile)
	cd $(@D) && \
		$(MAKE)

$(eval $(call target,libtoolize))

####################################################################################################

clang-source := $(SRC)/clang
lld-source   := $(SRC)/lld
llvm-source  := $(SRC)/llvm

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
			-D LLVM_EXTERNAL_CLANG_SOURCE_DIR:PATH=$(clang-source) \
			-D LLVM_EXTERNAL_LLD_SOURCE_DIR:PATH=$(lld-source) \
			-D LLVM_INCLUDE_EXAMPLES:BOOL=OFF \
			-D LLVM_INCLUDE_TESTS:BOOL=OFF \
			 $(llvm-source)

#---------------------------------------------------------------------------------------------------

clang := $(llvm-build)/bin/clang
$(clang): $(llvm-build)/Makefile
	cd $(llvm-build) && $(MAKE) clang

$(eval $(call target,clang))

#---------------------------------------------------------------------------------------------------

lld := $(llvm-build)/bin/lld
$(lld): $(llvm-build)/Makefile
	cd $(llvm-build) && $(MAKE) lld

$(eval $(call target,lld))

####################################################################################################

python-source := $(SRC)/cpython

#---------------------------------------------------------------------------------------------------

python-makefile := $(python-source)/Makefile
$(python-makefile):
	cd $(@D) && \
		./configure \
			--prefix=$(PREFIX)

#---------------------------------------------------------------------------------------------------

python := $(python-source)/python
$(python): $(python-makefile)
	cd $(@D) && $(MAKE)

$(eval $(call target,python))

####################################################################################################

.PHONY: all
all: $(__all__)
