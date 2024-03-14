open Printf
open Scanf

let () =
  let rec loop l =
    let a = scanf "%d " @@ fun x -> x in
    if a = 0 then 0 :: l
    else loop (a :: l) in
  loop [] |> List.iter @@ printf "%d\n"
