open Printf
open Scanf

let solve h w si sj ac sx =
  let f (r, c) x =
    if x = 'L' && c > 0 && ac.(r).[c - 1] = '.' then (r, c - 1)
    else if x = 'R' && c < w - 1 && ac.(r).[c + 1] = '.' then (r, c + 1)
    else if x = 'U' && r > 0 && ac.(r - 1).[c] = '.' then (r - 1, c)
    else if x = 'D' && r < h - 1 && ac.(r + 1).[c] = '.' then (r + 1, c)
    else (r, c) in
  let (r, c) = String.fold_left f (si - 1, sj - 1) sx in
  [r + 1; c + 1]

let () =
  let id x = x in
  scanf "%d %d %d %d " (fun h w si sj ->
      let ac = Array.init h (fun _ -> scanf "%s " id) in
      let sx = scanf "%s " id in
      solve h w si sj ac sx
    ) |> List.map string_of_int |> String.concat " " |>printf "%s\n"
