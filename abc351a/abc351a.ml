open Printf
open Scanf

let () =
  let id x = x in
  let sum = List.fold_left (+) 0 in
  let la = List.init 9 (fun _ -> scanf "%d " id) in
  let lb = List.init 8 (fun _ -> scanf "%d " id) in
  printf "%d\n" @@ sum la - sum lb + 1
