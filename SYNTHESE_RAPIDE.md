# Inférence de Type - Synthèse Rapide

## Les 4 Approches

### 1️⃣ C++ - Inférence Compile-Time
```cpp
auto x = 42;  // Type déduit: int
template<typename T> T max_v(T a, T b);  // Polymorphe
void print(int);      // Surcharge 1
void print(double);   // Surcharge 2
```
**Clé** : Templates + overloading = code spécialisé à la compilation

---

### 2️⃣ Haskell - Hindley-Milner Maximal
```haskell
add x y = x + y  -- Type: Num a => a -> a -> a
class Showable a where myShow :: a -> String
instance Showable Int where myShow x = show x
```
**Clé** : Typeclasses pour le polymorphisme (pas d'overloading classique)

---

### 3️⃣ OCaml - Hindley-Milner Strict
```ocaml
let add x y = x + y  (* Type: int -> int -> int *)
type shape = Circle of float | Rectangle of float * float
module type Sig = sig type t val f : t -> int end
```
**Clé** : Modules pour l'abstraction, types algébriques avec pattern matching

---

### 4️⃣ TypeScript - Gradual & Structural
```typescript
const x = 42;  // Type: number
function max<T extends number | string>(a: T, b: T): T
interface Shape { area(): number }
class Circle implements Shape { /* ... */ }
```
**Clé** : Flexible, supporté par des interfaces, generics, union types

---

## Surcharge et Polymorphisme

| Langage | Surcharge | Polymorphisme | Alternative |
|---------|-----------|---------------|-------------|
| **C++** | ✅ compile-time | Templates, héritage | - |
| **Haskell** | ❌ Non | Typeclasses | Type constraints |
| **OCaml** | ❌ Non | Modules, parametrique | Pattern matching |
| **TypeScript** | ✅ avec type guards | Generics, structural | Union types |

---

## Objets et Classes

| Langage | Classes | Héritage | Polymorphe | Notes |
|---------|---------|----------|-----------|-------|
| **C++** | ✅ | ✅ Virtual | Runtime (vtable) | Performance |
| **Haskell** | ❌ | N/A | Typeclasses | Fonctionnel pur |
| **OCaml** | ✅ (optional) | ✅ | Message passing | Modules principaux |
| **TypeScript** | ✅ | ✅ | Nominal+Structural | Full OOP |

---

## Immuabilité

| Langage | Default | Mutable | Notes |
|---------|---------|--------|-------|
| **C++** | Mutable | Via mutation | Performance first |
| **Haskell** | **Immutable** | Via monades | Purity by default |
| **OCaml** | **Immutable** | Via refs/arrays | Functional paradigm |
| **TypeScript** | Mutable | Via mutation | Like JavaScript |

---

## Inférence - Quand et Comment

### C++
- **Quand** : Compile-time seulement
- **Comment** : `auto`, template specialization, `decltype`
- **Limites** : Explicit pour fonctions/paramètres

### Haskell
- **Quand** : Compile-time (toujours)
- **Comment** : Hindley-Milner algorithm
- **Limites** : Parfois ambiguïté avec typeclasses → annotations

### OCaml
- **Quand** : Compile-time (strict)
- **Comment** : Hindley-Milner + unification
- **Limites** : Plus strict que Haskell (int ≠ float)

### TypeScript
- **Quand** : Compile-time (graduel)
- **Comment** : Analyse de flux, inférence locale
- **Limites** : Peut être désactivé avec `any`

---

## Points Clés par Langage

### 🔴 C++
- Inférence = **specialization de templates**
- Surcharge = **résolution de surcharge compile-time**
- OOP = **héritage virtuel + runtime dispatch**
- Performance = **prioritaire**

### 🟢 Haskell
- Inférence = **Hindley-Milner très puissant**
- Polymorphisme = **typeclasses + constraints**
- Pas d'OOP traditionnel
- **Immutabilité forcée** = garanties de sécurité

### 🟡 OCaml
- Inférence = **Hindley-Milner strict (plus strict que Haskell)**
- Modules = **plus puissants que typeclasses**
- Peut avoir classes (optionnel)
- **Pattern matching** = principal outil d'abstraction

### 🔵 TypeScript
- Inférence = **graduelle et locale**
- Peut mélanger code typé/non-typé
- **Full OOP** support
- **Erased at runtime** = flexibilité

---

## Cas d'Usage

```
Performance critique → C++
Sécurité absolue → Haskell
Système modulaire → OCaml
Flexibilité frontend → TypeScript
```
