open Printf
open Scanf

let solve a b c =
  if a < b && b < c || b < c && c < a || c < a && a < b then "Yes" else "No"

let () =
  scanf "%d %d %d " solve |> printf "%s\n"
