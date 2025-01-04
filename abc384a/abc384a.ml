open Printf
open Scanf

let solve n c1 c2 s  =
  let f c = if c == c1 then c1 else c2 in
  String.map f s

let () =
  scanf "%d %c %c %s " solve |> printf "%s\n"
