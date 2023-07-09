SHELL = /bin/sh
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

BUILD ?= build
BIN ?= bin
DESTDIR ?= $(BUILD)/release
PREFIX ?= /usr

.PHONY: clean rpm

all: pdf

pdf: $(BIN)/resume.pdf

$(BIN)/resume.pdf: $(BUILD)/main.pdf
	mkdir -p $(BIN)
	cp $(BUILD)/main.pdf $(BIN)/resume.pdf

$(BUILD)/main.pdf: src/main.tex
	mkdir -p $(BUILD)
	xelatex --output-directory=$(BUILD) $< > /dev/null

install: $(BIN)/resume.pdf
	install -m 0755 -d $(DESTDIR)$(PREFIX)/bin
	install -m 0755 src/bin/bpbeatty-resume $(DESTDIR)$(PREFIX)/bin
	install -m 0755 -d $(DESTDIR)$(PREFIX)/share/bpbeatty
	install -m 0755 $< $(DESTDIR)$(PREFIX)/share/bpbeatty/resume.pdf

rpm:
	mkdir -p $(BUILD) $(BIN)
	ls -la
	rpkg local --spec bpbeatty-resume.rpkg.spec --outdir $(ROOT_DIR)/$(BUILD)
	cp $(BUILD)/noarch/*.rpm $(BIN)

clean:
	rm -rf $(BUILD)
	rm -rf $(BIN)
