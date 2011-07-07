rm libprint.so
rm libprint.so.1

rm libprint.o
rm example
#clean up

gcc -fPIC -c libprint.c
# compile to position indipendent code

ld -shared -soname libprint.so.1 -o libprint.so.1.0 -lc libprint.o
# link shared object
ln -sf libprint.so.1.0 libprint.so.1
ln -sf libprint.so.1 libprint.so
cp libprint.so.1.0 /usr/lib/

# make link for library
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH


gcc -o example example.c -L. -lprint
# compile test program for external call

