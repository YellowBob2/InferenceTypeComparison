# Compilateur Haskell et flags
GHC ?= ghc
GHCFLAGS ?= -Wall -O2

# Compilateur OCaml
OCAMLC ?= ocamlc

# Fichiers
SRC = haskell.hs
BUILD_DIR = .build
BIN = $(BUILD_DIR)/haskell
OCAML_SRC = ocaml.ml
OCAML_BIN = $(BUILD_DIR)/ocaml

# Point d'entrée (le fichier ne définit pas forcément `main`)
ENTRYPOINT ?= Main.example1

.PHONY: haskell ocaml clean

haskell: $(BIN)
	$(BIN)

$(BIN): $(SRC) | $(BUILD_DIR)
	$(GHC) $(GHCFLAGS) -main-is $(ENTRYPOINT) -odir $(BUILD_DIR) -hidir $(BUILD_DIR) -o $@ $<

ocaml: $(OCAML_BIN)
	$(OCAML_BIN)

$(OCAML_BIN): $(OCAML_SRC) | $(BUILD_DIR)
	$(OCAMLC) -o $@ $<

$(BUILD_DIR):
	mkdir -p $@

clean:
	rm -rf $(BUILD_DIR)
