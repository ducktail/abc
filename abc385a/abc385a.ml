open Printf
open Scanf

let solve a b c =
  match List.sort compare [a; b; c] with
    [sa; sb; sc] -> if sa = sc || sa + sb = sc then "Yes" else "No"
  | _ -> "No Future"

let () =
  scanf "%d %d %d " solve |> printf "%s\n"
