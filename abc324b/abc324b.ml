open Printf
open Scanf

let solve n =
  let rec divn n x =
    if x mod n = 0 then divn n (x / n) else x in
  if divn 3 (divn 2 n) = 1 then "Yes" else "No"

let () =
  scanf "%d " solve |> printf "%s\n"
