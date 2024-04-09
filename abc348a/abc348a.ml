open Printf
open Scanf

let solve n =
  String.init n @@ fun i -> if i mod 3 = 2 then 'x' else 'o'

let () =
  scanf "%d " solve |> printf "%s\n"
