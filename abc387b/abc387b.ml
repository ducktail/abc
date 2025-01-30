open Printf
open Scanf

let solve n =
  let a = Array.make 82 0 in
  let rec loop i j =
    if i = 10 then ()
    else if j = 10 then loop (i + 1) 1
    else begin
        a.(i * j) <- a.(i * j) + (i * j);
        loop i (j + 1)
      end in
  loop 1 1;
  2025 - a.(n)

let () =
  scanf "%d " solve |> printf "%d\n"
