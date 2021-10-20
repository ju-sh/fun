(* |- means conclusion *)
Ltac find_if :=
  match goal with
  | [ |- if ?X then _ else _ ] => destruct X
  end.

Theorem hmm : forall (a b c : bool),
  if a
    then if b
      then True
      else True
    else if c
      then True
      else True.
Proof.
  intros;  repeat find_if; reflexivity.
Qed.
(* [repeat] is a tactical aka tactic combinator *)
