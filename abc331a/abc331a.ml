open Printf
open Scanf

let solve mm dd y m d =
  if mm = m && dd = d then [y + 1; 1; 1]
  else if dd = d then [y; m + 1; 1]
  else [y; m; d + 1]

let () =
  scanf "%d %d %d %d %d " solve |> List.map string_of_int |> String.concat " " |> printf "%s\n"
