open Printf
open Scanf

let solve n lab =
  let ar = Array.make (n + 1) 0 in
  let f (a, b) =
    if b = 'F' then "No"
    else if ar.(a) = 1 then "No"
    else begin
        ar.(a) <- 1 ;
        "Yes"
      end in
  List.map f lab

let () =
  scanf "%d %d " (fun n m ->
    List.init m (fun _ -> scanf "%d %c " (fun a b -> (a , b))) |> solve n) |> List.iter @@ printf "%s\n"
