open Printf
open Scanf

let solve s =
  let n = int_of_string @@ String.sub s 3 3 in
  if n = 0 then "No"
  else if n = 316 then "No"
  else if n >= 350 then "No"
  else "Yes"

let () =
  scanf "%s " solve |> printf "%s\n"
