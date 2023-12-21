open Printf
open Scanf

let solve ss tt =
  let to_num x =
    match x with
      'A' -> 0
    | 'B' -> 1
    | 'C' -> 2
    | 'D' -> 3
    | _ -> 4 in
  let dist x y =
    let l = abs (to_num x - to_num y) in
    min l (5 - l) in
  if dist ss.[0] ss.[1] = dist tt.[0] tt.[1] then "Yes" else "No"

let () =
  scanf "%s %s " solve |> printf "%s\n"
