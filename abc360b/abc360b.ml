open Printf
open Scanf

let solve s t =
  let los = String.length s in
  let rec loop w i =
    if w = los then "No"
    else if i = w then loop (w + 1) 0
    else let l = (los - i + w - 1) / w in
         let ns = String.init l (fun j -> s.[i + j * w]) in
         if ns = t then "Yes"
         else loop w (i + 1) in
  loop 1 0

let () =
  scanf "%s %s " solve |> printf "%s\n"
