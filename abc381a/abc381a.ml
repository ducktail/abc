open Printf
open Scanf

let solve n s =
  let n2 = n / 2 in
  if String.sub s 0 n2 = String.make n2 '1' &&
       String.sub s (n2 + 1) (n - n2 - 1)= String.make n2 '2' &&
         s.[n2] = '/' then "Yes" else "No"

let () =
  scanf "%d %s " solve |> printf "%s\n"
