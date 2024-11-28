open Printf
open Scanf

module CharSet = Set.Make(Char)

let solve s =
  let rec loop st sq =
    match Seq.uncons sq with
      Some (x, sy) -> begin
        match Seq.uncons sy with
          Some (y, sz) -> if CharSet.mem x st then "No"
                          else if x = y then loop (CharSet.add x st) sz else "No"
        | None -> "No"
      end
    | None -> "Yes"
  in loop (CharSet.empty) (String.to_seq s)

let () =
  scanf "%s " solve |> printf "%s\n"
