open Printf
open Scanf

let solve _ k s =
  String.split_on_char 'X' s |> List.map (fun x -> String.length x / k) |> List.fold_left (+) 0

let () =
  scanf "%d %d %s " solve |> printf "%d\n"
