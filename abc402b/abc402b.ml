open Printf
open Scanf

let () =
  let que = Queue.create () in
  scanf "%d " (fun q ->
    let rec loop i =
      if i = 0 then ()
      else begin
          scanf "%d " (fun c ->
              if c = 1 then scanf "%d " (fun x ->
                                Queue.push x que)
              else printf "%d\n" @@ Queue.pop que
            ) ;
          loop (i - 1)
        end
    in loop q)
