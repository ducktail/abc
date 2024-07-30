open Printf
open Scanf

let solve n ls =
  let f (x, y) s =
    if y = 2 then (x, y)
    else if s = "sweet" then (x + 1, y + 1)
    else (x + 1, 0) in
  let (ct , _) = List.fold_left f (0, 0) ls in
  if ct = n then "Yes" else "No"

let () =
  let id x = x in
  scanf "%d " (fun n ->
    List.init n (fun _ -> scanf "%s " id) |> solve n) |> printf "%s\n"
