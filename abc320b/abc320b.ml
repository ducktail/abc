open Printf
open Scanf

let is_palindrome s =
  let l = String.length s in
  let rec loop li ri =
    if li >= ri then true
    else if s.[li] = s.[ri] then loop (li + 1) (ri - 1)
    else false in
  loop 0 (l - 1)

let solve s =
  let los = String.length s in
  let rec loop l i =
    if l + i > los then loop (l - 1) 0
    else if is_palindrome (String.sub s i l) then l
    else loop l (i + 1) in
  loop los 0

let () =
  scanf "%s " solve |> printf "%d\n"
