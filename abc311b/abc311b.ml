open Printf
open Scanf

let solve n d ls =
  let a = Array.make d 0 in
  List.iter (fun s ->
      let rec loop i =
        if i >= d then ()
        else if s.[i] = 'o' then (a.(i) <- a.(i) + 1 ; loop (i + 1))
        else loop (i + 1) in
      loop 0
    ) ls ;
  Array.fold_left (fun (h, mxh) x ->
      if x = n then (h + 1, mxh) else (0, max h mxh)) (0, 0) a |> fun (a, b) -> max a b
    

let () =
  let id x = x in
  scanf "%d %d " (fun n d ->
    List.init n (fun _ -> scanf "%s " id) |> solve n d) |> printf "%d\n"
