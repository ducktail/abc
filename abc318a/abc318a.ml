open Printf
open Scanf

let solve n m p =
  if n < m then 0
  else (n - m) / p + 1

let () =
  scanf "%d %d %d " solve |> printf "%d\n"
