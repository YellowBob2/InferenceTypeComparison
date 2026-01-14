(* === OCaml === *)


(* === 1. Inférence de type de base === *)

let f = fun x -> x
let a = f 42          (* infére: int *)
let b = f "hello"     (* infére: string *)

(* Pas de Surcharge, pas de classes de types *)
let add x y = x + y
let add_float x y = x +. y
let a = add 5 3 
let b = add_float 5.5 3.5 




(* OCaml a des limites aussi dans son inférence globale *)

type eur = { amount : float }

(* fonction de conversion de euros en cents *)
let to_cents_eur e = e.amount *. 100.0 (* infére: eur -> float *)

(* Je définis un autre type usd avec le même champ 'amount' *)
type usd = { amount : float }

let v = to_cents_eur { amount = 50.0 } (* Ça marche ! *)

let mon_portefeuille = { amount = 50.0 } (* infére: usd car c'est la dernière déf. *)

let v = to_cents_eur mon_portefeuille (* ERREUR DE COMPILATION IMMÉDIATE *)
(* L'inférence dit : "J'attendais un type 'eur', j'ai reçu un 'usd'. C'est NON." *)


(* Main *)
let () = Printf.printf "Valeur en cents: %.2f\n" v
  

