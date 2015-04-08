SRC := $(realpath $(dir $(firstword $(MAKEFILE_LIST))))

PREFIX := $(realpath $(SRC)/..)
BUILD := $(SRC)/build

.DEFAULT_GOAL := all

####################################################################################################

ack-root := $(SRC)/ack2
ack      := $(ack-root)/ack-standalone

$(ack):
	cd $(@D) && perl Makefile.PL
	cd $(@D) && $(MAKE) ack-standalone

.PHONY: ack
ack: $(ack)

__all__ += ack

####################################################################################################

emacs-root      := $(SRC)/emacs
emacs-configure := $(emacs-root)/configure
emacs-makefile  := $(emacs-root)/Makefile
emacs           := $(emacs-root)/src/emacs

$(emacs-configure):
	cd $(@D) && ./autogen.sh

$(emacs-makefile): $(emacs-configure)
	cd $(@D) && \
		$(emacs-configure) \
			--prefix=$(PREFIX) \
			--without-makeinfo \
			--without-x

$(emacs): $(emacs-makefile)
	cd $(@D) && $(MAKE)

.PHONY: emacs
emacs: $(emacs)

__all__ += emacs

####################################################################################################

llvm-root     := $(SRC)/llvm
llvm-build    := $(BUILD)/llvm
llvm-makefile := $(llvm-build)/Makefile

clang-root    := $(SRC)/clang
clang         := $(llvm-build)/bin/clang

lld-root      := $(SRC)/lld
lld           := $(llvm-build)/bin/lld

$(llvm-build):
	mkdir -p $@

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

$(clang): $(llvm-build)/Makefile
	cd $(llvm-build) && $(MAKE) clang

$(lld): $(llvm-build)/Makefile
	cd $(llvm-build) && $(MAKE) lld

.PHONY: clang
clang: $(clang)

.PHONY: lld
lld: $(lld)

__all__ += clang lld

####################################################################################################

python-root     := $(SRC)/cpython
python-makefile := $(python-root)/Makefile
python          := $(python-root)/python

$(python-makefile):
	cd $(@D) && \
		./configure \
			--prefix=$(PREFIX)

$(python): $(python-makefile)
	cd $(@D) && $(MAKE)

__all__ := $(python)

####################################################################################################

.PHONY: all
all: $(__all__)
