open Printf
open Scanf

let solve n la =
  let ht = Hashtbl.create n in
  let f a = match Hashtbl.find_opt ht a with
      Some c -> Hashtbl.replace ht a (c + 1)
    | None -> Hashtbl.replace ht a 1 in
  List.iter f la ;
  Hashtbl.fold (fun _ v c -> c + v / 2) ht 0

let () =
  let id x = x in
  scanf "%d " (fun n ->
    List.init n (fun _ -> scanf "%d " id) |> solve n) |> printf "%d\n"
