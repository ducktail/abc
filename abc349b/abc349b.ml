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

let solve s =
  if (L.for_all ((=) 2)
      @@ L.map L.length
      @@ L.group (=)
      @@ L.sort compare
      @@ L.map L.length
      @@ L.group (=)
      @@ L.sort compare
      @@ L.of_seq
      @@ String.to_seq s) then "Yes" else "No"

let () =
  scanf "%s " solve |> printf "%s\n"
