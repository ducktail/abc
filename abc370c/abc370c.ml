open Printf
open Scanf

module WordLadder =
  struct
    let rec fold_right f v i j =
      if i = j then v
      else f i (fold_right f v (i + 1) j)
    
    let solve s t =
      let len = String.length s in
      let rec loop x l =
        if x = t then List.rev l
        else
          let y = fold_right (fun i z ->
                      if x.[i] = t.[i] then z
                      else (String.init len (fun j -> if i = j then t.[j] else x.[j]) :: z)
                    ) [] 0 len |> List.sort compare |> List.hd in
          loop y (y :: l) in
      loop s []
  end

let () =
  scanf "%s %s " WordLadder.solve |> (fun l -> printf "%d\n" (List.length l) ; List.iter (printf "%s\n") l)
