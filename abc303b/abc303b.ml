open Printf
open Scanf

let solve n m a =
  let am = Array.init (n + 1) (fun _ -> Array.init (n + 1) (fun _ -> true)) in
  let rec loop1 i j =
    if i >= m then ()
    else if j >= n - 1 then loop1 (i + 1) 0
    else begin
        am.(a.(i).(j)).(a.(i).(j + 1)) <- false ;
        am.(a.(i).(j + 1)).(a.(i).(j)) <- false ;
        loop1 i (j + 1)
      end in
  let rec loop2 i j ct =
    if i >= n then ct
    else if j > n then loop2 (i + 1) (i + 2) ct
    else if am.(i).(j) then loop2 i (j + 1) (ct + 1)
    else loop2 i (j + 1) ct in
  loop1 0 0 ; loop2 1 2 0

let () =
  let id x = x in
  scanf "%d %d " (fun n m ->
      Array.init m (fun _ ->
          Array.init n (fun _ -> scanf "%d " id)) |> solve n m) |> printf "%d\n"
