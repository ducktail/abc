open Printf
open Scanf

let solve la =
  List.fold_left (fun a b -> a - b) 0 la

let () =
  scanf "%d " (fun n ->
    List.init (n - 1) (fun _ -> scanf "%d " @@ fun x -> x)) |> solve |> printf "%d\n"
