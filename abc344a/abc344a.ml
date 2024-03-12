open Printf
open Scanf

let solve s =
  match String.split_on_char '|' s with
    [a; _; c] -> a ^ c
  | _  -> ""

let () =
  scanf "%s " solve |> printf "%s\n"
