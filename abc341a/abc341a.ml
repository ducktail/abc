open Printf
open Scanf

let solve n =
  String.init (2 * n + 1) (fun i -> if i mod 2 = 0 then '1' else '0')

let () =
  scanf "%d " solve |> printf "%s\n"
