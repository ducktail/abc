open Printf
open Scanf

let solve n =
  if n mod 2 = 1 then String.init n (fun i -> if i = n / 2 then '=' else '-')
  else String.init n (fun i -> if i = n / 2 || i = n / 2 - 1 then '=' else '-')

let () =
  scanf "%d " solve |> printf "%s\n"
