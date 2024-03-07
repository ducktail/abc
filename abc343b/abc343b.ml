open Printf
open Scanf

let () =
  scanf "%d " (fun n ->
      let rec loop i =
        if i = 0 then ()
        else begin
            List.init n (fun i -> scanf "%d " @@ fun x -> ((i + 1), x)) |>
              List.filter (fun (_, x) -> x = 1) |>
              List.map fst |>
              List.map string_of_int |>
              String.concat " " |>
              printf "%s\n";
            loop (i - 1)
          end in
      loop n
    )
