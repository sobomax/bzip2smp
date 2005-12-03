objects := bzip2smp.o note.o detectht.o bzlib.o compress.o decompress.o \
crctable.o blocksort.o huffman.o randtable.o

CFLAGS = -gstabs -W -Wall -O2 -D_FILE_OFFSET_BITS=64 -D_REENTRANT -D_GNU_SOURCE 
#-U__linux__

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

bzip2smp: $(objects)
	$(CC) -o $@ $^ -lpthread

.PHONY: clean

clean:
	rm -f $(objects) bzip2smp
