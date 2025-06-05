open Printf
open Scanf

let solve n ars art =
  let rot (i, j) = (n - 1 - j, i) in
  let rot2 (i, j) = rot @@ rot (i, j) in
  let rot3 (i, j) = rot @@ rot @@ rot (i, j) in
  let rec loop c0 c1 c2 c3 i j =
    if i = n then min (min c0 (c1 + 1)) (min (c2 + 2) (c3 + 3))
    else if j = n then loop c0 c1 c2 c3 (i + 1) 0
    else begin
        let d0 = if ars.(i).[j] = art.(i).[j] then 0 else 1 in
        let d1 = let (ii, jj) = rot (i, j) in
                 if ars.(ii).[jj] = art.(i).[j] then 0 else 1 in
        let d2 = let (ii, jj) = rot2 (i, j) in
                 if ars.(ii).[jj] = art.(i).[j] then 0 else 1 in
        let d3 = let (ii, jj) = rot3 (i, j) in
                 if ars.(ii).[jj] = art.(i).[j] then 0 else 1 in
        loop (c0 + d0) (c1 + d1) (c2 + d2) (c3 + d3) i (j + 1)
      end in
  loop 0 0 0 0 0 0

let () =
  let id x = x in
  scanf "%d " (fun n ->
      let ars = Array.init n (fun _ -> scanf "%s " id) in
      let art = Array.init n (fun _ -> scanf "%s " id) in
      solve n ars art)
  |> printf "%d\n"
