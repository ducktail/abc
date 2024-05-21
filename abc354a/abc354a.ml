open Printf
open Scanf

let solve n =
  let rec loop i x =
    if x > n + 1 then i
    else loop (i + 1) (x * 2) in
  loop 0 1

let () =
  scanf "%d " solve |> printf "%d\n"
