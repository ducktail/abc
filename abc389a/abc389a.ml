open Printf
open Scanf

let solve s =
  (Char.code s.[0] - 48) * (Char.code s.[2] - 48)

let () =
  scanf "%s " solve |> printf "%d\n"
