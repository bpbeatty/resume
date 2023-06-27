ifndef BUILD
	BUILD=build
	BIN=bin
endif

.PHONY: clean

all: pdf

pdf: $(BIN)/main.pdf

$(BIN)/main.pdf: $(BUILD)/main.pdf
	mkdir -p $(BIN)
	cp $(BUILD)/main.pdf $(BIN)/main.pdf

$(BUILD)/main.pdf:
	mkdir -p $(BUILD)
	xelatex --output-directory=$(BUILD) src/main.tex

clean:
	rm -rf $(BIN)
	rm -rf $(BUILD)
