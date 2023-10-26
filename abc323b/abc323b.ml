open Printf
open Scanf

let count_o s =
  let len = String.length s in
  let rec loop cnt i =
    if i >= len then cnt
    else if s.[i] = 'o' then loop (cnt + 1) (i + 1)
    else loop cnt (i + 1) in
  loop 0 0

let solve n ls =
  let rec loop i la ls =
    if i > n then la
    else loop (i + 1) ((i, (count_o (List.hd ls))) :: la) (List.tl ls) in
  List.map fst @@ List.sort (fun (x, a) (y, b) -> if a = b then compare x y else compare b a) (loop 1 [] ls)

let () =
  let id x = x in
  scanf "%d " (fun n ->
      (List.init n (fun _ -> scanf "%s " id)) |> solve n)
  |> List.map string_of_int |> String.concat " " |> printf "%s\n"
