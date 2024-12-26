open Printf
open Scanf

let solve n d s =
  let c = Seq.length @@ Seq.filter (fun c -> c = '@') @@ String.to_seq s in
  n + d - c

let () =
  scanf "%d %d %s " solve |> printf "%d\n"
