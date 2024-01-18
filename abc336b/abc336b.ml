open Printf
open Scanf

let solve n =
  let rec loop c x =
    if x mod 2 = 1 then c else loop (c + 1) (x / 2) in
  loop 0 n

let () =
  scanf "%d " solve |> printf "%d\n"
