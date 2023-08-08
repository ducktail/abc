open Printf
open Scanf

let solve lp =
  match lp with
    [_] -> 0
  | p :: rs -> max 0 ((List.fold_left max 0 rs) + 1 - p)
  | _ -> 0

let () =
  let id x = x in
  scanf "%d " (fun n -> List.init n (fun _ -> scanf "%d " id) |> solve) |> printf "%d\n"
