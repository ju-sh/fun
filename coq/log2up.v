Require Import Lia.

Fixpoint log2up (n : nat) : nat :=
  match n with
  | O => 0
  | S O => 0
  | S (S n') => 1 + (log2up n')
  end.
Compute log2up 6. (* 3 *)
Compute log2up 7. (* 3 *)
Compute log2up 8. (* 4 *)

(* Search (nat -> nat -> bool). *)
Compute (Nat.leb 3 2).

(* After the fashion of
   https://coq.inria.fr/library/Coq.Numbers.NatInt.NZLog.html *)
Lemma log2up_nonneg : forall (n : nat), 0 <= (log2up n). 
Proof.
  lia.
Qed.

Compute (Nat.pow 2 3).

Lemma log2_lemma : forall (n : nat), n <= (Nat.pow 2 (log2up n)).
(*
Proof.
  intros.
  induction n.
  - lia.
  - simpl.
Qed.
 *)
