Goal ((True /\ True) /\ True) /\ True.
Proof.
  split.
  - split.
    + split.
      * reflexivity.
      * trivial.
    + trivial.
  - trivial.
Restart.
  split; trivial.
  split; trivial.
  split; trivial.
Qed.



Goal forall (n:nat), n + 0 = n.
Proof.
  induction n.
  - reflexivity.
  - simpl.
    f_equal.
    assumption.
Qed.
