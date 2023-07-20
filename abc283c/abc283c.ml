open Printf
open Scanf

let solve s =
  let l = String.length s in
  let rec loop i c =
    if i > l - 2 then l - c
    else if s.[i] = '0' && s.[i + 1] = '0' then loop (i + 2) (c + 1)
    else loop (i + 1) c in
  loop 0 0

let () =
  scanf "%s " solve |> printf "%d\n"
