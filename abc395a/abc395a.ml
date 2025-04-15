open Printf
open Scanf

let solve n a =
  let rec loop i =
    if i = n then "Yes"
    else if a.(i-1) < a.(i) then loop (i + 1)
    else "No"
  in loop 1

let () =
  scanf "%d " (fun n ->
    Array.init n (fun _ -> scanf "%d " @@ fun x -> x) |> solve n) |> printf "%s\n"
