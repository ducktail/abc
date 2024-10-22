open Printf
open Scanf

let solve n s =
  let rec loop i c =
    if i > n - 3 then c
    else if String.sub s i 3 = "#.#" then loop (i + 1) (c + 1)
    else loop (i + 1) c in
  loop 0 0

let () =
  scanf "%d %s " solve |> printf "%d\n"
