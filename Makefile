FOLDERS := debian-buster ubuntu-18.04 ubuntu-20.04 centos-7 centos-8 upgrade-test
RM	:= rm -f

.PHONY: $(FOLDERS) clean

all: $(FOLDERS)

$(FOLDERS):
	cd machines/$@ && vagrant up | tee ../$@.log && vagrant destroy -f

clean:
	$(RM) machines/*.log
