#include <iostream>
#include <vector>
#include <memory>

// === 1. Inférence de type avec auto ===
// En C++, auto déduit le type à la compilation
void example_auto() {
    std::cout << "\n=== 1. AUTO (Type Deduction) ===" << std::endl;
    
    auto x = 42;              // x est int
    auto y = 3.14;            // y est double
    auto z = "Hello";         // z est const char*
    auto v = std::vector<int>{1, 2, 3}; // v est vector<int>
    
    std::cout << "x (auto) = " << x << std::endl;
    std::cout << "y (auto) = " << y << std::endl;
}

// === 2. Surcharge de fonctions ===
// C++ résout la surcharge à la compilation
void print(int x) {
    std::cout << "Integer: " << x << std::endl;
}

void print(double x) {
    std::cout << "Double: " << x << std::endl;
}

void print(const std::string& x) {
    std::cout << "String: " << x << std::endl;
}

void example_overloading() {
    std::cout << "\n=== 2. OVERLOADING (Compile-time resolution) ===" << std::endl;
    
    print(42);           // appelle print(int)
    print(3.14);         // appelle print(double)
    print("Hello");      // appelle print(const string&)
}

// === 3. Templates et déduction de type ===
// Les templates déduisent les types automatiquement
template<typename T>
T max_value(T a, T b) {
    return (a > b) ? a : b;
}

// Template avec plusieurs paramètres
template<typename T, typename U>
auto add(T a, U b) -> decltype(a + b) {
    return a + b;
}

void example_templates() {
    std::cout << "\n=== 3. TEMPLATES (Generic Programming) ===" << std::endl;
    
    std::cout << "max(5, 10) = " << max_value(5, 10) << std::endl;
    std::cout << "max(3.5, 2.1) = " << max_value(3.5, 2.1) << std::endl;
    
    auto result1 = add(5, 3);          // int + int
    auto result2 = add(5.5, 2);        // double + int
    
    std::cout << "add(5, 3) = " << result1 << std::endl;
    std::cout << "add(5.5, 2) = " << result2 << std::endl;
}

// === 4. Polymorphisme avec classes (Runtime) ===
class Shape {
public:
    virtual ~Shape() = default;
    virtual void display() const = 0;
};

class Circle : public Shape {
private:
    double radius;
public:
    Circle(double r) : radius(r) {}
    void display() const override {
        std::cout << "Circle with radius: " << radius << std::endl;
    }
};

class Rectangle : public Shape {
private:
    double width, height;
public:
    Rectangle(double w, double h) : width(w), height(h) {}
    void display() const override {
        std::cout << "Rectangle " << width << "x" << height << std::endl;
    }
};

void example_polymorphism() {
    std::cout << "\n=== 4. POLYMORPHISM (Runtime) ===" << std::endl;
    
    std::vector<std::shared_ptr<Shape>> shapes;
    shapes.push_back(std::make_shared<Circle>(5.0));
    shapes.push_back(std::make_shared<Rectangle>(4.0, 6.0));
    
    for (const auto& shape : shapes) {
        shape->display();
    }
}

// === 5. Déduction de type avec decltype ===
void example_decltype() {
    std::cout << "\n=== 5. DECLTYPE (Type Inspection) ===" << std::endl;
    
    int x = 5;
    double y = 3.14;
    
    decltype(x) z = 10;           // z est int
    decltype(x + y) result = x + y; // result est double
    
    std::cout << "z = " << z << ", result = " << result << std::endl;
}

int main() {
    std::cout << "=== C++ Type Inference Examples ===" << std::endl;
    
    example_auto();
    example_overloading();
    example_templates();
    example_polymorphism();
    example_decltype();
    
    std::cout << "\n=== Key Points ===" << std::endl;
    std::cout << "1. auto: Compile-time type deduction" << std::endl;
    std::cout << "2. Overloading: Resolved at compile-time" << std::endl;
    std::cout << "3. Templates: Compile-time generics" << std::endl;
    std::cout << "4. Polymorphism: Runtime type-based dispatch" << std::endl;
    std::cout << "5. decltype: Infer types of expressions" << std::endl;
    
    return 0;
}
