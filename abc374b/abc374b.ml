open Printf
open Scanf

let solve s t =
  let l = min (String.length s) (String.length t) in
  let rec loop i =
    if i < l && s.[i] = t.[i] then loop (i + 1) else i + 1 in
  if s = t then 0 else loop 0

let () =
  scanf "%s %s " solve |> printf "%d\n"
