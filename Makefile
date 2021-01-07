FOLDERS := $(shell ls | grep -v 'Makefile\|ansible\|.log')
RM	:= rm -f

.PHONY: $(FOLDERS) clean

all: $(FOLDERS)

$(FOLDERS):
	cd $@ && vagrant up | tee ../$@.log && vagrant destroy -f

clean:
	$(RM) *.log
