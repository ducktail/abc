open Printf
open Scanf

let solve s =
  let l = ["ACE"; "BDF"; "CEG"; "DFA"; "EGB"; "FAC"; "GBD"] in
  match List.find_opt (fun x -> x = s) l with
    Some _ -> "Yes"
  | None -> "No"

let () =
  scanf "%s " solve |> printf "%s\n"
