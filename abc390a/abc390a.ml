open Printf
open Scanf

let solve a1 a2 a3 a4 a5 =
  let ls = [[2;1;3;4;5];[1;3;2;4;5];[1;2;4;3;5];[1;2;3;5;4]] in
  if List.mem [a1;a2;a3;a4;a5] ls then "Yes" else "No"

let () =
  scanf "%d %d %d %d %d " solve |> printf "%s\n"
