open Printf
open Scanf

let solve n =
  let rec loop i f g =
    if f i then ()
    else begin
        g i ;
        loop (i + 1) f g
      end in
  loop 0 (fun x -> x > n) (fun x ->
      loop 0 (fun y -> y > n || x + y > n) (fun y ->
          loop 0 (fun z -> z > n || x + y + z > n) (fun z ->
    printf "%d %d %d\n" x y z)))

let () =
  scanf "%d " solve
