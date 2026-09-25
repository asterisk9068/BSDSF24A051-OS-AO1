# Macros
CC = gcc
CFLAGS = -Wall -g
INC = -I./include

OBJS = obj/main.o obj/mystrfunctions.o obj/myfilefunctions.o
TARGET = bin/client

# Default target
all: $(TARGET)

# Link object files to create executable
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

# Compile source files into object files
obj/main.o: src/main.c
	$(CC) $(CFLAGS) $(INC) -c src/main.c -o obj/main.o

obj/mystrfunctions.o: src/mystrfunctions.c
	$(CC) $(CFLAGS) $(INC) -c src/mystrfunctions.c -o obj/mystrfunctions.o

obj/myfilefunctions.o: src/myfilefunctions.c
	$(CC) $(CFLAGS) $(INC) -c src/myfilefunctions.c -o obj/myfilefunctions.o

# Clean rule
clean:
	rm -f obj/*.o bin/client

