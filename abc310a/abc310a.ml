open Printf
open Scanf

let solve p q ld =
  min p (q + List.fold_left min (List.hd ld) ld)

let () =
  let id x = x in
  scanf "%d %d %d " (fun n p q ->
    List.init n (fun _ -> scanf "%d " id) |> solve p q) |> printf "%d\n"
