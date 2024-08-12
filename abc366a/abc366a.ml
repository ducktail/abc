open Printf
open Scanf

let solve n t a =
  if 2 * t > n then "Yes"
  else if 2 * a > n then "Yes"
  else "No"

let () =
  scanf "%d %d %d " solve |> printf "%s\n"
