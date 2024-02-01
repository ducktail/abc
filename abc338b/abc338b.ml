open Printf
open Scanf

let solve s =
  let a = Array.make 26 0 in
  let len = String.length s in
  let rec loop1 i =
    if i = len then () else begin
        a.(Char.code s.[i] - Char.code 'a') <- a.(Char.code s.[i] - Char.code 'a') + 1 ;
        loop1 (i + 1)
      end in
  let rec loop2 i c m =
    if i = 26 then Char.chr (Char.code 'a' + c) else
      if m < a.(i) then loop2 (i + 1) i a.(i) else
        loop2 (i + 1) c m in
  loop1 0 ; loop2 0 0 0

let () =
  scanf "%s " solve |> printf "%c\n"
