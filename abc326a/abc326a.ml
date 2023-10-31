open Printf
open Scanf

let solve x y =
  if y > x + 2 then "No"
  else if y  < x - 3 then "No"
  else "Yes"

let () =
  scanf "%d %d " solve |> printf "%s\n"
