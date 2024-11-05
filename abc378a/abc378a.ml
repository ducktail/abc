open Printf
open Scanf

let solve la =
  let a = Array.make 5 0 in
  List.iter (fun x -> a.(x) <- a.(x) + 1) la ;
  Array.fold_left (fun c x -> c + x / 2) 0 a

let () =
  let id x = x in
  List.init 4 (fun _ -> scanf "%d " id) |> solve |> printf "%d\n"
