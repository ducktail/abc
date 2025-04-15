open Printf
open Scanf

let solve la =
  let rec loop l =
    match l with
      a::b::c::_ when a = b && b = c -> "Yes"
    | a::b::c::rs -> loop (b::c::rs)
    | _ -> "No" in
  loop la

let () =
  scanf "%d " (fun n ->
    List.init n (fun _ -> scanf "%d " @@ fun x -> x) |> solve) |> printf "%s\n"
