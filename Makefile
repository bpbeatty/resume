SHELL = /bin/sh

BUILD ?= build
BIN ?= bin
DESTDIR ?= $(BUILD)/release
PREFIX ?= /usr

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

clean:
	rm -rf $(BUILD)
	rm -rf $(BIN)
