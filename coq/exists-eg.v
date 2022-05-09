Lemma eg : exists (a:nat), a = 3.
Proof.
  exists 3.
  reflexivity.
Qed.

Lemma eg2 : exists (n:nat), n + 1 = 2.
Proof.
  exists 1.
  reflexivity.
Qed.

Require Import Lia.
Example eg3 :
  forall (n m : nat),
    exists (x:nat),
      (n + x = m) -> (n <= m).
Proof.
  intros.
  induction n.
  - induction m.
    + exists 0.
      simpl.
      lia.
    + simpl.
      exists 1.
      lia.
  - induction m.
    + simpl.
Abort.  (* Don't know how to move after this... *)


