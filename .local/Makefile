PREFIX  := $(realpath $(dir $(firstword $(MAKEFILE_LIST))))

#---------------------------------------------------------------------------------------------------

BIN     := $(PREFIX)/bin
BUILD   := $(PREFIX)/.build
INCLUDE := $(PREFIX)/include
LIB     := $(PREFIX)/lib
SHARE   := $(PREFIX)/share
SRC     := $(PREFIX)/src

#---------------------------------------------------------------------------------------------------

.DEFAULT_GOAL := all

####################################################################################################
####################################################################################################
####################################################################################################

define target

.PHONY: $(1)
$(1): $$($(1))

__all__ += $(1)

endef

####################################################################################################
####################################################################################################
####################################################################################################

ack-source := $(SRC)/ack2

#---------------------------------------------------------------------------------------------------

# TODO:
# sudo apt-get install libfile-next-perl

$(ack-source)/Makefile:
	cd $(@D) && \
		perl \
			Makefile.PL

#---------------------------------------------------------------------------------------------------

ack := $(ack-source)/ack-standalone
$(ack): $(ack-source)/Makefile
	$(MAKE) \
		--directory=$(@D) \
		ack-standalone

$(eval $(call target,ack))

####################################################################################################

emacs-source := $(SRC)/emacs

#---------------------------------------------------------------------------------------------------

$(emacs-source)/configure:
	cd $(@D) && ./autogen.sh

#---------------------------------------------------------------------------------------------------

# TODO:
# sudo apt-get install libncurses-dev

$(emacs-source)/Makefile: $(emacs-source)/configure
	cd $(@D) && \
		./configure \
			--without-makeinfo \
			--without-x

#---------------------------------------------------------------------------------------------------

emacs := $(emacs-source)/src/emacs
$(emacs): $(emacs-source)/Makefile
	$(MAKE) \
		--directory=$(^D)

$(eval $(call target,emacs))

####################################################################################################

gcc-source := $(SRC)/gcc

#---------------------------------------------------------------------------------------------------

gcc-build := $(BUILD)/gcc
$(gcc-build):
	mkdir -p $@

#---------------------------------------------------------------------------------------------------

$(gcc-build)/Makefile: | $(gcc-build)
	cd $(@D) && \
		$(gcc-source)/configure \
		--disable-multilib

#---------------------------------------------------------------------------------------------------

# TODO:
# sudo apt-get install libmpfr-dev
# sudo apt-get install libmpc-dev
# sudo apt-get install flex

gcc := $(gcc-build)/gcc/xgcc
$(gcc): $(gcc-build)/Makefile
	$(MAKE) \
		--directory=$(^D)

$(eval $(call target,gcc))

####################################################################################################

git-source := $(SRC)/git

#---------------------------------------------------------------------------------------------------

# TODO:
# sudo apt-get install libssl-dev

$(git-source)/configure:
	$(MAKE) \
		--directory=$(@D) \
		configure

#---------------------------------------------------------------------------------------------------

$(git-source)/config.mak.autogen: $(git-source)/configure
	cd $(@D) && \
		./configure \
			--prefix=$(PREFIX) \
			--with-curl

#---------------------------------------------------------------------------------------------------

git := $(git-source)/git
$(git): $(git-source)/Makefile $(git-source)/config.mak.autogen
	$(MAKE) \
		--directory=$(^D)

$(eval $(call target,git))

####################################################################################################

help2man-version := 1.46.5

#---------------------------------------------------------------------------------------------------

help2man-source := $(SRC)/help2man-$(help2man-version)
$(help2man-source):
	wget \
		-q -O - \
		http://mirrors.syringanetworks.net/gnu/help2man/help2man-$(help2man-version).tar.xz \
	| tar \
		--directory=$(@D) \
		--file - \
		--extract \
		--xz

#---------------------------------------------------------------------------------------------------

$(help2man-source)/Makefile: | $(help2man-source)
	cd $(@D) && \
		./configure \
			--prefix=$(PREFIX)

#---------------------------------------------------------------------------------------------------

help2man := $(help2man-source)/help2man
$(help2man): $(help2man-source)/Makefile
	$(MAKE) \
		--directory=$(@D)

$(eval $(call target,help2man))

####################################################################################################

