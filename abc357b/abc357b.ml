open Printf
open Scanf

let is_upper c =
  Char.code c < 95

let solve s =
  let l = String.fold_left (fun x c -> if is_upper c then x + 1 else x) 0 s in
  if 2 * l > String.length s then String.uppercase_ascii s else String.lowercase_ascii s

let () =
  scanf "%s " solve |> printf "%s\n"
