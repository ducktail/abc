open Printf
open Scanf

let solve la =
  let rec loop ct = function
      x :: y :: z :: tl -> if x = z then loop (ct + 1) (y :: z :: tl) else loop ct (y :: z :: tl)
    | _ -> ct in
  loop 0 la

let () =
  let id x = x in
  scanf "%d " (fun n ->
    List.init (n * 2) (fun _ -> scanf "%d " id)) |> solve |> printf "%d\n"
