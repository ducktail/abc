open Printf
open Scanf

let solve n =
  let fld = Array.init n (fun _ -> Array.init n (fun _ -> '.')) in
  let paint lu rb =
    let rec looph c =
      if c > rb then ()
      else begin
          fld.(lu).(c) <- '#';
          fld.(rb).(c) <- '#';
          looph (c + 1)
        end in
    let rec loopv r =
      if r > rb then ()
      else begin
          fld.(r).(lu) <- '#';
          fld.(r).(rb) <- '#';
          loopv (r + 1)
        end in
    looph lu;
    loopv lu in
  let rec loop i j =
    if i > j then fld
    else begin
        paint i j;
        loop (i + 2) (j - 2)
      end in
  loop 0 (n - 1)

let () =
  scanf "%d " solve |> Array.map (fun a -> Array.to_seq a |> String.of_seq) |> Array.iter @@ printf "%s\n"
