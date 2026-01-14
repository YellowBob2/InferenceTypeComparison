

let a: number | string;
a = 42;
a = "Hello";

function process(a: number | string) {
    if (typeof a === "number") {
        return a + 1      // a : number
    } else {
        return a + "b"   // a : string
    }
}

let list = [1, "a"];  // list :(number | string)[]


class Shape {}
class Circle extends Shape {}
class Rectangle extends Shape {}
class Triangle extends Shape {}

const shapes = [new Circle(), new Rectangle(), new Triangle()];
// Inféré : (Circle | Rectangle | Triangle)[]   (pas Shape[])

const asShape: Shape[] = shapes; // Correct mais nécessite une assertion de type
