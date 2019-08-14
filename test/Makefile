.PHONY: all clean depend install

# rules
%.beam: %.erl
	erlc -o $(TAR_DIR) -W2 -Werror $<

# objects
MODULES = . udp_echo udp_server

ALL_SRC = $(foreach dir, $(MODULES), $(wildcard $(dir)/*.erl))
ALL_OBJ = $(ALL_SRC:.erl=.beam)
TAR_DIR = ./ebin/

# dependence
all: depend clean $(ALL_OBJ) 

depend:
	[ -d ebin ] || mkdir ebin

clean: 
	rm -rf $(TAR_DIR)/*.beam
