Fixpoint iseven (n:nat): bool.
Proof.
  induction n.
  - exact true.
  - destruct n.
    * exact false.
    * exact (iseven n).
Defined.
