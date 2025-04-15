open Printf
open Scanf

let solve ls =
  String.concat "" @@ List.sort (fun a b -> compare (String.length a) (String.length b)) ls

let () =
  scanf "%d " (fun n ->
    List.init n (fun _ -> scanf "%s " @@ fun x -> x)) |> solve |> printf "%s\n"
