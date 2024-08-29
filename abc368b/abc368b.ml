open Printf
open Scanf

let solve la =
  let f x y = compare y x in
  let rec loop ct l =
    match l with
      x :: y :: r when y = 0 -> ct
    | x :: y :: r -> loop (ct + 1) (List.sort f ((x - 1) :: (y - 1) :: r))
    | _ -> 0
  in loop 0 (List.sort f la)

let () =
  let id x = x in
  scanf "%d " (fun n ->
    List.init n (fun _ -> scanf "%d " id)) |> solve |> printf "%d\n"
