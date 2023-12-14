open Printf
open Scanf

let solve k gg mm =
  let rec loop i g m =
    if i = 0 then (g, m)
    else if g = gg then loop (i - 1) 0 m
    else if m = 0 then loop (i - 1) g mm
    else let mn = min (gg - g) m in loop (i - 1) (g + mn) (m - mn) in
  loop k 0 0

let () =
  scanf "%d %d %d " solve |> fun (g, m) -> printf "%d %d\n" g m
