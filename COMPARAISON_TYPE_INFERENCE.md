# Comparaison de l'Inférence de Type dans 4 Langages

## Vue d'ensemble

Ce projet illustre comment l'inférence de type est gérée différemment dans quatre langages modernes :
- **C++** : Inférence compile-time avec templates et polymorphisme
- **Haskell** : Hindley-Milner avec typeclasses et immutabilité
- **OCaml** : Inférence stricte avec modules et classes
- **TypeScript** : Inférence graduelle avec types génériques et OOP

---

## 1. C++ - Type Deduction et Templates

### Caractéristiques principales :

- **`auto` keyword** : Déduit le type à la compilation
  ```cpp
  auto x = 42;        // int
  auto y = 3.14;      // double
  ```

- **Overloading au compile-time** : Plusieurs signatures, résolution à la compilation
  ```cpp
  void print(int x);
  void print(double x);
  void print(const string& x);
  ```

- **Templates** : Polymorphisme paramétrique générant du code spécialisé
  ```cpp
  template<typename T>
  T max_value(T a, T b) { ... }
  ```

- **Polymorphisme runtime** : Classes virtuelles pour le dispatch dynamique
  ```cpp
  class Shape { virtual void display() = 0; };
  ```

### Points clés :
- Inférence au **compile-time** uniquement
- La surcharge est résolue via le compilateur (pas de runtime overhead)
- Les templates créent plusieurs versions du code (augmente la taille binaire)
- `decltype` permet d'inspecter les types des expressions

---

## 2. Haskell - Hindley-Milner et Typeclasses

### Caractéristiques principales :

- **Hindley-Milner** : Inférence très puissante, aucune annotation requise
  ```haskell
  add x y = x + y  -- Haskell déduit: add :: Num a => a -> a -> a
  ```

- **Typeclasses** : Polymorphisme ad-hoc (similaire aux interfaces)
  ```haskell
  class Showable a where
    myShow :: a -> String
  instance Showable Int where
    myShow x = "Integer: " ++ show x
  ```

- **Contraintes de type** : Limitent le polymorphisme
  ```haskell
  compare_and_show :: (Ord a, Show a) => a -> a -> String
  ```

- **Types algébriques** : Pattern matching exhaustif et typé
  ```haskell
  data Shape = Circle Double | Rectangle Double Double | ...
  ```

### Points clés :
- **Pas de surcharge** : Utilise les typeclasses à la place
- **Immutabilité par défaut** : Tout est immuable
- **Pas d'OOP traditionnel** : Utilise records et typeclasses
- Inférence très forte : rarement besoin d'annotations

---

## 3. OCaml - Inférence Stricte et Modules

### Caractéristiques principales :

- **Hindley-Milner strict** : Fort typage statique avec inférence
  ```ocaml
  let add x y = x + y  (* val add : int -> int -> int *)
  ```

- **Types algébriques** : Similaires à Haskell
  ```ocaml
  type shape = Circle of float | Rectangle of float * float
  ```

- **Modules et signatures** : Encapsulation et contrats d'interface
  ```ocaml
  module type Comparable = sig
    type t
    val compare : t -> t -> int
  end
  ```

- **Classes et objets** : Support OOP traditionnel (optionnel)
  ```ocaml
  class circle_obj r =
    object
      val radius = r
      method area = Float.pi *. radius *. radius
    end
  ```

### Points clés :
- Typage **plus strict** que Haskell (moins polymorphe par défaut)
- Modules pour le polymorphisme ad-hoc (alternative aux typeclasses)
- Support optionnel du style OOP
- Pattern matching puissant avec ADTs

---

## 4. TypeScript - Inférence Graduelle

### Caractéristiques principales :

- **Gradual typing** : Mélange code typé et non-typé
  ```typescript
  const x = 42;  // inferred: number
  let y: any = 42;  // no type checking
  ```

- **Surcharge de fonctions** : Supportée avec type guards
  ```typescript
  function printValue(value: number): void;
  function printValue(value: string): void;
  function printValue(value: number | string): void { ... }
  ```

