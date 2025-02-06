open Printf
open Scanf

let solve s =
  let x = "?UPC" in
  String.init 4 (fun i -> if i = 0 then s.[i] else x.[i])

let () =
  scanf "%s " solve |> printf "%s\n"
