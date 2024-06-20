open Printf
open Scanf

let solve a st =
  Seq.scan (fun ct t -> a + max ct t) 0 st |> Seq.drop 1

let () =
  let id x = x in
  scanf "%d %d " (fun n a ->
    Seq.init n (fun _ -> scanf "%d " id) |> solve a) |> Seq.iter @@ printf "%d\n"
