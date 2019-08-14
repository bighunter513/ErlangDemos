.PHONY: all

# targets
TARGETS=src/ 
TARGETS_REV=`echo $(TARGETS) | sed 's, ,\n,g' | tac`

all: 
	[ -d logs ] || mkdir logs
	for module in $(TARGETS); do cd $$module || exit $?;  make $@ || exit $?; cd -; done

clean:
	for module in $(TARGETS_REV); do cd $$module || exit $?; make $@ || exit $?; cd -; done

