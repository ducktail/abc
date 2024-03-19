open Printf
open Scanf

let solve s =
  let l = String.length s in
  let t = "<" ^ String.make (l - 2) '=' ^ ">" in
  if s = t then "Yes" else "No"

let () =
  scanf "%s " solve |> printf "%s\n"
