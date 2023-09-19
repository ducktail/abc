open Printf
open Scanf

let rec pow n m =
  if m = 0 then 1 else pow n (m - 1) * n

let solve a b =
  pow a b + pow b a

let () =
  scanf "%d %d " solve |> printf "%d\n"
