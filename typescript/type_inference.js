// === TypeScript Type Inference Examples ===
// TypeScript ajoute l'inférence de type à JavaScript
var __assign = (this && this.__assign) || function () {
    __assign = Object.assign || function(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
                t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};
// === 1. Inférence de type de base ===
// TypeScript déduit les types à partir des valeurs
var add = function (x, y) { return x + y; }; // return type: number
var greet = function (name) { return "Hello, ".concat(name); }; // return type: string
// Inférence sans annotation
var inferredNumber = 42; // type: number
var inferredString = "hello"; // type: string
var inferredArray = [1, 2, 3]; // type: number[]
function example1() {
    console.log("\n=== 1. TYPE INFERENCE ===");
    console.log("add(5, 3) =", add(5, 3));
    console.log("greet('Alice') =", greet("Alice"));
    console.log("inferredNumber =", inferredNumber, "(number)");
    console.log("inferredArray =", inferredArray, "(number[])");
}
function printValue(value) {
    if (typeof value === "number") {
        console.log("Integer:", value);
    }
    else if (typeof value === "string") {
        console.log("String:", value);
    }
    else {
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
function maxValue(a, b) {
    return a > b ? a : b;
}
function getLength(item) {
    return item.length;
}
// Classe générique
var Container = /** @class */ (function () {
    function Container() {
        this.items = [];
    }
    Container.prototype.add = function (item) {
        this.items.push(item);
    };
    Container.prototype.get = function (index) {
        return this.items[index];
    };
    Container.prototype.getAll = function () {
        return this.items;
    };
    return Container;
}());
function example3() {
    console.log("\n=== 3. GENERICS ===");
    console.log("maxValue(5, 10) =", maxValue(5, 10));
    console.log("maxValue(3.5, 2.1) =", maxValue(3.5, 2.1));
    console.log("maxValue('apple', 'banana') =", maxValue('apple', 'banana'));
    var intContainer = new Container();
    intContainer.add(1);
    intContainer.add(2);
    console.log("intContainer:", intContainer.getAll());
    var stringContainer = new Container();
    stringContainer.add("hello");
    stringContainer.add("world");
    console.log("stringContainer:", stringContainer.getAll());
}
var Circle = /** @class */ (function () {
    function Circle(radius) {
        this.radius = radius;
    }
    Circle.prototype.area = function () {
        return Math.PI * this.radius * this.radius;
    };
    Circle.prototype.display = function () {
        return "Circle with radius ".concat(this.radius);
    };
    return Circle;
}());
var Rectangle = /** @class */ (function () {
    function Rectangle(width, height) {
        this.width = width;
        this.height = height;
    }
    Rectangle.prototype.area = function () {
        return this.width * this.height;
    };
    Rectangle.prototype.display = function () {
        return "Rectangle ".concat(this.width, "\u00D7").concat(this.height);
    };
    return Rectangle;
}());
function example4() {
    console.log("\n=== 4. CLASSES AND INTERFACES ===");
    var shapes = [
        new Circle(5),
        new Rectangle(4, 6)
    ];
    for (var _i = 0, shapes_1 = shapes; _i < shapes_1.length; _i++) {
        var shape = shapes_1[_i];
        console.log("".concat(shape.display(), " -> Area: ").concat(shape.area().toFixed(2)));
    }
}
function handleStatus(status) {
    switch (status) {
        case "success": return "Operation succeeded";
        case "error": return "Operation failed";
        case "loading": return "Loading...";
    }
}
function processResult(result) {
    if (result.status === "success") {
        return "Success: ".concat(JSON.stringify(result.data));
    }
    else {
        return "Error: ".concat(result.message);
    }
}
function example5() {
    console.log("\n=== 5. UNION TYPES AND TYPE GUARDS ===");
    console.log(handleStatus("success"));
    console.log(handleStatus("loading"));
    var success = { status: "success", data: 42 };
    var error = { status: "error", message: "Failed" };
    console.log(processResult(success));
    console.log(processResult(error));
}
function getSize(item) {
    return item.length;
}
function mergeObjects(obj1, obj2) {
    return __assign(__assign({}, obj1), obj2);
}
function example6() {
    console.log("\n=== 6. CONSTRAINED GENERICS ===");
    console.log("getSize('hello') =", getSize("hello"));
    console.log("getSize([1,2,3]) =", getSize([1, 2, 3]));
    var merged = mergeObjects({ a: 1, b: 2 }, { c: 3, d: 4 });
    console.log("merged object:", merged);
}
// === 7. Inférence avec map et filter ===
// TypeScript infère les types dans les transformations
function example7() {
    console.log("\n=== 7. HIGHER-ORDER FUNCTIONS ===");
    var numbers = [1, 2, 3, 4, 5];
    var doubled = numbers.map(function (x) { return x * 2; }); // inferred: number[]
    console.log("map (*2):", doubled);
    var filtered = numbers.filter(function (x) { return x > 3; }); // inferred: number[]
    console.log("filter (>3):", filtered);
    var sum = numbers.reduce(function (acc, x) { return acc + x; }, 0); // inferred: number
    console.log("reduce (+):", sum);
}
function example8() {
    console.log("\n=== 8. CONDITIONAL TYPES ===");
    var arr = 42;
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
