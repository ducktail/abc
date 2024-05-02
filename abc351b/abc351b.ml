open Printf
open Scanf

let solve n aa ab =
  let rec loopi i =
    if i = n then ()
    else begin
        let rec loopj j =
          if j = n then ()
          else begin
              if aa.(i).[j] = ab.(i).[j] then () else printf "%d %d\n" (i + 1) (j + 1) ;
              loopj (j + 1)
            end in
        loopj 0 ;
        loopi (i + 1)
      end in
  loopi 0

let () =
  let id x = x in
  scanf "%d " (fun n ->
      let aa = Array.init n (fun _ -> scanf "%s " id) in
    let ab = Array.init n (fun _ -> scanf "%s " id) in
    solve n aa ab)
