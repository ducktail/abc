open Printf
open Scanf

let solve x =
  if x >= 38.0 then 1
  else if x >= 37.5 then 2
  else 3

let () =
  scanf "%f " solve |> printf "%d\n"
