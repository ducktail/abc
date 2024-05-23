open Printf
open Scanf

let solve n asc =
  Array.sort (fun x y -> compare (fst x) (fst y)) asc ;
  let t = Array.fold_left (fun ct x -> ct + snd x) 0 asc in
  fst @@ asc.(t mod n)

let () =
  scanf "%d " (fun n ->
    Array.init n (fun _ -> scanf "%s %d " @@ fun s c -> (s, c)) |> solve n) |> printf "%s\n"
