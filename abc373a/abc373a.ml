open Printf
open Scanf

let solve ls =
  let rec loop l i ct =
    match l with
      s :: r -> if String.length s = i then loop r (i + 1) (ct + 1) else loop r (i + 1) ct
    | [] -> ct in
  loop ls 1 0

let () =
  let id x = x in
  List.init 12 (fun _ ->
    scanf "%s " id) |> solve |> printf "%d\n"
