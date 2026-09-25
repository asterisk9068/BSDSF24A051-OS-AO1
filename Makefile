# Macros
CC = gcc
CFLAGS = -Wall -g -fPIC
INC = -I./include

# Paths
LIB_DIR = lib
BIN_DIR = bin
OBJ_DIR = obj

OBJS = $(OBJ_DIR)/mystrfunctions.o $(OBJ_DIR)/myfilefunctions.o
DYNAMIC_LIB = $(LIB_DIR)/libmyutils.so
TARGET_DYNAMIC = $(BIN_DIR)/client_dynamic

# Default Target
all: $(TARGET_DYNAMIC)

# Link executable against the dynamic library
$(TARGET_DYNAMIC): $(DYNAMIC_LIB) $(OBJ_DIR)/main.o
	$(CC) $(CFLAGS) -o $(TARGET_DYNAMIC) $(OBJ_DIR)/main.o -L$(LIB_DIR) -lmyutils

# Create the dynamic library using -shared
$(DYNAMIC_LIB): $(OBJS)
	$(CC) -shared -o $(DYNAMIC_LIB) $(OBJS)

# Compile objects
$(OBJ_DIR)/main.o: src/main.c
	$(CC) $(CFLAGS) $(INC) -c src/main.c -o $(OBJ_DIR)/main.o

$(OBJ_DIR)/mystrfunctions.o: src/mystrfunctions.c
	$(CC) $(CFLAGS) $(INC) -c src/mystrfunctions.c -o $(OBJ_DIR)/mystrfunctions.o

$(OBJ_DIR)/myfilefunctions.o: src/myfilefunctions.c
	$(CC) $(CFLAGS) $(INC) -c src/myfilefunctions.c -o $(OBJ_DIR)/myfilefunctions.o

# Clean rule
clean:
	rm -f $(OBJ_DIR)/*.o $(BIN_DIR)/* $(LIB_DIR)/*
# Installation variables
PREFIX = /usr/local
MAN_DIR = $(PREFIX)/share/man/man3
BIN_DIR_SYS = $(PREFIX)/bin

# Install rule
install: $(TARGET_DYNAMIC)
	mkdir -p $(BIN_DIR_SYS)
	mkdir -p $(MAN_DIR)
	cp $(TARGET_DYNAMIC) $(BIN_DIR_SYS)/client_dynamic
	chmod 755 $(BIN_DIR_SYS)/client_dynamic
	cp lib/libmyutils.so $(PREFIX)/lib/
	chmod 755 $(PREFIX)/lib/libmyutils.so
	cp man/man3/mystrfunctions.3 $(MAN_DIR)/
	chmod 644 $(MAN_DIR)/mystrfunctions.3
	ldconfig
