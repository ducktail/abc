open Printf
open Scanf

let solve s =
  String.split_on_char '|' s |> List.map String.length |> List.filter (fun x -> x > 0)

let () =
  scanf "%s " solve |> List.map string_of_int |> String.concat " " |> printf "%s\n"
