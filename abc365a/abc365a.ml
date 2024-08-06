open Printf
open Scanf

let is_leap_year y =
  y mod 400 = 0 || y mod 100 > 0 && y mod 4 = 0

let solve y =
  if is_leap_year y then 366 else 365

let () =
  scanf "%d " solve |> printf "%d\n"
