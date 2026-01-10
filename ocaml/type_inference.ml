(* === OCaml Type Inference Examples === *)
(* OCaml utilise l'inférence Hindley-Milner avec une stricte discipline de typage *)

(* === 1. Inférence de type de base === *)
(* Les types sont déduits sans annotation *)
let add x y = x + y  (* val add : int -> int -> int *)

let double x = x *. 2.0  (* val double : float -> float *)

let greet name = "Hello, " ^ name  (* val greet : string -> string *)

let example1 () =
  Printf.printf "\n=== 1. TYPE INFERENCE (Hindley-Milner) ===\n";
  Printf.printf "add 5 3 = %d\n" (add 5 3);
  Printf.printf "double 10.0 = %f\n" (double 10.0);
  Printf.printf "greet \"Alice\" = %s\n" (greet "Alice")

(* === 2. Types algébriques (ADTs) === *)
type shape =
  | Circle of float
  | Rectangle of float * float
  | Triangle of float * float * float

(* Pattern matching avec inférence *)
let area shape =
  match shape with
  | Circle r -> Float.pi *. r *. r
  | Rectangle (w, h) -> w *. h
  | Triangle (a, b, c) ->
      let s = (a +. b +. c) /. 2.0 in
      Float.sqrt (s *. (s -. a) *. (s -. b) *. (s -. c))

let string_of_shape shape =
  match shape with
  | Circle r -> Printf.sprintf "Circle with radius %f" r
  | Rectangle (w, h) -> Printf.sprintf "Rectangle %f×%f" w h
  | Triangle (a, b, c) -> Printf.sprintf "Triangle %f, %f, %f" a b c

let example2 () =
  Printf.printf "\n=== 2. ALGEBRAIC DATA TYPES ===\n";
  let shapes = [Circle 5.0; Rectangle (4.0, 6.0); Triangle (3.0, 4.0, 5.0)] in
  List.iter (fun s ->
    Printf.printf "%s -> Area: %f\n" (string_of_shape s) (area s)
  ) shapes

(* === 3. Polymorphisme avec inférence === *)
(* Les fonctions polymorphes qui déduisent les types *)

let compare_values x y =
  if x > y then
    Printf.sprintf "%d > %d" x y
  else if x < y then
    Printf.sprintf "%d < %d" x y
  else
    Printf.sprintf "%d == %d" x y

let example3 () =
  Printf.printf "\n=== 3. POLYMORPHISM WITH INFERENCE ===\n";
  Printf.printf "%s\n" (compare_values 5 3);
  Printf.printf "%s\n" (compare_values 2 4)

(* === 4. Classes et objets (orienté objet) === *)
(* OCaml supporte les classes et objets *)

class shape_obj =
  object
    method area : float = 0.0
    method display = Printf.printf "Generic shape\n"
  end

class circle_obj r =
  object
    val radius = r
    method area = Float.pi *. radius *. radius
    method display = Printf.printf "Circle with radius %f\n" radius
  end

class rectangle_obj w h =
  object
    val width = w
    val height = h
    method area = width *. height
    method display = Printf.printf "Rectangle %f×%f\n" width height
  end

let example4 () =
  Printf.printf "\n=== 4. CLASSES AND OBJECTS ===\n";
  let shapes = [
    new circle_obj 5.0;
    new rectangle_obj 4.0 6.0
  ] in
  List.iter (fun (s : shape_obj) ->
    s#display;
    Printf.printf "Area: %f\n" s#area
  ) shapes

(* === 5. Polymorphisme paramétrique (génériques) === *)
(* Les listes et les fonctions sont polymorphes *)

let first_element lst =
  match lst with
  | [] -> None
  | x :: _ -> Some x

let filter_map f lst =
  List.filter_map f lst

let example5 () =
  Printf.printf "\n=== 5. PARAMETRIC POLYMORPHISM ===\n";
  Printf.printf "first [1; 2; 3] = %s\n" (match first_element [1; 2; 3] with
    | Some x -> Int.to_string x
    | None -> "empty");
  Printf.printf "first [\"a\"; \"b\"] = %s\n" (match first_element ["a"; "b"] with
    | Some x -> x
    | None -> "empty");
  
  (* filter_map avec inférence *)
  let numbers = [1; 2; 3; 4; 5] in
  let evens = filter_map (fun x -> if x mod 2 = 0 then Some x else None) numbers in
  Printf.printf "evens in [1..5] = [%s]\n" (String.concat "; " (List.map Int.to_string evens))

(* === 6. Inférence avec let-binding === *)
let example6 () =
  Printf.printf "\n=== 6. LET-BINDING TYPE INFERENCE ===\n";
  let x = 5 in
  let y = 3.14 in
  let z = x * 2 in
  let result = float_of_int z +. y in
  Printf.printf "x = %d (int)\n" x;
  Printf.printf "y = %f (float)\n" y;
  Printf.printf "result = %f (float)\n" result

(* === 7. Fonctions d'ordre supérieur === *)
let example7 () =
  Printf.printf "\n=== 7. HIGHER-ORDER FUNCTIONS ===\n";
  let numbers = [1; 2; 3; 4; 5] in
  let doubled = List.map (fun x -> x * 2) numbers in
  Printf.printf "map (*2) [1..5] = [%s]\n" (String.concat "; " (List.map Int.to_string doubled));
  
  let filtered = List.filter (fun x -> x > 3) numbers in
  Printf.printf "filter (>3) [1..5] = [%s]\n" (String.concat "; " (List.map Int.to_string filtered));
  
  let sum = List.fold_left (+) 0 numbers in
  Printf.printf "fold (+) [1..5] = %d\n" sum

let () =
  Printf.printf "=== OCaml Type Inference Examples ===\n";
  example1 ();
  example2 ();
  example3 ();
  example4 ();
  example5 ();
  example6 ();
  example7 ();
  
  Printf.printf "\n=== Key Points ===\n";
  Printf.printf "1. Hindley-Milner: Strong inference, strict typing\n";
  Printf.printf "2. Modules: Encapsulation and interface contracts\n";
  Printf.printf "3. ADTs: Pattern matching for type-safe code\n";
  Printf.printf "4. Classes: Traditional OOP support\n";
  Printf.printf "5. Parametric polymorphism: Type variables for generics\n";
  Printf.printf "6. No method overloading: Use pattern matching instead\n";
  Printf.printf "7. Immutability: Default behavior for safety\n"
