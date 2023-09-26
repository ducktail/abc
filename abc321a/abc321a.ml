open Printf
open Scanf

let solve n =
  let l = String.length n in
  let rec loop i =
    if i = l then "Yes"
    else if n.[i - 1] > n.[i] then loop (i + 1)
    else "No" in
  loop 1

let () =
  scanf "%s " solve |> printf "%s\n"
