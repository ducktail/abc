open Printf
open Scanf

let solve n l r =
  List.init n (fun i ->
    let x = i + 1 in
    if l <= x && x <= r then l + r - x else x)

let () =
  scanf "%d %d %d " solve |> List.map string_of_int |> String.concat " " |> printf "%s\n"
