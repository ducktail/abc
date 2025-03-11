open Printf
open Scanf

let solve n m l=
  printf "%d\n" @@ n - m ;
  let rec loop i l rs =
    if i > n then printf "%s\n" @@ String.concat " " @@ List.map string_of_int @@ List.rev rs
    else match l with
           [] -> loop (i + 1) l (i :: rs)
         | h :: t when h == i -> loop (i + 1) t rs
         | _ -> loop (i + 1) l (i :: rs) in
  loop 1 (List.sort compare l) []

let () =
  scanf "%d %d " (fun n m ->
      List.init m (fun _ -> scanf "%d " @@ fun x -> x) |> solve n m)
