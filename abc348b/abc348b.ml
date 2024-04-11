open Printf
open Scanf

let solve n ap =
  let ai = Array.make n 0 in
  let al = Array.make n 0 in
  let rec loop i j =
    if i = n then ai
    else if j = n then loop (i + 1) (i + 2)
    else let (ix, iy) = ap.(i) in
         let (jx, jy) = ap.(j) in
         let dx = (ix - jx) in
         let dy = (iy - jy) in
         let l2 = dx * dx + dy * dy in
         if l2 > al.(i) || l2 = al.(i) && j < ai.(i) then begin
             al.(i) <- l2 ;
             ai.(i) <- j
           end ;
         if l2 > al.(j) || l2 = al.(j) && i < ai.(j) then begin
             al.(j) <- l2 ;
             ai.(j) <- i
           end ;
         loop i (j + 1) in
  loop 0 1

let () =
  scanf "%d " (fun n ->
    Array.init n (fun _ ->
    scanf "%d %d " (fun x y -> (x, y))) |> solve n) |> Array.iter (fun i -> printf "%d\n" (i + 1))
