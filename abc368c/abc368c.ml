open Printf
open Scanf

let solve lh =
  let rec loop t l =
    match l with
      h :: r -> if h >= 5 then loop (t + h / 5 * 3) (h mod 5 :: r)
                else if h <= 0 then loop t r
                else if (t + 1) mod 3 = 0 then loop (t + 1) (h - 3 :: r)
                else loop (t + 1) (h - 1 :: r)
    | [] -> t in
  loop 0 lh
       
let () =
  let id x = x in
  scanf "%d " (fun n ->
      List.init n (fun _ -> scanf "%d " id)) |> solve |> printf "%d\n"
