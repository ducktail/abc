open Printf
open Scanf

let solve n a =
  let ac = Array.make n 0 in
  let rec loop i =
    if i = n then Array.fold_left (+) 0 ac
    else if i = 0 then begin
        ac.(0) <- 1 ;
        loop (i + 1)
      end
    else if i = 1 then begin
        ac.(1) <- 2 ;
        loop (i + 1)
      end
    else if a.(i) - a.(i - 1) = a.(i - 1) - a.(i - 2) then begin
        ac.(i) <- ac.(i - 1) + 1 ;
        loop (i + 1)
      end
    else begin
        ac.(i) <- 2 ;
        loop (i + 1)
      end in
  loop 0

let () =
  let id x = x in
  scanf "%d " (fun n ->
    Array.init n (fun _ -> scanf "%d " id) |> solve n) |> printf "%d\n"
