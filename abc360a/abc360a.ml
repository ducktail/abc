open Printf
open Scanf

let solve s =
  let l = ["RSM"; "RMS" ; "SRM"] in
  if List.mem s l then "Yes" else "No"

let () =
  scanf "%s " solve |> printf "%s\n"
