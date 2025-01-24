PRJ_NAME=jb

BINDIR=./bin
INCDIR=./include
SRCDIR=./src
OBJDIR=./obj

C_SOURCE=$(wildcard $(SRCDIR)/*.c)
O_SOURCE=$(addprefix $(OBJDIR)/, $(notdir $(C_SOURCE:.c=.o)))

CC=gcc
CC_FLAGS=	-Wextra		\
			-Wall		\
			-ansi		\
			-pedantic	\

CC_LIBS=	-I$(INCDIR) \
			-lssl		\
			-lcrypto

.PHONY: all
all: $(BINDIR)/$(PRJ_NAME)

$(BINDIR)/$(PRJ_NAME): $(O_SOURCE)
	$(CC) -o $@ $^ $(CC_FLAGS) $(CC_LIBS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c 
	$(CC) -o $@ $^ $(CC_FLAGS) $(CC_LIBS) -c

.PHONY: var
var:
	@echo "PRJ_NAME : $(PRJ_NAME)"
	@echo "BINDIR   : $(BINDIR)"
	@echo "INCDIR   : $(INCDIR)"
	@echo "SRCDIR   : $(SRCDIR)"
	@echo "OBJDIR   : $(OBJDIR)"
	@echo "C_SOURCE : $(C_SOURCE)"
	@echo "O_SOURCE : $(O_SOURCE)"
	@echo "CC       : $(CC)"
	@echo "CC_FLAGS : $(CC_FLAGS)"
	@echo "CC_LIBS  : $(CC_LIBS)"

.PHONY: clean
clean:
	rm -rf $(OBJDIR)/* $(BINDIR)/*
