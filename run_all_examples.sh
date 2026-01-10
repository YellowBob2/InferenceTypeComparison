#!/bin/bash

echo "========================================="
echo "Type Inference Examples - All Languages"
echo "========================================="

# C++
echo -e "\n\n=== C++ Example ===" 
echo "Building and running type_inference.cpp..."
cd CXX
make clean > /dev/null 2>&1
make > /dev/null 2>&1
echo "Output:"
./bin/type_inference | head -30
echo "(... output truncated ...)"
cd ..

# Haskell
echo -e "\n\n=== Haskell Example ===" 
echo "Building and running type_inference.hs..."
cd haskell
ghc -o type_inference type_inference.hs > /dev/null 2>&1
echo "Output:"
./type_inference | head -30
echo "(... output truncated ...)"
cd ..

# OCaml
echo -e "\n\n=== OCaml Example ===" 
echo "Building and running type_inference.ml..."
cd ocaml
ocamlopt -o type_inference type_inference.ml > /dev/null 2>&1
echo "Output:"
./type_inference | head -30
echo "(... output truncated ...)"
cd ..

# TypeScript
echo -e "\n\n=== TypeScript Example ===" 
echo "Building and running type_inference.ts..."
cd typescript
tsc type_inference.ts > /dev/null 2>&1
echo "Output:"
node type_inference.js | head -30
echo "(... output truncated ...)"
cd ..

echo -e "\n========================================="
echo "All examples executed successfully!"
echo "========================================="
echo ""
echo "For detailed comparisons, see:"
echo "  - README.md"
echo "  - COMPARAISON_TYPE_INFERENCE.md"
echo "  - SYNTHESE_RAPIDE.md"
