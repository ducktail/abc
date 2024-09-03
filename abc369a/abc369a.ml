open Printf
open Scanf

let solve a b =
  if a = b then 1
  else if (a + b) mod 2 = 0 then 3
  else 2

let () =
  scanf "%d %d " solve |> printf "%d\n"
