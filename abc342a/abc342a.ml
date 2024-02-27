open Printf
open Scanf

let solve s =
  if s.[0] = s.[1] then
    let rec loop i =
      if s.[0] = s.[i] then loop (i + 1) else (i + 1) in
    loop 2
  else if s.[0] = s.[2] then 2 else 1

let () =
  scanf "%s " solve |> printf "%d\n"
