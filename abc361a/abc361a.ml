open Printf
open Scanf

let solve x ly lx =
  ly @ x :: lx

let () =
  let id x = x in
  scanf "%d %d %d " (fun n k x ->
    let ly = List.init k (fun _ -> scanf "%d " id) in
    let lx = List.init (n - k) (fun _ -> scanf "%d " id) in
    solve x ly lx) |> List.map string_of_int |> String.concat " " |> printf "%s\n"
