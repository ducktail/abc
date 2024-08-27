open Printf
open Scanf

module L =
  struct
    include List
  
    let rec split_at n l =
      if n = 0 then ([], l)
      else match l with
             [] -> ([], [])
           | h :: t -> let (la, lb) = split_at (n - 1) t in
                       (h :: la, lb)
  end

let solve n k la =
  let (lx, ly) = L.split_at (n - k) la in
  ly @ lx

let () =
  let id x = x in
  scanf "%d %d " (fun n k ->
      List.init n (fun _ -> scanf "%d " id) |> solve n k) |>
    List.map string_of_int |> String.concat " " |> printf "%s\n"