- **Génériques** : Polymorphisme paramétrique type-safe
  ```typescript
  function maxValue<T extends number | string>(a: T, b: T): T { ... }
  class Container<T> { ... }
  ```

- **Interfaces et classes** : OOP complet
  ```typescript
  interface Shape { area(): number; }
  class Circle implements Shape { ... }
  ```

- **Union types et type guards** :
  ```typescript
  type Result<T> = { status: "success"; data: T } | { status: "error"; message: string };
  ```

### Points clés :
- **Runtime** : Types sont **effacés** après la compilation
- Support complet de **l'OOP** avec classes et interfaces
- **Structural typing** : Compatibilité basée sur la structure
- Conditional types pour la programmation au niveau des types

---

## Tableau Comparatif

| Aspect | C++ | Haskell | OCaml | TypeScript |
|--------|-----|---------|-------|------------|
| **Inférence** | Compile-time | Hindley-Milner | Hindley-Milner (strict) | Graduelle |
| **Surcharge** | Oui (compile-time) | Non (typeclasses) | Non (pattern matching) | Oui (type guards) |
| **Polymorphisme** | Templates + Virtuel | Typeclasses | Modules + Parametrique | Generics + Structural |
| **OOP** | Classes virtuelles | Non | Optionnel | Full support |
| **Immutabilité** | Non (default) | Oui (default) | Oui (default) | Non (default) |
| **Pattern matching** | Non | Oui | Oui | Limité |
| **Runtime types** | Non | Non | Non | Oui (compilé en JS) |
| **Flexibilité** | Moderate | Low | Low | High |

---

## Résumé des Différences Clés

### Inférence de Type
- **C++** : Compile-time, limitée à `auto` et templates
- **Haskell** : Hindley-Milner très puissant, rarement besoin d'annotations
- **OCaml** : Hindley-Milner strict, inférence forte
- **TypeScript** : Graduelle, peut être désactivée avec `any`

### Surcharge et Polymorphisme
- **C++** : Surcharge compile-time via templates et overloading
- **Haskell** : Pas de surcharge, utilise typeclasses pour le polymorphisme
- **OCaml** : Pas de surcharge, utilise modules et pattern matching
- **TypeScript** : Surcharge basée sur les signatures de type + union types

### Abstraction d'Objets
- **C++** : Classes avec héritage et polymorphisme virtuel
- **Haskell** : Records et typeclasses (pas de vrai OOP)
- **OCaml** : Modules + optional OOP avec classes
- **TypeScript** : Full OOP avec classes, interfaces, héritage

### Paradigme et Sécurité
- **C++** : Multi-paradigme, forte inférence compile-time
- **Haskell** : Fonctionnel pur, immutabilité garantie
- **OCaml** : Multi-paradigme (fonctionnel + OOP), strict
- **TypeScript** : Multi-paradigme, graduel, flexibilité

---

## Exécution des Exemples

Pour compiler et exécuter chaque exemple :

### C++
```bash
cd CXX
make
./bin/type_inference
```

### Haskell
```bash
cd haskell
ghc -o type_inference type_inference.hs
./type_inference
```

### OCaml
```bash
cd ocaml
ocamlopt -o type_inference type_inference.ml
./type_inference
```

### TypeScript
```bash
cd typescript
npm install typescript
npx tsc type_inference.ts
node type_inference.js
```

---

## Conclusion

Chaque langage offre une approche différente de l'inférence de type :

1. **C++** priorise les performances compile-time avec templates
2. **Haskell** offre une inférence maximale avec typeclasses pour le polymorphisme
3. **OCaml** propose un équilibre entre inférence et contrôle strict
4. **TypeScript** sacrifie la sécurité pour la flexibilité et l'interopérabilité JavaScript

Le choix dépend du cas d'usage : performance (C++), sécurité (Haskell/OCaml), ou flexibilité (TypeScript).
