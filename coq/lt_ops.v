Lemma gt_lemma : forall (a b : nat), a > 1 -> b > 1 -> (a + b) > 1.
Proof.
  intros.
  induction a.
  - simpl.
    exact H0.
  - simpl.

Qed.


(*
Lemma plus_n_0 : forall (n : nat), n + 0 = n.
Proof.
  intros.
  induction n.
  - reflexivity.
  - simpl.
    rewrite IHn.
    reflexivity.
Qed.

Theorem one : forall (x y : nat), (x > 3) -> (y < 2) -> (x*x - 2*y) > 5.
Proof.
  intros.
  simpl.
  rewrite plus_n_0.
  induction x.
  - simpl.
 *)
