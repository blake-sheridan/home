src := $(realpath $(dir $(firstword $(MAKEFILE_LIST))))

####################################################################################################

clang-root := $(src)/clang
lld-root   := $(src)/lld
llvm-root  := $(src)/llvm

####################################################################################################

llvm-build := $(src)/__build__/llvm

$(llvm-build):
	mkdir -p $@

####################################################################################################

$(llvm-build)/Makefile: | $(llvm-build)
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

####################################################################################################

clang := $(llvm-build)/bin/clang

$(clang): $(llvm-build)/Makefile
	cd $(llvm-build) && $(MAKE) clang

.PHONY: clang
clang: $(clang)

####################################################################################################

lld := $(llvm-build)/bin/lld

$(lld): $(llvm-build)/Makefile
	cd $(llvm-build) && $(MAKE) lld

.PHONY: lld
lld: $(lld)

####################################################################################################
