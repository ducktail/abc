open Printf
open Scanf

let solve m =
  let rec loop x i =
    if x = 0 then []
    else match (x / 3, x mod 3) with
           (q, 0) -> loop q (i + 1)
         | (q, 1) -> i :: loop q (i + 1)
         | (q, _) -> i :: i :: loop q (i + 1)
  in loop m 0

let () =
  scanf "%d " solve |> fun la -> printf "%d\n" @@ List.length la ;
                                 printf "%s\n" @@ String.concat " " @@ List.map string_of_int la
