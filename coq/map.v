Require Import List.
Import ListNotations.

(* Like the Haskell map function *)
Fixpoint map {A B : Type} (f : A -> B) (a : list A) : list B :=
  match a with
  | []      => []
  | (x::xs) => (f x) :: map f xs
  end.

Compute map (fun x:nat => x + 1) [1;2].
(* [2; 3] *)
