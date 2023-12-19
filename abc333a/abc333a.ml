open Printf
open Scanf

let solve n =
  String.concat "" @@ List.init n @@ fun _ -> string_of_int n

let () =
  scanf "%d " solve |> printf "%s\n"
