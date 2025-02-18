open Printf
open Scanf

let solve n =
  let rec loop n x =
    if n = 1 then x - 1
    else loop (n / x) (x + 1) in
  loop n 2

let () =
  scanf "%d " solve |> printf "%d\n"
