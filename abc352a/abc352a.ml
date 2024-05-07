open Printf
open Scanf

let solve n x y z =
  if x < z && z < y || x > z && z > y then "Yes" else "No"

let () =
  scanf "%d %d %d %d " solve |> printf "%s\n"
