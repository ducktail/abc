open Printf
open Scanf

let solve xa ya xb yb xc yc =
  let f x0 y0 x1 y1 x2 y2 =
    (x1 - x0) * (x2 - x0) + (y1 - y0) * (y2 - y0) in
  if f xa ya xb yb xc yc = 0 then "Yes"
  else if f xc yc xa ya xb yb = 0 then "Yes"
  else if f xb yb xc yc xa ya = 0 then "Yes"
  else "No"

let () =
  scanf "%d %d %d %d %d %d " solve |> printf "%s\n"
