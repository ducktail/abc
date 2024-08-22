open Printf
open Scanf

let inc n r a =
  let rec loop i =
    if a.(i) <= r.(i) then true
    else if i = 0 then false
    else begin
        a.(i) <- 1 ;
        a.(i - 1) <- a.(i - 1) + 1 ;
        loop (i - 1)
      end in
  a.(n - 1) <- a.(n - 1) + 1 ;
  loop (n - 1)

let solve n k ar =
  let a = Array.make n 1 in
  let rec loop () =
    if Array.fold_left (+) 0 a mod k = 0 then
      printf "%s\n" (String.concat " " (List.map string_of_int (Array.to_list a)))
    else () ;
    if inc n ar a then loop () else () in
  loop ()

let () =
  let id x = x in
  scanf "%d %d " (fun n k ->
    Array.init n (fun _ -> scanf "%d " id) |> solve n k)
