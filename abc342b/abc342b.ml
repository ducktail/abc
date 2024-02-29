open Printf
open Scanf

let solve n ap lq =
  let a = Array.make (n + 1) 0 in
  let rec loop i =
    if i = n then ()
    else begin
        a.(ap.(i)) <- i ;
        loop (i + 1)
      end in
  loop 0 ;
  let f l = match l with
      [x ; y] -> if a.(x) < a.(y) then x else y
    | _ -> 0 in
  List.map f lq

let () =
  scanf "%d " (fun n ->
    let ap = Array.init n (fun _ -> scanf "%d " @@ fun x -> x) in
    let q = scanf "%d " @@ fun x -> x in
    let lq = List.init q (fun _ -> List.init 2 (fun _ -> scanf "%d " @@ fun x -> x)) in
    solve n ap lq) |> List.iter @@ printf "%d\n"