texinfo-version := 5.2

#---------------------------------------------------------------------------------------------------

texinfo-source := $(SRC)/texinfo-$(texinfo-version)
$(texinfo-source):
	wget \
		-q -O - \
		http://ftp.gnu.org/gnu/texinfo/texinfo-$(texinfo-version).tar.xz \
	| tar \
		--directory=$(@D) \
		--file - \
		--extract \
		--xz

#---------------------------------------------------------------------------------------------------

$(texinfo-source)/Makefile: | $(texinfo-source)
	cd $(@D) && \
		./configure \
			--prefix=$(PREFIX)

#---------------------------------------------------------------------------------------------------

makeinfo := $(texinfo-source)/tp/texi2any
$(makeinfo): $(texinfo-source)/Makefile
	$(MAKE) \
		--directory=$(@D)

$(eval $(call target,makeinfo))

####################################################################################################

libtool-source := $(SRC)/libtool

#---------------------------------------------------------------------------------------------------

$(libtool-source)/configure: | $(help2man) $(makeinfo)
	cd $(@D) && \
		./bootstrap

#---------------------------------------------------------------------------------------------------

$(libtool-source)/Makefile: $(libtool-source)/configure
	cd $(@D) && \
		./configure \
			--prefix=$(PREFIX)

#---------------------------------------------------------------------------------------------------

libtool := $(libtool-source)/libtool
$(libtool): $(libtool-source)/Makefile
	$(MAKE) \
		--directory=$(@D)

$(eval $(call target,libtool))

#---------------------------------------------------------------------------------------------------

libtoolize := $(libtool-source)/libtoolize
$(libtoolize): $(libtool-source)/Makefile
	$(MAKE) \
		--directory=$(@D)

$(eval $(call target,libtoolize))

####################################################################################################

gnulib-source := $(SRC)/gnulib

####################################################################################################

gettext-source := $(SRC)/gettext

#---------------------------------------------------------------------------------------------------

$(gettext-source)/configure:
	cd $(@D) && \
		GNULIB_SRCDIR=$(gnulib-source) \
		./autogen.sh

#---------------------------------------------------------------------------------------------------

$(gettext-source)/Makefile: $(gettext-source)/configure
	cd $(@D) && \
		./configure \
		--prefix=$(PREFIX)

#---------------------------------------------------------------------------------------------------

gettext-archive.dir.tar.xz := $(gettext-source)/gettext-tools/misc/archive.dir.tar.xz
$(gettext-archive.dir.tar.xz): $(gettext-source)/Makefile
	$(MAKE) \
		--directory=$(@D) \
		$(@F)

#---------------------------------------------------------------------------------------------------

autopoint := $(gettext-source)/gettext-tools/misc/autopoint
$(autopoint): $(gettext-source)/Makefile | $(gettext-archive.dir.tar.xz)
	$(MAKE) \
		--directory=$(<D) \
		autopoint

$(eval $(call target,autopoint))

####################################################################################################

clang-source := $(SRC)/clang
lld-source   := $(SRC)/lld
llvm-source  := $(SRC)/llvm

#---------------------------------------------------------------------------------------------------

llvm-build := $(BUILD)/llvm
$(llvm-build):
	mkdir -p $@

#---------------------------------------------------------------------------------------------------

# TODO:
# sudo apt-get install cmake

$(llvm-build)/Makefile: | $(llvm-build)
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
	$(MAKE) \
		--directory=$(^D)
		clang

$(eval $(call target,clang))

#---------------------------------------------------------------------------------------------------

lld := $(llvm-build)/bin/lld
$(lld): $(llvm-build)/Makefile
	$(MAKE) \
		--directory=$(^D)
		lld

$(eval $(call target,lld))

####################################################################################################

python-source := $(SRC)/cpython

#---------------------------------------------------------------------------------------------------

$(python-source)/Makefile:
	cd $(@D) && \
		./configure \
			--prefix=$(PREFIX)

#---------------------------------------------------------------------------------------------------

python := $(python-source)/python
$(python): $(python-source)/Makefile
	$(MAKE) \
		--directory=$(^D)

$(eval $(call target,python))

####################################################################################################
####################################################################################################
####################################################################################################

.PHONY: all
all: $(__all__)
