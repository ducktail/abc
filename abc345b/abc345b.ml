open Printf
open Scanf

let solve x =
  (if x < 0 then x else x + 9) / 10

let () =
  scanf "%d " solve |> printf "%d\n"
