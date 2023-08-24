open Printf
open Scanf

let solve ad =
  let rec loop i rd =
    if ad.(i) >= rd then (i + 1, rd)
    else loop (i + 1) (rd - ad.(i)) in
  loop 0 (((Array.fold_left (+) 0 ad) + 1) / 2)

let () =
  let id x = x in
  scanf "%d " (fun n -> Array.init n (fun _ -> scanf "%d " @@ id) |> solve)
  |> fun (a, b) -> printf "%d %d\n" a b
