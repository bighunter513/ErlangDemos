.PHONY: all clean install

# rules
%.beam: %.erl
	erlc -o $(TAR_DIR) +debug_info -W2 -Werror $<

# objects
MODULES = .

ALL_SRC = $(foreach dir, $(MODULES), $(wildcard $(dir)/*.erl))
ALL_OBJ = $(ALL_SRC:.erl=.beam)
TAR_DIR = ../ebin/

# dependence
all: clean $(ALL_OBJ) 
	
clean: 
	rm -rf $(TAR_DIR)/*.beam
