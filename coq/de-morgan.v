Theorem dM1: forall A B:Prop,
  ~(or A B) -> and (~A) (~B).
Proof.
  intros A B H.
  split.
  - intro a.
    apply (H (or_introl a)).
  - intro b.
    exact (H (or_intror b)).
Qed.

Theorem dM1r: forall A B:Prop,
  and (~A) (~B) -> ~(or A B).
Proof.
  intros A B.
  intro nA_and_nB.
  intro AorB.
  unfold not in nA_and_nB.
  destruct AorB.
  - destruct nA_and_nB.
    exact (H0 H).
  - destruct nA_and_nB.
    exact (H1 H).
Qed.

Theorem dM2r: forall A B:Prop,
  or (~A) (~B) -> ~(and A B).
Proof.
  intros A B H.
  unfold not.
  intro A_and_B.
  destruct H.
  - unfold not in H.
    destruct A_and_B.
    exact (H H0).
  - destruct A_and_B.
    unfold not in H.
    exact (H H1).
Qed.
