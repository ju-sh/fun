Require Import List.
Import ListNotations.

Inductive CSet {A : Type} : Type :=
| nil : CSet
| cons : A -> CSet -> CSet.

Check 3=2.

(* ∈ operation *)
Fixpoint isin {A : Type} (x : A) (s : @CSet A) : bool.
  match s with
  | nil => false
  | cons x xs =>
  end.


(* Add an element to a set *)
Definition add {A : Type} (x : A) (s : @CSet A) : @CSet A := cons x s.

(* Convert a set to a list *)
Fixpoint csetToList {A : Type} (s : @CSet A) : list A :=
  match s with
  | nil => []
  | cons x xs => x :: csetToList xs
  end.

Definition union_helper {A : Type) (s1 s2 : @CSet A)
                        (l : list A) : @CSet A :=
  match l with
  | [] => 
  end.
