open Printf
open Scanf

let solve m s =
  let dec x = x - 1 in
  dec @@ Seq.length @@ Seq.take_while (fun x -> x <= m) @@ Seq.scan (+) 0 s

let () =
  let id x = x in
  scanf "%d %d " (fun n m ->
      Seq.init n (fun _ -> scanf "%d " @@ id) |> solve m) |> printf "%d\n"

