open Printf
open Scanf

module L =
  struct
    include List
  
    let rec span f = function
        [] -> ([],[])
      | h :: t when f h -> let (xs, ys) = span f t in (h :: xs, ys)
      | l -> ([],l)

    let rec group f = function
      | [] -> []
      | h :: t -> let (xs, ys) = span (f h) t in (h :: xs) :: group f ys

  end

let solve n l =
  let odd x = x mod 2 = 1 in
  n - (L.length @@ L.filter odd @@ L.map L.length @@ L.group (=) @@ L.sort compare l)

let () =
  let id x = x in
  scanf "%d %d " (fun n q ->
    L.init q (fun _ -> scanf "%d " id) |> solve n) |> printf "%d\n"
