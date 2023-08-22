open Printf
open Scanf

module U =
  struct
    let list_of_string s =
      let len = String.length s in
      let rec loop i l =
        if i = 0 then l
        else loop (i - 1) (s.[i - 1] :: l) in
      loop len []

    let string_of_array a =
      let len = Array.length a in
      String.init len (fun i -> a.(i))
  end

let solve s =
  U.list_of_string s |> List.filter (fun c -> not (List.mem c ['a' ; 'i' ; 'u' ; 'e' ; 'o']))
  |> Array.of_list |> U.string_of_array

let () =
  scanf "%s " solve |> printf "%s\n"
