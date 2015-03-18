.DEFAULT_GOAL := all

####################################################################################################

ack := ack2/ack-standalone

$(ack):
	cd $(@D) && perl Makefile.PL
	cd $(@D) && $(MAKE) ack-standalone

.PHONY: ack
ack: $(ack)

__all__ += ack

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
