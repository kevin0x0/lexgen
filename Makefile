DEBUGINFO = -g
OPTIMIZE =
export CC = gcc
export AR = ar rcs
export ROOT_DIR = $(abspath $(shell pwd))/
export KEVFA_DIR = $(ROOT_DIR)kevfa/
export LEXGEN_DIR = $(ROOT_DIR)lexgen/
export UTILS_DIR = $(ROOT_DIR)utils/
export TEMPL_DIR = $(ROOT_DIR)template/
export CFLAGS = -Wall -Wextra -Winline -pedantic $(OPTIMIZE) $(DEBUGINFO) -I $(ROOT_DIR)
export TARGET_LEXGEN_NAME = lexgen

all : lexgen_t kevfa_t utils_t

lexgen_t : kevfa_t
	$(MAKE) -C $(LEXGEN_DIR)

kevfa_t : utils_t template_t
	$(MAKE) -C $(KEVFA_DIR)

template_t : utils_t
	$(MAKE) -C $(TEMPL_DIR)

utils_t : 
	$(MAKE) -C $(UTILS_DIR)


.PHONY: clean
clean :
	$(MAKE) -C $(UTILS_DIR) clean
	$(MAKE) -C $(LEXGEN_DIR) clean
	$(MAKE) -C $(KEVFA_DIR) clean
	$(MAKE) -C $(TEMPL_DIR) clean
