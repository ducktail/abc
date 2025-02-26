open Printf
open Scanf

let solve l =
  let rec loop l =
    match l with
      a :: b :: c :: ld when b * b = a * c -> loop (b :: c :: ld)
    | a :: b :: [] -> "Yes"
    | _ -> "No" in
  loop l

let () =
  scanf "%d " (fun n ->
    List.init n (fun _ -> scanf "%d " @@ fun x -> x) |> solve) |> printf "%s\n"
