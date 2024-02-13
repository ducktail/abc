open Printf
open Scanf

let solve a b d =
  let rec f x =
    if x > b then []
    else x :: f (x + d) in
  f a

let () =
  scanf "%d %d %d " solve |> List.map string_of_int |> String.concat " " |> printf "%s\n"
