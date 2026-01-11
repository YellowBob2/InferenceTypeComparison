# Compilateur Haskell et flags
GHC ?= ghc
GHCFLAGS ?= -Wall -O2

# Fichiers
SRC = haskell.hs
BUILD_DIR = .build
BIN = $(BUILD_DIR)/haskell

# Point d'entrée (le fichier ne définit pas forcément `main`)
ENTRYPOINT ?= Main.example1

.PHONY: haskell clean

haskell: $(BIN)
	$(BIN)

$(BIN): $(SRC) | $(BUILD_DIR)
	$(GHC) $(GHCFLAGS) -main-is $(ENTRYPOINT) -odir $(BUILD_DIR) -hidir $(BUILD_DIR) -o $@ $<

$(BUILD_DIR):
	mkdir -p $@

clean:
	rm -rf $(BUILD_DIR)
