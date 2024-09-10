open Printf
open Scanf

let solve l r =
  match l * 2 + r with
    1 -> "No"
  | 2 -> "Yes"
  | _ -> "Invalid"

let () =
  scanf "%d %d " solve |> printf "%s\n"
