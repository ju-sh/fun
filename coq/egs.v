Definition foo := fun x => x + 1.

Theorem bar : forall (n : nat), n + 1 = S n.
Proof.
  intros.
  induction n.
  - reflexivity.
  - simpl.
    rewrite IHn.
    reflexivity.
Qed.

Theorem foobar : forall (n : nat), 0 + n = n.
Proof.
  reflexivity.
Qed.
