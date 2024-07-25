open Printf
open Scanf

let solve n t p aa =
  Array.sort compare aa ;
  max 0 @@ t - aa.(n - p)

let () =
  let id x = x in
  scanf "%d %d %d " (fun n t p ->
    Array.init n (fun _ -> scanf "%d " id) |> solve n t p) |> printf "%d\n"
