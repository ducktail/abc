open Printf
open Scanf

let solve n m ars art =
  let rec find sr sc =
    let rec loop r c =
      if r = m then true
      else if c = m then loop (r + 1) 0
      else if art.(r).[c] = ars.(r + sr).[c + sc] then loop r (c + 1)
      else false in
    loop 0 0 in
  let rec loop sr sc =
    if sr > n - m then ""
    else if sc > n - m then loop (sr + 1) 0
    else if find sr sc then sprintf "%d %d" (sr + 1) (sc + 1)
    else loop sr (sc + 1) in
  loop 0 0

let () =
  let id x = x in
  scanf "%d %d " (fun n m ->
      let ars = Array.init n (fun _ -> scanf "%s " id) in
      let art = Array.init m (fun _ -> scanf "%s " id) in
      solve n m ars art
    )|> printf "%s\n"
