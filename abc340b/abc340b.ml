open Printf
open Scanf

let solve q =
  let rec loop i l =
    if i = 0 then ()
    else begin
        scanf "%d %d " (fun c x ->
            if c = 1 then loop (i - 1) (x :: l)
            else begin
                printf "%d\n" @@ List.nth l (x - 1) ;
                loop (i - 1) l
              end
          )
      end
  in loop q []

let () =
  scanf "%d " solve
