open Printf
open Scanf

let solve c st =
  let f (ct, gt) t =
    if gt + c <= t then (ct + 1, t) else (ct, gt) in
  fst @@ Seq.fold_left f (0, -c) st

let () =
  scanf "%d %d " (fun n c ->
    Seq.init n (fun _ -> scanf "%d " @@ fun x -> x) |> solve c) |> printf "%d\n"
