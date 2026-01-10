# Compilateur et flags
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
LDFLAGS = 

# Répertoires
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

# Fichiers source et objets
SOURCES = $(wildcard $(SRC_DIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)
TARGETS = $(BIN_DIR)/hello $(BIN_DIR)/type_inference

# Règles
.PHONY: all clean run

all: $(TARGETS)

$(BIN_DIR)/hello: $(OBJ_DIR)/hello.o | $(BIN_DIR)
	$(CXX) $(LDFLAGS) -o $@ $^

$(BIN_DIR)/type_inference: $(OBJ_DIR)/type_inference.o | $(BIN_DIR)
	$(CXX) $(LDFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJ_DIR) $(BIN_DIR):
	mkdir -p $@

run: $(BIN_DIR)/hello
	./$(BIN_DIR)/hello

run-type-inference: $(BIN_DIR)/type_inference
	./$(BIN_DIR)/type_inference

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)

.PHONY: all clean run
