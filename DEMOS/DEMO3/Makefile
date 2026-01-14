# Compilateur Haskell et flags
GHC ?= ghc
GHCFLAGS ?= -Wall -O2

# Compilateur OCaml
OCAMLC ?= ocamlc

# Compilateur TypeScript
TSC ?= tsc
NODE ?= node

# Fichiers

BUILD_DIR = .build

OCAML_SRC = ocaml.ml
OCAML_BIN = $(BUILD_DIR)/ocaml
TS_SRC = typescript.ts
TS_BIN = $(BUILD_DIR)/typescript.js

# Point d'entrée (le fichier ne définit pas forcément `main`)
ENTRYPOINT ?= Main.example1

.PHONY:  ocaml typescript clean


ocaml: $(OCAML_BIN)
	$(OCAML_BIN)

$(OCAML_BIN): $(OCAML_SRC) | $(BUILD_DIR)
	$(OCAMLC) -o $@ $<

typescript: $(TS_BIN)
	$(NODE) $(TS_BIN)

$(TS_BIN): $(TS_SRC) | $(BUILD_DIR)
	$(TSC) --outDir $(BUILD_DIR) $<

$(BUILD_DIR):
	mkdir -p $@

clean:
	rm -rf $(BUILD_DIR)
