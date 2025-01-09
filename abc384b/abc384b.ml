open Printf
open Scanf

let solve r lda =
  let f rn (d, a) =
    match d with
      1 -> if 1600 <= rn && rn < 2800 then rn + a else rn
    | 2 -> if 1200 <= rn && rn < 2400 then rn + a else rn
    | _ -> 0
  in
  List.fold_left f r lda

let () =
  scanf "%d %d " (fun n r ->
    List.init n (fun _ -> scanf "%d %d " (fun d a -> (d, a))) |> solve r) |> printf "%d\n"
