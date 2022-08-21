(* Reverse a list in O(n) time *)

fun rev [] = []
  | rev (x::xs) =
    let
      fun aux_rev [] rev = rev
        | aux_rev (x::xs) rev = aux_rev xs (x::rev)
    in
      aux_rev xs [x]
    end

(*
sml> rev [3,2,1,0];
val it = [0,1,2,3] : int list
*)
