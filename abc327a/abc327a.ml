open Printf
open Scanf

let solve n s =
  let rec loop i =
    if i = n then "No"
    else let ss = String.sub s (i - 1) 2 in
         if ss = "ab" then "Yes"
         else if ss = "ba" then "Yes"
         else loop (i + 1) in
  loop 1

let () =
  scanf "%d %s" solve |> printf "%s\n"
