open Printf
open Scanf

let rec bsearch xok xng f =
  if xok + 1 = xng then xok
  else
    let x = (xok + xng) / 2 in
    if f x then bsearch x xng f
    else bsearch xok x f

let sum = List.fold_left (+) 0

let solve m la =
  if sum la <= m then "infinite"
  else
    string_of_int @@ bsearch 0 10000000000 (fun x -> sum (List.map (fun y -> min x y) la) <= m)

let () =
  let id x = x in
  scanf "%d %d " (fun n m ->
    List.init n (fun _ -> scanf "%d " id) |> solve m) |> printf "%s\n"
