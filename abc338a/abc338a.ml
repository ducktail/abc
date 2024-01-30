open Printf
open Scanf

let is_upper c = Char.code c < 95

let solve s =
  let len = String.length s in
  let rec loop i =
    if i = len then true else
      if is_upper s.[i] then false
      else loop (i + 1) in
  if is_upper s.[0] && loop 1 then "Yes" else "No"

let () =
  scanf "%s " solve |> printf "%s\n"
