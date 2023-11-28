open Printf
open Scanf

let solve l la =
  List.length @@ List.filter (fun x -> x >= l) la

let () =
  let id x = x in
  scanf "%d %d " (fun n l ->
    List.init n (fun _ -> scanf "%d " id) |> solve l) |> printf "%d\n"
