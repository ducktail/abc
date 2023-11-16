open Printf
open Scanf

let zorome i d =
  if i < 10 then
    if d < i then 0
    else if d < i * 11 then 1
    else 2
  else
    if i mod 11 > 0 then 0
    else let j = i / 11 in
         if d < j then 0
         else if d < i then 1
         else 2

let solve n a =
  let rec loop i c =
    if i > n then c
    else loop (i + 1) (zorome i a.(i - 1) + c) in
  loop 1 0

let () =
  let id x = x in
  scanf "%d " (fun n ->
    Array.init n (fun _ -> scanf "%d " id) |> solve n) |> printf "%d\n"
