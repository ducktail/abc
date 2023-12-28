open Printf
open Scanf

let solve l r a =
  if a < l then l
  else if r < a then r
  else a

let () =
  scanf "%d %d %d " (fun n l r ->
    List.init n (fun _ -> scanf "%d " @@ solve l r))
  |> List.map string_of_int
  |> String.concat " "
  |> printf "%s\n"
