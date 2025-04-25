open Printf
open Scanf

let solve s =
  let ls = String.length s in
  let ic =
    let rec loop i c =
      if i = ls - 1 then c
      else if s.[i] = s.[i + 1] then loop (i + 1) (c + 1)
      else loop (i + 1) c in
    loop 0 0 in
  if (ls + ic) mod 2 = 1 then ic + 1
  else if s.[0] = 'o' then ic + 2
  else ic

let () =
  scanf "%s " solve |> printf "%d\n"
