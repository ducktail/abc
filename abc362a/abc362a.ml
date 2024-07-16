open Printf
open Scanf

let solve r g b c =
  match c with
    "Red" -> min g b
  | "Green" -> min r b
  | _ -> min r g

let () =
  scanf "%d %d %d %s " solve |> printf "%d\n"
