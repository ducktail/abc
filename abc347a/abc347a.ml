open Printf
open Scanf

let solve k l =
  List.map (fun x -> x / k) @@ List.filter (fun x -> x mod k = 0) l

let () =
  scanf "%d %d " (fun n k ->
    List.init n (fun _ -> scanf "%d " @@ fun x -> x) |> solve k )
  |> List.map string_of_int
  |> String.concat " "
  |> printf "%s\n"
