open Printf
open Scanf

let solve n l =
  snd (List.nth (List.sort compare l) (n - 2))

let () =
  scanf "%d " (fun n ->
    List.init n (fun i -> scanf "%d " (fun x -> (x, i + 1))) |> solve n) |> printf "%d\n"
