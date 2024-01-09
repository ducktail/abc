open Printf
open Scanf

let solve s =
  let l = String.length s in
  String.sub s 0 (l - 1) ^ "4"

let () =
  scanf "%s " solve |> printf "%s\n"
