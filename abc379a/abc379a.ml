open Printf
open Scanf

let solve n =
  let a = n / 100 in
  let bc = n mod 100 in
  let ab = n / 10 in
  let c = n mod 10 in
  [bc * 10 + a; c * 100 + ab]

let () =
  scanf "%d " solve |> List.map string_of_int |> String.concat " " |> printf "%s\n"
