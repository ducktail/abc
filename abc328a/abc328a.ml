open Printf
open Scanf

let solve x l =
  List.fold_left (+) 0 @@ List.filter (fun s -> s <= x) l

let () =
  let id x = x in
  scanf "%d %d " (fun n x ->
    List.init n (fun _ -> scanf "%d " id) |> solve x) |> printf "%d\n"
