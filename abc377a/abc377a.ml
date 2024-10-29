open Printf
open Scanf

let solve a b c =
  if List.sort compare [a; b; c] = ['A';'B';'C'] then "Yes" else "No"

let () =
  scanf "%c%c%c " solve |> printf "%s\n"
