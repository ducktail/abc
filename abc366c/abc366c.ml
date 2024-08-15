open Printf
open Scanf

let () =
  let id x = x in
  scanf "%d " (fun q ->
      let a = Array.make 1000001 0 in
      let rec loop i ct =
        if i = 0 then ()
        else 
          let c = scanf "%d " id in
          if c = 1 then
            let x = scanf "%d " id in
            if a.(x) = 0 then begin
                a.(x) <- 1 ;
                loop (i - 1) (ct + 1)
              end
            else begin
                a.(x) <- a.(x) + 1 ;
                loop (i - 1) ct
              end
          else if c = 2 then
            let x = scanf "%d " id in
            if a.(x) = 1 then begin
                a.(x) <- 0 ;
                loop (i - 1) (ct - 1)
              end
            else begin
                a.(x) <- a.(x) - 1 ;
                loop (i - 1) ct
              end
          else begin
              printf "%d\n" ct ;
              loop (i - 1) ct
            end
      in loop q 0
    )
