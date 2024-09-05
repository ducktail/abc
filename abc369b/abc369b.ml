open Printf
open Scanf

let solve ll lr =
  let rec f fl l =
    match l with
      a :: b :: r -> f (fl + abs (a - b)) (b :: r)
    | _ -> fl in
  f 0 ll + f 0 lr

let () =
  scanf "%d " (fun n ->
      let rec loop i ll lr =
        if i = 0 then solve ll lr
        else
          let (a, s) = scanf "%d %c " (fun a s -> (a, s)) in
          if s = 'L' then loop (i - 1) (a :: ll) lr
          else loop (i - 1) ll (a :: lr) in
      loop n [] []
    ) |> printf "%d\n"
