open Printf
open Scanf

let () =
  let id x = x in
  scanf "%d " (fun q ->
      let rec loop x st =
        if x = 0 then ()
        else begin
            let c = scanf "%d " id in
            if c = 1 then begin
                let d = scanf "%d " id in
                loop (x - 1) (d :: st)
              end
            else begin
                match st with
                  h :: t -> begin
                    printf "%d\n" h;
                    loop (x - 1) t
                  end
                | _ -> begin
                    printf "0\n";
                    loop (x - 1) st
                  end
              end
          end in
      loop q [])
