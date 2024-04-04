open Printf
open Scanf

module SS = Set.Make(String)

let solve s =
  let len = String.length s in
  let rec loop st i j =
    if i = len then SS.cardinal st
    else if j > len then loop st (i + 1) (i + 2)
    else loop (SS.add (String.sub s i (j - i)) st)  i (j + 1) in
  loop SS.empty 0 1


let () =
  scanf "%s " solve |> printf "%d\n"
