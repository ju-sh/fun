Require Import Lia.

Theorem foo : forall (a b : nat), a > 1 -> b > 1 -> (a + b) > 3.
Proof.
  intros.
  lia.
Qed.

(*
Theorem foo' : forall (a b : nat), a > 1 -> b > 1 -> (a + b) > 4.
Proof.
  intros.
  lia.

-----

#+BEGIN_OUTPUT (Info)
Tactic failure:  Cannot find witness.
#+END_OUTPUT (Info)
 *)

Theorem abc_bc : forall (a b c : nat), a + b = 5 -> a + c = 5 -> b = c.
Proof.
  intros.
  lia.
Qed.

Theorem gt_lemma : forall (a b : nat), a > 1 -> b > 1 -> (a + b) > 1.
Proof.
  intros.
  lia.
Qed.
