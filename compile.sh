echo "cleanup \n";
#Cleanup
rm example
rm libprint.o
rm libprint.so
rm libprint.so.1
rm libprint.so.1.0
echo "compile library";
# compile to position indipendent code

gcc -fPIC -c libprint.c
echo "link library to shared object";
# link shared objects

ld -shared -soname libprint.so.1 -o libprint.so.1.0 -lc libprint.o
echo "expand library\n";
# make link and copy to library path
ln -sf libprint.so.1.0 libprint.so.1
ln -sf libprint.so.1 libprint.so
cp libprint.so.1.0 /usr/lib/libprint.so
# export library path
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH

echo "compile example program \n";
# compile test program for external call
gcc -o example example.c -L. -lprint

