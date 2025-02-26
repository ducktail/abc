open Printf
open Scanf

let solve d =
  let f c = if c = 'N' then 'S'
            else if c = 'S'then 'N'
            else if c = 'E'then 'W'
            else 'E' in
  String.map f d

let () =
  scanf "%s " solve |> printf "%s\n"
