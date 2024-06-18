open Printf
open Scanf

let solve s t =
  if s = "AtCoder" && t = "Land" then "Yes" else "No"

let () =
  scanf "%s %s " solve |> printf "%s\n"
