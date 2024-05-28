open Printf
open Scanf

let solve a b =
  if a = b then -1 else 6 - a - b

let () =
  scanf "%d %d " solve |> printf "%d\n"
