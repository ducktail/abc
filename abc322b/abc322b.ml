open Printf
open Scanf

let solve n m s t =
  match s = String.sub t 0 n, s = String.sub t (m - n) n with
    true, true -> 0
  | true, false -> 1
  | false, true -> 2
  | false, false -> 3

let () =
  scanf "%d %d %s %s" solve |> printf "%d\n"
