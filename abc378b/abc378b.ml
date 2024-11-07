open Printf
open Scanf

let gomi q r d = ((r - d) mod q + q) mod q + d

let () =
  scanf "%d " (fun n ->
      let tbl = Array.init n (fun _ -> scanf "%d %d " (fun q r -> gomi q r)) in
      scanf "%d " (fun q ->
          List.init q (fun _ -> scanf "%d %d " (fun t d -> tbl.(t - 1) d)) |> List.iter @@ printf "%d\n"))
