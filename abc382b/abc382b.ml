open Printf
open Scanf

let solve n d s =
  let f c (ns, ct) =
    if ct = 0 then (c :: ns, ct)
    else if c = '@' then ('.' :: ns, ct - 1)
    else (c :: ns, ct) in
  let l = String.to_seq s |> List.of_seq in
  List.fold_right f l ([], d) |> fst |> List.to_seq |> String.of_seq

let () =
  scanf "%d %d %s " solve |> printf "%s\n"
