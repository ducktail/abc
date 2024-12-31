open Printf
open Scanf

let solve tv =
  let f (ti, vi) (tj, vj) =
    (tj, vj + max 0 (vi - tj + ti)) in
  snd @@ List.fold_left f (0, 0) tv

let () =
  scanf "%d " (fun n ->
    List.init n (fun _ -> scanf "%d %d " (fun t v -> (t, v))) |> solve) |> printf "%d\n"
