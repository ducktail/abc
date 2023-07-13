open Printf
open Scanf

let solve lc ld lp =
  let tbl = List.combine ld (List.tl lp) in
  let f c = match List.assoc_opt c tbl with
      Some x -> x
    | None -> (List.hd lp) in
  List.fold_left (+) 0 @@ List.map f lc

let () =
  scanf "%d %d " (fun n m ->
      let lc = List.init n (fun _ -> scanf "%s " (fun x -> x)) in
      let ld = List.init m (fun _ -> scanf "%s " (fun x -> x)) in
      List.init (m + 1) (fun _ -> scanf "%d " (fun x -> x)) |> solve lc ld) |> printf "%d\n"
