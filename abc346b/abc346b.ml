open Printf
open Scanf

let solve w b =
  let aa = [|0;1;1;2;2;3;4;4;5;5;6;6;7;8;8;9;9;10;11;11;12;12;13|] in
  let (q, r) = ((w + b) / 12, (w + b) mod 12) in
  let rec loop i =
    if i = 12 then "No"
    else if q * 7 + aa.(r + i) - aa.(i) = w then "Yes"
    else loop (i + 1) in
  loop 0

let () =
  scanf "%d %d " solve |> printf "%s\n"
