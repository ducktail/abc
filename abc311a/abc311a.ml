open Printf
open Scanf

let solve n s =
  let rec loop i a b c =
    if a && b && c then i
    else if s.[i] = 'A' then loop (i + 1) true b c
    else if s.[i] = 'B' then loop (i + 1) a true c
    else loop (i + 1) a b true in
  loop 0 false false false

let () =
  scanf "%d %s " solve |> printf "%d\n"
