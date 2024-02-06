open Printf
open Scanf

let rec last = function
    [] -> None
  | [x] -> Some x
  | x :: rs -> last rs

let solve s =
  String.split_on_char '.' s |> last |> Option.get

let () =
  scanf "%s " solve |> printf "%s\n"
