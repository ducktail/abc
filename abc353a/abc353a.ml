open Printf
open Scanf

let solve n lh =
  let h = List.hd lh in
  let rec loop i l =
    if i > n then (-1)
    else if h < (List.hd l) then i
    else loop (i + 1) (List.tl l) in
  loop 2 (List.tl lh)

let () =
  scanf "%d " (fun n ->
    List.init n (fun _ -> scanf "%d " @@ fun x -> x) |> solve n) |> printf "%d\n"
