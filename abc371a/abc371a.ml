open Printf
open Scanf

let solve sab sac sbc =
  if sab <> sac then 'A'
  else if sac = sbc then 'B'
  else 'C'

let () =
  scanf "%c %c %c " solve |> printf "%c\n"
