open Printf
open Scanf

let solve s =
  String.to_seq s |> Seq.filter (fun c -> c <> '.') |> String.of_seq

let () =
  scanf "%s " solve |> printf "%s\n"
