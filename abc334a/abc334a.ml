open Printf
open Scanf

let solve b g =
  if b > g then "Bat" else "Glove"

let () =
  scanf "%d %d " solve |> printf "%s\n"
