open Printf
open Scanf

let rec merge lx ly =
  match lx, ly with
    x :: rx, y :: ry when x < y -> 0 :: merge rx ly
  | x :: rx, y :: ry -> 1 :: merge lx ry
  | rx, [] -> List.map (fun _ -> 0) rx
  | [], ry -> List.map (fun _ -> 1) ry

let solve la lb =
  let l = merge (List.sort compare la) (List.sort compare lb) in
  let rec loop l =
    match l with
      x :: y :: ry when x = 0 && y = 0 -> "Yes"
    | x :: y :: ry -> loop (y :: ry)
    | _ -> "No"
  in loop l

let () =
  scanf "%d %d " (fun n m ->
    let la = List.init n @@ fun _ -> scanf "%d " @@ fun x -> x in
    let lb = List.init m @@ fun _ -> scanf "%d " @@ fun x -> x in
    solve la lb) |> printf "%s\n"
