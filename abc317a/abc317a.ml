open Printf
open Scanf

let solve d ap =
  let rec loop i =
    if ap.(i) >= d then (i + 1) else loop (i + 1) in
  loop 0

let () =
  let id x = x in
  scanf "%d %d %d " (fun n h x ->
    Array.init n (fun _ ->
    scanf "%d " id) |> solve (x - h)) |> printf "%d\n"
