# fuzz

make package/bind/{clean,compile} V=s 2>&1 | tee build.log | grep -i memset
