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

// int main() {

//     // ========= Exemple d'inférence de type avec auto =========== //
//     // x est inféré comme un int car on lui assigne une constante int
//     auto x = 42;          // int
//     std::cout << typeid(x).name() << std::endl;
//     // y est inféré comme un double car on lui assigne une constante double
//     auto y = 3.14;        // double
//     std::cout << typeid(y).name() << std::endl;


//     // Au sein de la boucle for, elem est inféré comme un int car v est un std::vector<int>
//     std::vector<int> v = {1, 2, 3};
//     for (auto elem : v) { // elem est un int
//         std::cout << elem << std::endl;
//     }

//     // Exemple d'appel de fonctions surchargées avec auto
//     auto a = f(3);    // appelle f(int)
//     auto b = f(3.0);  // appelle f(double)
//     std::cout << typeid(a).name() << std::endl;
//     std::cout << typeid(b).name() << std::endl;

//     // Exemple d'utilisation de templates avec auto
//     auto c = add(1, 2);       // T = int
//     auto d = add(1.5, 2.5);   // T = double
//     std::cout << typeid(c).name() << std::endl;
//     std::cout << typeid(d).name() << std::endl;



//     // ========= Limite d'inférence de type avec auto =========== //
//     // Auto ne conserve pas les références ou les modificateurs de type (? à vérifier)
//     // Ici si on explicite le type de a1 comme int&, x1 vaut bien 20 à la fin alors qu'ici il reste à 10. 
//     int x1 = 10;
//     int& r1 = x1;

//     auto a1 = r1;      // a est un int (copie)

//     a1 = 20;
//     std::cout << typeid(a1).name() << std::endl;
//     std::cout << x1 << std::endl;  // affiche 10

//     auto y1 = g(3);
//     h(y1);
//     std::cout << typeid(y1).name() << std::endl;
// }

// auto ne peut pas déduire un type unique si les branches retournent des types différents, même si ceux-ci sont compatibles et pourraient être convertis.
// Ici, si on remplace auto par float, il n'y a plus d'erreurs. Auto est vraiment une inférence très basique. 
// auto f(bool b) {
//     if (b)
//         return 1.5;
//     else
//         return 2;
// }


class Animal {
public:
    virtual void speak() const {
        std::cout << "Animal\n";
    }

    virtual ~Animal() = default;
};

class Dog : public Animal {
public:
    void speak() const override {
        std::cout << "Dog\n";
    }
};

class Cat : public Animal {
public:
    void speak() const override {
        std::cout << "Cat\n";
    }
};


// Infère le premier type de retour trouvé pour la fonction, et c'est tout. Ne cherche pas de compatibilité si jamais une incohérence est trouvée plus tard. 

// auto makeAnimal(bool isDog) {
//     if (isDog)
//         return Dog{};
//     else
//         return Cat{};
// }
