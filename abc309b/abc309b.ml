open Printf
open Scanf

let array_of_string s =
  let len = String.length s in
  Array.init len (fun i -> s.[i])

let string_of_array a =
  let len = Array.length a in
  String.init len (fun i -> a.(i))

let solve n a =
  let t = a.(0).(0) in
  let rec loop1 i =
    if i = n - 1 then ()
    else begin
        a.(i).(0) <- a.(i + 1).(0) ;
        loop1 (i + 1)
      end in
  let rec loop2 i =
    if i = n - 1 then ()
    else begin
        a.(n - 1).(i) <- a.(n - 1).(i + 1) ;
        loop2 (i + 1)
      end in
  let rec loop3 i =
    if i = 0 then ()
    else begin
        a.(i).(n - 1) <- a.(i - 1).(n - 1) ;
        loop3 (i - 1)
      end in
  let rec loop4 i =
    if i = 0 then ()
    else begin
        a.(0).(i) <- a.(0).(i - 1) ;
        loop4 (i - 1)
      end in
  loop1 0 ;
  loop2 0 ;
  loop3 (n - 1) ;
  loop4 (n - 1) ;
  a.(0).(1) <- t ;
  a

let () =
  scanf "%d " (fun n ->
    Array.init n (fun _ -> scanf "%s " array_of_string) |> solve n) |>
    Array.iter (fun a -> printf "%s\n" @@ string_of_array a)
