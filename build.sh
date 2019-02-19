#!/bin/bash

PATH_AFL=/home/cznic/data/src/fuzz_test/afl-2.52b

SANITIZER_VARS=	-DCMAKE_CXX_FLAGS="-fsanitize=address  -fsanitize=leak -g" \
		-DCMAKE_C_FLAGS="-fsanitize=address  -fsanitize=leak -g -fsanitize-recover=address" \
		-DCMAKE_EXE_LINKER_FLAGS="-fsanitize=address  -fsanitize=leak" \
		-DCMAKE_MODULE_LINKER_FLAGS="-fsanitize=address  -fsanitize=leak"


compile_pkg() {

	if [ -z "$1" ]; then
		cmake -DCMAKE_C_COMPILER=$PATH_AFL/afl-gcc .
	else
		cmake -DCMAKE_C_COMPILER=$PATH_AFL/afl-gcc $SANITIZER_VARS .
	fi
}

clean_pkg() {
	find . -name CMakeFiles
	find . -name CMakeCache.txt
}


print_help() {
	echo "Help:"
}

case "$1" in
"compile")
	compile_pkg
    	;;
"compile_asan")
	compile_pkg "asan"
    	;;
"clean")
	clean_pkg
	;;
*)
	print_help
    ;;
esac
