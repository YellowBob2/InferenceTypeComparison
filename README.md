# Programmation Comparée - Types et Inférence

Ce projet explore les différences fondamentales dans la gestion des types et l'inférence entre quatre langages modernes.

## Structure du Projet

```
ProgrammationComparée/
├── CXX/                           # C++ - Compile-time type deduction
│   ├── Makefile                   # Build configuration
│   └── src/
│       ├── hello.cpp              # Hello World basique
│       └── type_inference.cpp     # Exemples d'inférence C++
│
├── haskell/                       # Haskell - Hindley-Milner inference
│   ├── hello.hs                   # Hello World basique
│   └── type_inference.hs          # Exemples avec typeclasses
│
├── ocaml/                         # OCaml - Strict Hindley-Milner
│   ├── hello.ml                   # Hello World basique
│   └── type_inference.ml          # Exemples avec modules et classes
│
├── typescript/                    # TypeScript - Gradual typing
│   └── type_inference.ts          # Exemples avec generics
│
├── COMPARAISON_TYPE_INFERENCE.md  # Document de synthèse comparatif
└── README.md                      # Ce fichier
```

## Contenu des Exemples

Chaque dossier de langage contient :

### 1. **hello.cpp / hello.hs / hello.ml / hello.ts**
Programme Hello World basique montrant la syntaxe de base du langage.

### 2. **type_inference.X**
Exemples détaillés illustrant :

#### C++ (`type_inference.cpp`)
- `auto` keyword et type deduction
- Function overloading (résolution compile-time)
- Templates génériques
- Polymorphisme virtuel (runtime)
- `decltype` pour l'inspection de type

#### Haskell (`type_inference.hs`)
- Hindley-Milner inference (type parfois pas spécifié)
- Typeclasses pour le polymorphisme ad-hoc
- Type constraints et polymorphisme limité
- Algebraic Data Types (ADTs) et pattern matching
- Higher-order functions
- Immutabilité par défaut

#### OCaml (`type_inference.ml`)
- Hindley-Milner strict
- Types algébriques avec pattern matching
- Modules et signatures (contrats d'interface)
- Classes et objets (support OOP optionnel)
- Polymorphisme paramétrique
- Higher-order functions avec inférence

#### TypeScript (`type_inference.ts`)
- Type inference (graduel)
- Function overloading avec type guards
- Generics et contraintes
- Classes et interfaces
- Union types et discriminated unions
- Conditional types
- Structural typing

## Thèmes Clés Couverts

### 1. Inférence de Type
- **Compile-time vs Runtime** : Comment et quand les types sont résolus
- **Hindley-Milner** : Algorithme d'inférence utilisé par Haskell et OCaml
- **Gradual typing** : Approche hybrid de TypeScript

### 2. Surcharge et Polymorphisme
- **Method overloading** : C++ et TypeScript
- **Typeclasses** : Alternative de Haskell
- **Templates/Generics** : Polymorphisme paramétrique
- **Modules** : Polymorphisme OCaml

### 3. Programmation Orientée Objet
- **Classes virtuelles** : Polymorphisme runtime en C++
- **Classes OCaml** : Support OOP optionnel
- **Typeclasses Haskell** : Alternative ad-hoc sans OOP
- **Interfaces TypeScript** : OOP structurel

### 4. Paradigmes de Programmation
- **Imperatif** : C++
- **Fonctionnel pur** : Haskell (immutabilité forcée)
- **Multi-paradigme** : OCaml, TypeScript

## Compilation et Exécution

### C++
```bash
cd CXX
make clean && make
./bin/type_inference
./bin/hello
```

### Haskell
```bash
cd haskell
ghc -o type_inference type_inference.hs
./type_inference
ghc -o hello hello.hs
./hello
```

### OCaml
```bash
cd ocaml
ocamlopt -o type_inference type_inference.ml
./type_inference
ocamlopt -o hello hello.ml
./hello
```

### TypeScript
```bash
cd typescript
npm install typescript
npx tsc type_inference.ts
node type_inference.js
npx tsc hello.ts
node hello.js
```

## Comparaison Synthétique

| Aspect | C++ | Haskell | OCaml | TypeScript |
|--------|-----|---------|-------|------------|
| **Inférence** | Compile | Hindley-Milner | Hindley-Milner | Graduelle |
| **Surcharge** | Oui | Non | Non | Oui |
| **OOP** | Héritage + Virtuel | Non | Optionnel | Full |
| **Immutabilité** | Non | Oui | Oui | Non |
| **Pattern Matching** | Non | Oui | Oui | Limité |
| **Performances** | Excellent | Bon | Bon | N/A (JS) |

## Documents Supplémentaires

- **COMPARAISON_TYPE_INFERENCE.md** : Analyse détaillée de chaque langage et comparaison

## Auteur
Projet créé pour l'étude comparative de langages de programmation - M2 Programmation Comparée.
