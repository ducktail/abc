open Printf
open Scanf

let solve l =
  let rec loop x =
    match x with
      a :: b :: c -> (a * b) :: loop (b :: c)
    | _ -> [] in
  loop l

let () =
  scanf "%d " (fun n ->
    List.init n (fun _ -> scanf "%d " @@ fun x -> x)) |>
    solve |> List.map string_of_int |> String.concat " " |> printf "%s\n"
