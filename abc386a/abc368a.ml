open Printf
open Scanf

module ISet = Set.Make (Int)

let solve a b c d =
  let f st x = ISet.add x st in
  let g st = if ISet.cardinal st = 2 then "Yes" else "No" in
  List.fold_left f ISet.empty [a; b; c; d] |> g

let () =
  scanf "%d %d %d %d " solve |> printf "%s\n"
