open Printf
open Scanf

let solve s1 s2 =
  match (s1, s2) with
    "fine", "fine" -> 4
  | "fine", "sick" -> 3
  | "sick", "fine" -> 2
  | _ -> 1

let () =
  scanf "%s %s " solve |> printf "%d\n"
