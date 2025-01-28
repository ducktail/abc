open Printf
open Scanf

let solve a b =
  let ab = (a + b) in ab * ab

let () =
  scanf "%d %d " solve |> printf "%d\n"
