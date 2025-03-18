open Printf
open Scanf

let solve s =
  let n = String.length s in
  let rec loop l i ct =
    if n <= 2 * l then ct
    else if n <= i + 2 * l then loop (l + 1) 0 ct
    else if s.[i] = 'A' && s.[i + l] = 'B' && s.[i + 2 * l] = 'C' then loop l (i + 1) (ct + 1)
    else loop l (i + 1) ct in
  loop 1 0 0

let () =
  scanf "%s " solve |> printf "%d\n"
