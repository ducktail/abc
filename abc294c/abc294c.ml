open Printf
open Scanf

let solve la lb =
  let rec loop lx ly i la lb =
    match (la, lb) with
      ([], []) -> List.map (fun l -> String.concat " " @@ List.map string_of_int @@ List.rev l) [lx; ly]
    | (a::ra, []) -> loop (i::lx) ly (i + 1) ra lb
    | ([], b::rb) -> loop lx (i::ly) (i + 1) la rb
    | (a::ra, b::rb) when a < b -> loop (i::lx) ly (i + 1) ra lb
    | (a::ra, b::rb) -> loop lx (i::ly) (i + 1) la rb in
  loop [] [] 1 la lb

let () =
  let id x = x in
  scanf "%d %d " (fun n m ->
      let la = List.init n (fun _ -> scanf "%d " id) in
      let lb = List.init m (fun _ -> scanf "%d " id) in
      solve la lb)
  |> List.iter @@ printf "%s\n"
