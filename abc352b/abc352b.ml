open Printf
open Scanf

let solve s t =
  let len = String.length s in
  let rec loop i j =
    if i = len then []
    else if s.[i] = t.[j] then (j + 1) :: loop (i + 1) (j + 1)
    else loop i (j + 1) in
  loop 0 0

let () =
  scanf "%s %s " solve |> List.map string_of_int |> String.concat " " |> printf "%s\n"
