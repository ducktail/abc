open Printf
open Scanf

let solve la =
  let rec loop l =
    match l with
      _ :: [] -> "Yes"
    | a :: b :: bs when a = b -> loop (b :: bs)
    | _ -> "No" in
  loop la
            
let () =
  let id x = x in
  scanf "%d " (fun n ->
      List.init n (fun _ -> scanf "%d " id) |> solve) |> printf "%s\n"
