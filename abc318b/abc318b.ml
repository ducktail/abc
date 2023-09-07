open Printf
open Scanf

let solve l =
  let ar = Array.init 101 (fun _ -> Array.init 101 (fun _ -> 0)) in
  let rec loop1 x y =
    if y > 100 then ()
    else if x > 99 then loop1 0 (y + 1)
    else begin
        ar.(x + 1).(y) <- ar.(x + 1).(y) + ar.(x).(y) ;
        loop1 (x + 1) y
      end in
  let rec loop2 x y =
    if x > 100 then ()
    else if y > 99 then loop2 (x + 1) 0
    else begin
        ar.(x).(y + 1) <- ar.(x).(y + 1) + ar.(x).(y) ;
        loop2 x (y + 1)
      end in
  let rec loop3 x y ct =
    if y > 100 then ct
    else if x > 100 then loop3 0 (y + 1) ct
    else if ar.(x).(y) > 0 then loop3 (x + 1) y (ct + 1)
    else loop3 (x + 1) y ct in
  List.iter (fun (a, b, c, d) ->
    ar.(a).(c) <- ar.(a).(c) + 1 ;
    ar.(b).(d) <- ar.(b).(d) + 1 ;
    ar.(a).(d) <- ar.(a).(d) - 1 ;
    ar.(b).(c) <- ar.(b).(c) - 1) l ;
  loop1 0 0 ;
  loop2 0 0 ;
  loop3 0 0 0
  
let () =
  scanf "%d " (fun n ->
    List.init n (fun _ -> scanf "%d %d %d %d " (fun a b c d -> (a, b, c, d))) |> solve) |> printf "%d\n"
