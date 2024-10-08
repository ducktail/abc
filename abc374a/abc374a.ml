open Printf
open Scanf

let solve s =
  let l = String.length s in
  if String.sub s (l - 3) 3 = "san" then "Yes" else "No"

let () =
  scanf "%s " solve |> printf "%s\n"
