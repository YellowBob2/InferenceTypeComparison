// === TypeScript Type Inference Examples ===
// TypeScript ajoute l'inférence de type à JavaScript

// === 1. Inférence de type de base ===
// TypeScript déduit les types à partir des valeurs
const add = (x: number, y: number) => x + y;  // return type: number

const greet = (name: string) => `Hello, ${name}`;  // return type: string

// Inférence sans annotation
const inferredNumber = 42;  // type: number
const inferredString = "hello";  // type: string
const inferredArray = [1, 2, 3];  // type: number[]

function example1() {
    console.log("\n=== 1. TYPE INFERENCE ===");
    console.log("add(5, 3) =", add(5, 3));
    console.log("greet('Alice') =", greet("Alice"));
    console.log("inferredNumber =", inferredNumber, "(number)");
    console.log("inferredArray =", inferredArray, "(number[])");
}

// === 2. Surcharge de fonctions ===
// TypeScript supporte la surcharge (overloading) au niveau du type

function printValue(value: number): void;
function printValue(value: string): void;
function printValue(value: boolean): void;
function printValue(value: number | string | boolean): void {
    if (typeof value === "number") {
        console.log("Integer:", value);
    } else if (typeof value === "string") {
        console.log("String:", value);
    } else {
        console.log("Boolean:", value);
    }
}

function example2() {
    console.log("\n=== 2. FUNCTION OVERLOADING ===");
    printValue(42);
    printValue("Hello");
    printValue(true);
}

// === 3. Génériques (Templates) ===
// Les génériques permettent une réutilisabilité type-safe

function maxValue<T extends number | string>(a: T, b: T): T {
    return a > b ? a : b;
}

function getLength<T extends string | any[]>(item: T): number {
    return item.length;
}

// Classe générique
class Container<T> {
    private items: T[] = [];

    add(item: T): void {
        this.items.push(item);
    }

    get(index: number): T | undefined {
        return this.items[index];
    }

    getAll(): T[] {
        return this.items;
    }
}

function example3() {
    console.log("\n=== 3. GENERICS ===");
    console.log("maxValue(5, 10) =", maxValue(5, 10));
    console.log("maxValue(3.5, 2.1) =", maxValue(3.5, 2.1));
    console.log("maxValue('apple', 'banana') =", maxValue('apple', 'banana'));

    const intContainer = new Container<number>();
    intContainer.add(1);
    intContainer.add(2);
    console.log("intContainer:", intContainer.getAll());

    const stringContainer = new Container<string>();
    stringContainer.add("hello");
    stringContainer.add("world");
    console.log("stringContainer:", stringContainer.getAll());
}

// === 4. Interfaces et classes (OOP) ===
// TypeScript supporte la programmation orientée objet

interface Shape {
    area(): number;
    display(): string;
}

class Circle implements Shape {
    constructor(private radius: number) {}

    area(): number {
        return Math.PI * this.radius * this.radius;
    }

    display(): string {
        return `Circle with radius ${this.radius}`;
    }
}

class Rectangle implements Shape {
    constructor(private width: number, private height: number) {}

    area(): number {
        return this.width * this.height;
    }

    display(): string {
        return `Rectangle ${this.width}×${this.height}`;
    }
}

function example4() {
    console.log("\n=== 4. CLASSES AND INTERFACES ===");
    const shapes: Shape[] = [
        new Circle(5),
        new Rectangle(4, 6)
    ];

    for (const shape of shapes) {
        console.log(`${shape.display()} -> Area: ${shape.area().toFixed(2)}`);
    }
}

// === 5. Types union et littéraux ===
// TypeScript supporte les types union et littéraux

type Status = "success" | "error" | "loading";
type Result<T> = { status: "success"; data: T } | { status: "error"; message: string };

function handleStatus(status: Status): string {
    switch (status) {
        case "success": return "Operation succeeded";
        case "error": return "Operation failed";
        case "loading": return "Loading...";
    }
}

function processResult<T>(result: Result<T>): string {
    if (result.status === "success") {
        return `Success: ${JSON.stringify(result.data)}`;
    } else {
        return `Error: ${result.message}`;
    }
}

function example5() {
    console.log("\n=== 5. UNION TYPES AND TYPE GUARDS ===");
    console.log(handleStatus("success"));
    console.log(handleStatus("loading"));

    const success: Result<number> = { status: "success", data: 42 };
    const error: Result<number> = { status: "error", message: "Failed" };

    console.log(processResult(success));
    console.log(processResult(error));
}

// === 6. Types génériques avec contraintes ===
// Contraindre les génériques pour une meilleure réutilisabilité

interface HasLength {
    length: number;
}

function getSize<T extends HasLength>(item: T): number {
    return item.length;
}

function mergeObjects<T extends object, U extends object>(obj1: T, obj2: U): T & U {
    return { ...obj1, ...obj2 } as T & U;
}

function example6() {
    console.log("\n=== 6. CONSTRAINED GENERICS ===");
    console.log("getSize('hello') =", getSize("hello"));
    console.log("getSize([1,2,3]) =", getSize([1, 2, 3]));

    const merged = mergeObjects({ a: 1, b: 2 }, { c: 3, d: 4 });
    console.log("merged object:", merged);
}

// === 7. Inférence avec map et filter ===
// TypeScript infère les types dans les transformations

function example7() {
    console.log("\n=== 7. HIGHER-ORDER FUNCTIONS ===");
    const numbers = [1, 2, 3, 4, 5];

    const doubled = numbers.map(x => x * 2);  // inferred: number[]
    console.log("map (*2):", doubled);

    const filtered = numbers.filter(x => x > 3);  // inferred: number[]
    console.log("filter (>3):", filtered);

    const sum = numbers.reduce((acc, x) => acc + x, 0);  // inferred: number
    console.log("reduce (+):", sum);
}

// === 8. Inférence conditionnelle ===
// TypeScript peut inférer les types dans les expressions conditionnelles

type Flatten<T> = T extends Array<infer U> ? U : T;

type Str = Flatten<string[]>;  // string
type Num = Flatten<number>;    // number

function example8() {
    console.log("\n=== 8. CONDITIONAL TYPES ===");
    const arr: Flatten<number[]> = 42;
    console.log("Flattened type extracted");
}

// === Main ===
console.log("=== TypeScript Type Inference Examples ===");

example1();
example2();
example3();
example4();
example5();
example6();
example7();
example8();

console.log("\n=== Key Points ===");
console.log("1. Gradual typing: Mix typed and untyped code");
console.log("2. Function overloading: Overload signatures with type guards");
console.log("3. Generics: Type-safe parametric polymorphism");
console.log("4. Classes & Interfaces: Full OOP support");
console.log("5. Union types: Discriminated unions for type safety");
console.log("6. Conditional types: Advanced type-level programming");
console.log("7. No separate compilation: Erased at runtime");
console.log("8. Structural typing: Type compatibility based on structure");
