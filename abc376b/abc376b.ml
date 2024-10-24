open Printf
open Scanf

let solve n sht =
  let dst s d g =
    if s < d && s < g && g < d then n - d + s
    else if s < d then d - s
    else if s > g && g > d then n - s + d
    else s - d in
  let f (ct, (l, r)) (h, t) =
    if h = 'L' then (ct + dst l t r, (t, r)) else (ct + dst r t l, (l, t)) in
  fst @@ Seq.fold_left f (0, (1, 2)) sht

let () =
  scanf "%d %d " (fun n q ->
    Seq.init q (fun _ -> scanf "%c %d " @@ fun h t -> (h, t)) |> solve n) |> printf "%d\n"
