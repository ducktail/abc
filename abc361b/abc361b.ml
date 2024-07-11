open Printf
open Scanf

let solve xl0 yl0 zl0 xh0 yh0 zh0 xl1 yl1 zl1 xh1 yh1 zh1 =
  let intersection l0 h0 l1 h1 =
    max 0 ((min h0 h1) - (max l0 l1)) in
  if (intersection xl0 xh0 xl1 xh1) * (intersection yl0 yh0 yl1 yh1) * (intersection zl0 zh0 zl1 zh1) == 0
  then "No" else "Yes"

let () =
  scanf "%d %d %d %d %d %d %d %d %d %d %d %d " solve |> printf "%s\n"
