open Printf
open Scanf

let solve l =
  let rec loop l tk ao = match l with
      (x, y) :: r -> loop r (tk + x) (ao + y)
    | _ -> if tk > ao then "Takahashi" else if tk < ao then "Aoki" else "Draw" in
  loop l 0 0

let () =
  scanf "%d " (fun n ->
    List.init n (fun _ -> scanf "%d %d " @@ fun x y -> (x, y))) |> solve |> printf "%s\n"
