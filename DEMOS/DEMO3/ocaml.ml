class obj_eur v = object method amount = v *. 100.0 method currency = "EUR" end

class obj_usd v = object method amount = v *. 10.0 method currency = "USD" end



(* Fonction qui prend n'importe quoi ayant une méthode 'amount' *)
let get_amount x = x#amount

let e = new obj_eur 1.0
let u = new obj_usd 1.0

(* L'inférence génère ici un type : < amount : float; .. > -> float *)
let eur_amount = get_amount e (* OK *)
let usd_amount = get_amount u (* OK *)



(* Fonction qui demande explicitement un objet de type 'obj_eur' *)
let get_eur_amount (e : obj_eur) = e#amount

let eur_eur_amount = get_eur_amount e (* OK *)

let usd_eur_amount = get_eur_amount u (* QUOI ? Ca marche ?! Pas d'erreur de compilation ! *)

(* Main On compare la valeur de get_amount et get_eur_amount *)
let () =
  Printf.printf "EUR get_amount: %.2f \t get_eur_amount: %.2f\n" eur_amount eur_eur_amount;
  Printf.printf "USD get_amount: %.2f \t get_eur_amount: %.2f\n" usd_amount usd_eur_amount