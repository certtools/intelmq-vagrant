FOLDERS := debian-bullseye debian-bookworm ubuntu-20.04 ubuntu-22.04 upgrade-test
RM	:= rm -f

.PHONY: $(FOLDERS) clean

all: $(FOLDERS)

$(FOLDERS):
	cd machines/$@ && vagrant up | tee ../$@.log && vagrant destroy -f

clean:
	$(RM) machines/*.log
