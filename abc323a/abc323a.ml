open Printf
open Scanf

let solve s =
  let rec loop i =
    if i > 15 then "Yes"
    else if s.[i] = '0' then loop (i + 2)
    else "No" in
  loop 1

let () =
  scanf "%s " solve |> printf "%s\n"
