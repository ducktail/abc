open Printf
open Scanf

let solve n axy =
  let rec loop i l =
    if i > n then l
    else let d =
           match (axy.(i), axy.(i + 1)) with
             ((x0, y0), (x1, y1)) -> 
             let dx = float_of_int (x1 - x0) ** 2.0 in
             let dy = float_of_int (y1 - y0) ** 2.0 in
             dx +. dy in
         loop (i + 1) (l +. sqrt d) in
  loop 0 0.0

let () =
  scanf "%d " (fun n ->
      Array.init (n + 2) (fun i ->
          if i = 0 then (0, 0)
          else if i = n + 1 then (0, 0)
          else scanf "%d %d " (fun x y -> (x, y)))
              |> solve n) |> printf "%.10f\n"
