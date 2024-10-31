open Printf
open Scanf

let solve astr =
  let n = 8 in
  let avr = Array.make n 1 in
  let ahr = Array.make n 1 in
  let sum = Array.fold_left (+) 0 in
  let rec loop i j =
    if i = n then (sum avr) * (sum ahr)
    else if j = n then loop (i + 1) 0
    else if astr.(i).[j] = '#' then begin
        ahr.(j) <- 0;
        avr.(i) <- 0;
        loop i (j + 1)
      end
    else loop i (j + 1) in
  loop 0 0

let () =
  let id x = x in
  Array.init 8 (fun _ -> scanf "%s " id) |> solve |> printf "%d\n"
