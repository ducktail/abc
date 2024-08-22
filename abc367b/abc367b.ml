open Printf
open Scanf

let solve x =
  let l = String.length x in
  if String.sub x (l - 3) 3 = "000" then String.sub x 0 (l - 4)
  else if String.sub x (l - 2) 2 = "00" then String.sub x 0 (l - 2)
  else if String.sub x (l - 1) 1 = "0" then String.sub x 0 (l - 1)
  else x

let () =
  scanf "%s " solve |> printf "%s\n"
