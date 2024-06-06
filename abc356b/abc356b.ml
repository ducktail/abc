open Printf
open Scanf

module U =
  struct
    let id x = x

    let iter si ei f =
      let rec loop i =
        if i = ei then ()
        else begin
            f i ;
            loop (i + 1)
          end
      in loop si

    let repeat n f = iter 0 n f
  end

let solve aa ax =
  if List.fold_left2 (fun b a x -> b && a <= x) true aa (Array.to_list ax) then "Yes" else "No"

let () =
  scanf "%d %d " (fun n m ->
    let la = List.init m (fun _ -> scanf "%d " U.id) in
    let ax = Array.make m 0 in
    U.repeat n (fun _ ->
      let a = Array.init m (fun _ -> scanf "%d " U.id) in
      U.repeat m (fun i ->
        ax.(i) <- ax.(i) + a.(i))
      ) ;
    solve la ax)
  |> printf "%s\n"
