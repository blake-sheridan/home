ROOT := $(realpath $(dir $(firstword $(MAKEFILE_LIST))))

#---------------------------------------------------------------------------------------------------

PREFIX := $(ROOT)
BUILD  := $(ROOT)/.build
SRC    := $(ROOT)/src

#---------------------------------------------------------------------------------------------------

.PHONY: all
all: ack clang emacs git python

####################################################################################################
# ack

_ := $(SRC)/ack2

# TODO:
# sudo apt-get install libfile-next-perl

$(_)/Makefile:
	cd $(@D) && \
		perl \
			Makefile.PL

ack := $(_)/ack-standalone
$(ack): $(_)/Makefile
	$(MAKE) \
		--directory=$(<D) \
		ack-standalone

.PHONY: ack
ack: $(ack)

####################################################################################################
# emacs

_ := $(SRC)/emacs

$(_)/configure:
	cd $(@D) && \
		./autogen.sh

# TODO:
# sudo apt-get install libncurses-dev

$(_)/Makefile: $(_)/configure
	cd $(@D) && \
		./configure \
			--without-makeinfo \
			--without-x

emacs := $(_)/src/emacs
$(emacs): $(_)/Makefile
	$(MAKE) \
		--directory=$(<D)

.PHONY: emacs
emacs: $(emacs)

####################################################################################################
# gcc

_ := $(BUILD)/gcc
$(_):
	mkdir -p $@

$(_)/Makefile: | $(_)
	cd $(@D) && \
		$(SRC)/gcc/configure \
		--disable-multilib

# TODO:
# sudo apt-get install libmpfr-dev
# sudo apt-get install libmpc-dev
# sudo apt-get install flex

gcc := $(_)/gcc/xgcc
$(gcc): $(_)/Makefile
	$(MAKE) \
		--directory=$(<D)

.PHONY: gcc
gcc: $(gcc)

####################################################################################################
# git

_ := $(SRC)/git

# TODO:
# sudo apt-get install libssl-dev

$(_)/configure:
	$(MAKE) \
		--directory=$(@D) \
		configure

$(_)/config.mak.autogen: $(_)/configure
	cd $(@D) && \
		./configure \
			--prefix=$(PREFIX) \
			--with-curl

git := $(_)/git
$(git): $(_)/Makefile $(_)/config.mak.autogen
	$(MAKE) \
		--directory=$(<D)

.PHONY: git
git: $(git)

####################################################################################################
# help2man

_ := $(SRC)/help2man-1.46.5

$(_):
	wget \
		-q -O - \
		http://mirrors.syringanetworks.net/gnu/help2man/$(@F).tar.xz \
	| tar \
		--directory=$(@D) \
		--file - \
		--extract \
		--xz

$(_)/Makefile: | $(_)
	cd $(@D) && \
		./configure \
			--prefix=$(PREFIX)

help2man := $(_)/help2man
$(help2man): $(_)/Makefile
	$(MAKE) \
		--directory=$(<D)

####################################################################################################
# texinfo (makeinfo)

_ := $(SRC)/texinfo-5.2

$(_):
	wget \
		-q -O - \
		http://ftp.gnu.org/gnu/texinfo/$(@F).tar.xz \
	| tar \
		--directory=$(@D) \
		--file - \
		--extract \
		--xz

$(_)/Makefile: | $(_)
	cd $(@D) && \
		./configure \
			--prefix=$(PREFIX)

makeinfo := $(_)/tp/texi2any
$(makeinfo): $(_)/Makefile
	$(MAKE) \
		--directory=$(<D)

####################################################################################################
# libtool

_ := $(SRC)/libtool

$(_)/configure: | $(help2man) $(makeinfo)
	cd $(@D) && \
		./bootstrap

$(_)/Makefile: $(_)/configure
	cd $(@D) && \
		./configure \
			--prefix=$(PREFIX)

libtool := $(_)/libtool
$(libtool): $(_)/Makefile
	$(MAKE) \
		--directory=$(<D)

libtoolize := $(_)/libtoolize
$(libtoolize): $(_)/Makefile
	$(MAKE) \
		--directory=$(<D)

####################################################################################################
# gettext

_ := $(SRC)/gettext

$(_)/configure:
	cd $(@D) && \
		GNULIB_SRCDIR=$(SRC)/gnulib \
		./autogen.sh

$(_)/Makefile: $(_)/configure
	cd $(@D) && \
		./configure \
		--prefix=$(PREFIX)

gettext-archive.dir.tar.xz := $(_)/gettext-tools/misc/archive.dir.tar.xz
$(gettext-archive.dir.tar.xz): $(_)/Makefile
	$(MAKE) \
		--directory=$(<D) \
		$(@F)

autopoint := $(_)/gettext-tools/misc/autopoint
$(autopoint): $(_)/Makefile | $(gettext-archive.dir.tar.xz)
	$(MAKE) \
		--directory=$(<D) \
		autopoint

####################################################################################################
# clang/lld

_ := $(BUILD)/llvm

$(_):
	mkdir -p $@

# TODO:
# sudo apt-get install cmake

$(_)/Makefile: | $(_)
	cd $(@D) && \
		cmake \
			-D CMAKE_BUILD_TYPE:STRING=Release \
			-D CLANG_INCLUDE_DOCS:BOOL=OFF \
			-D CLANG_INCLUDE_TESTS:BOOL=OFF \
			-D LLVM_ENABLE_PIC:BOOL=OFF \
			-D LLVM_EXTERNAL_CLANG_SOURCE_DIR:PATH=$(SRC)/clang \
			-D LLVM_EXTERNAL_LLD_SOURCE_DIR:PATH=$(SRC)/lld \
			-D LLVM_INCLUDE_EXAMPLES:BOOL=OFF \
			-D LLVM_INCLUDE_TESTS:BOOL=OFF \
			 $(SRC)/llvm

clang := $(_)/bin/clang
$(clang): $(_)/Makefile
	$(MAKE) \
		--directory=$(<D)
		clang

.PHONY: clang
clang: $(clang)

lld := $(_)/bin/lld
$(lld): $(_)/Makefile
	$(MAKE) \
		--directory=$(<D)
		lld

.PHONY: lld
lld: $(lld)

####################################################################################################
# python

_ := $(SRC)/cpython

$(_)/Makefile:
	cd $(@D) && \
		./configure \
			--prefix=$(PREFIX)

python := $(_)/python
$(python): $(_)/Makefile
	$(MAKE) \
		--directory=$(<D)

.PHONY: python
python: $(python)
