open Printf
open Scanf

let solve n =
  let a = Array.make 10 0 in
  let sq = Seq.unfold (fun x -> if x = 0 then None else Some (x mod 10, x / 10)) n in
  Seq.iter (fun x -> a.(x) <- a.(x) + 1) sq ;
  if a.(1) = 1 && a.(2) = 2 && a.(3) = 3 then "Yes" else "No"

let () =
  scanf "%d " solve |> printf "%s\n"
