open Printf
open Scanf

let solve s k l =
  let sm = List.fold_left (+) 0 l in
  if sm >= s then sm else sm + k

let () =
  scanf "%d %d %d " (fun n s k ->
    List.init n (fun _ -> scanf "%d %d " @@ fun p q -> p * q) |> solve s k) |> printf "%d\n"
