open Printf
open Scanf

let solve n =
  "L" ^ String.make n 'o' ^ "ng"

let () =
  scanf "%d " solve |> printf "%s\n"
