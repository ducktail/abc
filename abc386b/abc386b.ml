open Printf
open Scanf

let solve s =
  let f (l, lz) c =
    if c = '0' then (l, lz + 1)
    else (l + 1 + (lz + 1) / 2, 0) in
  let g (l, lz) = l + (lz + 1) / 2 in
  String.to_seq s |> List.of_seq |> List.fold_left f (0, 0) |> g

let () =
  scanf "%s " solve |> printf "%d\n"
