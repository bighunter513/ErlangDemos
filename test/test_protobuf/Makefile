.PHONY: all clean depend install

# rules
%.beam: %.erl
	erlc -o $(TAR_DIR) -W2 -Werror $<

# objects
MODULES = src

ALL_SRC = $(foreach dir, $(MODULES), $(wildcard $(dir)/*.erl))
ALL_OBJ = $(ALL_SRC:.erl=.beam)
TAR_DIR = ./ebin/


# dependence
all: depend $(ALL_OBJ) cpp_benchmark

cpp_benchmark: 
	echo "make cpp"
	cd cpp && make && cd -

depend:
	[ -d ebin ] || mkdir ebin

clean: 
	rm -rf $(TAR_DIR)/*.beam
