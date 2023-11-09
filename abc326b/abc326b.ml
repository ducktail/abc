open Printf
open Scanf

let solve n =
  let l = [100;111;122;133;144;155;166;177;188;199;200;212;224;236;248;300;313;326;339;400;414;428;500;515;600;616;700;717;800;818;900;919] in
  List.find (fun x -> x >= n) l

let () =
  scanf "%d " solve |> printf "%d\n"
