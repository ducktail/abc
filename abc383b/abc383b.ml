open Printf
open Scanf

let dist (x0, y0) (x1, y1) =
  abs (x0 - x1) + abs (y0 - y1)
                    
let solve h w d a =
  let n = h * w in
  let rec loop i j k c mc =
    if i >= n then mc
    else if j >= n then loop (i + 1) (i + 2) 0 0 mc
    else if k >= n then loop i (j + 1) 0 0 (max c mc)
    else let hi = i / w in
         let wi = i mod w in
         let hj = j / w in
         let wj = j mod w in
         let hk = k / w in
         let wk = k mod w in
         if a.(hi).[wi] = '.' &&
              a.(hj).[wj] = '.' &&
                a.(hk).[wk] = '.' &&
                  (dist (hi, wi) (hk, wk) <= d || dist (hj, wj) (hk, wk) <= d) then loop i j (k + 1) (c + 1) mc
         else loop i j (k + 1) c mc in
  loop 0 1 0 0 0

let () =
  scanf "%d %d %d " (fun h w d ->
    Array.init h (fun _ -> scanf "%s " @@ fun x -> x) |> solve h w d) |> printf "%d\n"
