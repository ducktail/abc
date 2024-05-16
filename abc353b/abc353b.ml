open Printf
open Scanf

let solve k la =
  let inc x = x + 1 in
  let f (ct, sp) a =
    if sp >= a then (ct, sp - a)
    else (ct + 1, k - a) in
  List.fold_left f (0, k) la |> fst |> inc

let () =
  scanf "%d %d " (fun n k ->
    List.init n (fun _ -> scanf "%d " @@ fun x -> x) |> solve k) |> printf "%d\n"
