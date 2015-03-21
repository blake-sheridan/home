ROOT  := $(realpath $(dir $(firstword $(MAKEFILE_LIST))))
BUILD := $(ROOT)/build

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

llvm-root     := $(ROOT)/llvm
llvm-build    := $(BUILD)/llvm
llvm-makefile := $(llvm-build)/Makefile

clang-root    := $(ROOT)/clang
clang         := $(llvm-build)/bin/clang

lld-root      := $(ROOT)/lld
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

.PHONY: all
all: $(__all__)
