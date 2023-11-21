open Printf
open Scanf

let solve s =
  String.init (String.length s * 2 - 1) (fun i -> if i mod 2 = 1 then ' ' else s.[i / 2])

let () =
  scanf "%s " solve |> printf "%s\n"
