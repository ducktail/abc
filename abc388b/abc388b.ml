open Printf
open Scanf

let solve d ltd =
  Seq.map (fun k ->
      List.fold_left
        (fun m (t, d) -> max m (t * (d + k)))
        0 ltd)
    (Seq.init d (fun k -> k + 1))

let () =
  scanf "%d %d " (fun n d ->
    List.init n (fun _ -> scanf "%d %d " (fun t d -> (t, d))) |> solve d) |> Seq.iter @@ printf "%d\n"
