# Program name
PROGNAME = war

#############################################################################
# COMPILATION SETTINGS 
#############################################################################
# C compiler 
CC = gcc
# C Compiler flags
CFLAGS = -Wall -Wextra -Wshadow -Wcast-qual -Wwrite-strings

# C++ compiler
CXX =
# C++ compiler flags
CXXFLAGS =

# Linker
LD = ld
# Linker Flags
# Examples: -lz -lm
LDFLAGS =

# Includes directories
# Example: -I../inc -I/usr/inc
INCLUDES = -I./inc

# Libraries
# Example: -lm -lssl
LIBS =

# Sources
SRCDIR = src
SRCS = $(wildcard $(SRCDIR)/*.c)

# Objects
OBJSDIR = objs
# Change to appropriate source file extension as needed
OBJS = $(SRCS:.c=.o)

#############################################################################
# BUILD SETTINGS 
#############################################################################

# Release build settings
RELEXE = $(PROGNAME)
RELOBJSDIR = $(OBJSDIR)/release
RELOBJS = $(subst $(SRCDIR), $(RELOBJSDIR), $(OBJS))
RELCFLAGS = $(CFLAGS) -O3 -DNDEBUG

# Debug setting
DBGEXE = $(PROGNAME)_DBG
DBGOBJSDIR = $(OBJSDIR)/debug
DBGOBJS = $(subst $(SRCDIR), $(DBGOBJSDIR), $(OBJS))
DBGCFLAGS = $(CFLAGS) -g3 -O0 -DDEBUG

# Internal macro symbols
#   $?      The list of prerequisites that are younger than than the target. (Cannot be used in a suffix rule.)
#   $@      Name of the current target. (If the target is a library, the this expands to the library name.)
#   $$@     Name of the current target. (Can only be used in a prerequisite list.)
#   $<      The prerequisite file name in a suffix rule.
#   $*      In a suffix rule, this expands to the root name of the file.
#   $%      Expands to a .o file if the target is a library.

# Build aliases
.PHONY: all release debug clean

all: release debug

#############################################################################
# RELEASE 
#############################################################################
release: $(shell mkdir -p $(RELOBJSDIR))
release: $(RELEXE)

$(RELEXE): $(RELOBJS)
	$(CC) $(RELCFLAGS) $(INCLUDES) -o $(RELEXE) $^

$(RELOBJSDIR)/%.o: $(SRCDIR)/%.c
	$(CC) -c $(RELCFLAGS) $(INCLUDES) -o $@ $<

#############################################################################
# DEBUG
#############################################################################
debug: $(shell mkdir -p $(DBGOBJSDIR))
debug: $(DBGEXE)

$(DBGEXE): $(DBGOBJS)
	$(CC) $(DBGCFLAGS) $(INCLUDES) -o $(DBGEXE) $^

$(DBGOBJSDIR)/%.o: $(SRCDIR)/%.c
	$(CC) -c $(DBGCFLAGS) $(INCLUDES) -o $@ $<

#############################################################################
# CLEAN
#############################################################################
clean:
	@echo Cleaning Project: $(shell pwd)
	rm -rf $(RELEXE) $(DBGEXE) $(OBJSDIR) 
