open Printf
open Scanf

let solve l =
  let rec loop l =
    match l with
      a :: b :: c when a + 2 = b -> (a + b) / 2
    | a :: b -> loop b
    | a -> loop a in
  loop @@ List.sort compare l

let () =
  let id x = x in
  scanf "%d " (fun n ->
    List.init n (fun _ -> scanf "%d " id) |> solve) |> printf "%d\n"
