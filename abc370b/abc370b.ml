open Printf
open Scanf

let solve n aa =
  let rec loop i j =
    if j > n then i
    else if i >= j then loop aa.(i - 1).(j - 1) (j + 1)
    else loop aa.(j - 1).(i - 1) (j + 1) in
  loop 1 1

let () =
  let id x = x in
  scanf "%d " (fun n ->
    Array.init n (fun i ->
    Array.init (i + 1) (fun _ -> scanf "%d " id)) |> solve n) |> printf "%d\n"
