open Printf
open Scanf

let solve ls =
  List.filter (fun s -> s = "Takahashi") ls |> List.length

let () =
  let id x = x in
  scanf "%d " (fun n ->
    List.init n (fun _ -> scanf "%s " id)) |> solve |> printf "%d\n"
