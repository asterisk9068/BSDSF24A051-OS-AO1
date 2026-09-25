# Macros
CC = gcc
CFLAGS = -Wall -g
INC = -I./include

# Variables for paths
STATIC_LIB = lib/libmyutils.a
TARGET = bin/client_static
OBJS = obj/mystrfunctions.o obj/myfilefunctions.o

# Default Target
all: $(TARGET)

# Link the main program against the static library
$(TARGET): $(STATIC_LIB) obj/main.o
	$(CC) $(CFLAGS) -o $(TARGET) obj/main.o -L./lib -lmyutils

# Create the static library using ar
$(STATIC_LIB): $(OBJS)
	ar rcs $(STATIC_LIB) $(OBJS)

# Compile object files
obj/main.o: src/main.c
	$(CC) $(CFLAGS) $(INC) -c src/main.c -o obj/main.o

obj/mystrfunctions.o: src/mystrfunctions.c
	$(CC) $(CFLAGS) $(INC) -c src/mystrfunctions.c -o obj/mystrfunctions.o

obj/myfilefunctions.o: src/myfilefunctions.c
	$(CC) $(CFLAGS) $(INC) -c src/myfilefunctions.c -o obj/myfilefunctions.o

# Clean rule
clean:
	rm -f obj/*.o bin/* lib/*
