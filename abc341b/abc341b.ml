open Printf
open Scanf

let solve la lst =
  List.fold_left2 (fun x a (s, t) -> x / s * t + a) (List.hd la) (List.tl la) lst

let () =
  scanf "%d " (fun n ->
    let la = List.init n (fun _ -> scanf "%d " @@ fun x -> x) in
    List.init (n - 1) (fun _ -> scanf "%d %d " @@ fun x y -> (x, y))
    |> solve la) |> printf "%d\n"
