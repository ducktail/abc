open Printf
open Scanf

let solve a =
  match List.sort compare a with
  | x :: y :: z :: _ when x * y = z -> "Yes"
  | _ -> "No"

let () =
  List.init 3 (fun _ -> scanf "%d " @@ fun x -> x) |> solve |> printf "%s\n"
