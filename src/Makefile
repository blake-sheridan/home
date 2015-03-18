root := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

####################################################################################################

clang-root := $(root)/clang
lld-root   := $(root)/lld
llvm-root  := $(root)/llvm

.DEFAULT_GOAL := all

####################################################################################################

build := $(root)/_build

$(build):
	mkdir $(build)

####################################################################################################

llvm-build := $(build)/llvm

$(llvm-build): | $(build)
	mkdir $(llvm-build)

####################################################################################################

llvm-makefile := $(llvm-build)/Makefile

$(llvm-makefile): | $(llvm-build)
	cd $(llvm-build) && \
		cmake \
			-D CMAKE_BUILD_TYPE:STRING=$(1)	\
			-D CLANG_INCLUDE_DOCS:BOOL=OFF \
			-D CLANG_INCLUDE_TESTS:BOOL=OFF \
			-D LLVM_ENABLE_PIC:BOOL=OFF \
			-D LLVM_EXTERNAL_CLANG_SOURCE_DIR:PATH=$(clang-root) \
			-D LLVM_EXTERNAL_LLD_SOURCE_DIR:PATH=$(lld-root) \
			-D LLVM_INCLUDE_EXAMPLES:BOOL=OFF \
			-D LLVM_INCLUDE_TESTS:BOOL=OFF \
			 $(llvm-root)

####################################################################################################

clang := $(llvm-build)/bin/clang

$(clang): $(llvm-makefile)
	cd $(llvm-build) && $(MAKE) clang

.PHONY: clang
clang: $(clang)

####################################################################################################

lld := $(llvm-build)/bin/lld

$(lld): $(llvm-makefile)
	cd $(llvm-build) && $(MAKE) lld

.PHONY: lld
lld: $(lld)

####################################################################################################

.PHONY: all
all: $(clang) $(lld)
