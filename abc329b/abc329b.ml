open Printf
open Scanf

module IntSet = Set.Make(
                    struct
                      type t = int
                      let compare = compare
                    end)

let solve l =
  let st = IntSet.of_list l in
  let mx = IntSet.max_elt st in
  IntSet.max_elt @@ IntSet.remove mx st

let () =
  let id x = x in
  scanf "%d " (fun n ->
    List.init n (fun _ -> scanf "%d " id)) |> solve |> printf "%d\n"
