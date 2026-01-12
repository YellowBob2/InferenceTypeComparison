// https://www.cppreference.com/w/cpp/language/auto.html


// Inférence en C++ avec auto
// auto est un placeholder de type, il indique juste au compilateur de déduire le type. ça signifie notamment que le 
// type doit être un type concret à la compilation. 

#include <vector>
#include <iostream>
#include <typeinfo>

int f(int x) {
    return x + 1;
}

double f(double x) {
    return x + 0.5;
}

template<typename T>
T add(T a, T b) {
    return a + b;
}

int g(int x){
    return x;
}
std::string g(std::string x){
    return x;
}

int h(double x){
    return x;
}

int main() {

    // ========= Exemple d'inférence de type avec auto =========== //
    // x est inféré comme un int car on lui assigne une constante int
    auto x = 42;          // int
    std::cout << typeid(x).name() << std::endl;
    // y est inféré comme un double car on lui assigne une constante double
    auto y = 3.14;        // double
    std::cout << typeid(y).name() << std::endl;


    // Au sein de la boucle for, elem est inféré comme un int car v est un std::vector<int>
    std::vector<int> v = {1, 2, 3};
    for (auto elem : v) { // elem est un int
        std::cout << elem << std::endl;
    }

    // Exemple d'appel de fonctions surchargées avec auto
    auto a = f(3);    // appelle f(int)
    auto b = f(3.0);  // appelle f(double)
    std::cout << typeid(a).name() << std::endl;
    std::cout << typeid(b).name() << std::endl;

    // Exemple d'utilisation de templates avec auto
    auto c = add(1, 2);       // T = int
    auto d = add(1.5, 2.5);   // T = double
    std::cout << typeid(c).name() << std::endl;
    std::cout << typeid(d).name() << std::endl;



    // Limite de l'inférence avec auto 
    int x1 = 10;
    int& r1 = x1;

    auto a1 = r1;      // a est un int (copie)

    a1 = 20;
    std::cout << typeid(a1).name() << std::endl;
    std::cout << x1 << std::endl;  // affiche 10

    auto y1 = g(3);
    h(y1);
    std::cout << typeid(y1).name() << std::endl;
}

auto f(bool b) {
    if (b)
        return 1;
    else
        return 2.5;
}