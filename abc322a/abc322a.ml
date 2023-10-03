open Printf
open Scanf

let solve n s =
  let rec loop i =
    if i > n - 2 then -1
    else if String.sub s (i - 1) 3 = "ABC" then i
    else loop (i + 1) in
  loop 1

let () =
  scanf "%d %s " solve |> printf "%d\n"
