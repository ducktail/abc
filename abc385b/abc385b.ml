open Printf
open Scanf

module PSet = Set.Make (
                  struct
                    type t = int * int
                    let compare = compare
                  end
                )

let solve h w x y fld t =
  let np (r, c) d =
    match d with
      'U' -> (r - 1, c)
    | 'D' -> (r + 1, c)
    | 'L' -> (r , c - 1)
    | _ -> (r, c + 1) in
  let rec loop i r c st =
    if i = String.length t then sprintf "%d %d %d" (r + 1) (c + 1) (PSet.cardinal st)
    else
      let (nr, nc) = np (r, c) t.[i] in
      if fld.(nr).[nc] = '.' then loop (i + 1) nr nc st
      else if fld.(nr).[nc] = '@' then loop (i + 1) nr nc (PSet.add (nr, nc) st)
      else loop (i + 1) r c st in
  loop 0 (x - 1) (y - 1) PSet.empty

let () =
  scanf "%d %d %d %d " (fun h w x y ->
      let fld = Array.init h (fun _ -> scanf "%s " @@ fun x -> x) in
    scanf "%s " (fun x -> x) |> solve h w x y fld) |> printf "%s\n"
