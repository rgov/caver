NINJA := $(shell command -v ninja 2>/dev/null)
ifdef NINJA
	GENERATOR := "Ninja"
else
	GENERATOR := "Unix Makefiles"
endif

caver: | build
	cd build && cmake --build .

build:
	mkdir build
	cd build && cmake -G "$(GENERATOR)" \
		-DCMAKE_BUILD_TYPE=Release \
		-DLLVM_TARGETS_TO_BUILD=host \
		../src/llvm

test:
	(cd build && cmake --build . --target check-cver)
	(cd build && cmake --build . --target check-clang-cver)

clean:
	@rm -Rf build

.PHONY: caver test clean
