#!/bin/bash

PATH_AFL=/home/....../afl-2.52b
SANITIZER_VARS=	-DCMAKE_CXX_FLAGS="-fsanitize=address  -fsanitize=leak -g" \
		-DCMAKE_C_FLAGS="-fsanitize=address  -fsanitize=leak -g" \
		-DCMAKE_EXE_LINKER_FLAGS="-fsanitize=address  -fsanitize=leak" \
		-DCMAKE_MODULE_LINKER_FLAGS="-fsanitize=address  -fsanitize=leak"



cmake -DCMAKE_C_COMPILER=$PATH_AFL/afl-gcc $SANITIZER_VARS .

