open Printf
open Scanf

let () =
  scanf "%d " (fun r -> 100 - r mod 100) |> printf "%d\n"
