(* https://proofwiki.org/wiki/Natural_Number_Multiplication_is_Commutative *)
Theorem plus_n_0 : forall n : nat, n + 0 = n.
Proof.
  intros n.
  induction n.
  - reflexivity.
  - simpl.
    rewrite IHn.
    reflexivity.
Qed.

Lemma plus_n_Sm : forall (n m : nat), n + S m = S (n + m).
Proof.
  intros.
  induction n.
  - reflexivity.
  - simpl.
    rewrite <- IHn.
    reflexivity.
Qed.

Theorem plus_comm : forall (n m : nat), n + m = m + n.
Proof.
  intros.
  induction n.
  - rewrite plus_n_0.
    reflexivity.
  - simpl.
    rewrite IHn.
    rewrite plus_n_Sm.
    reflexivity.
Qed.

Theorem plus_assoc : forall (a b c : nat), a + (b + c) = (a + b) + c.
Proof.
  intros.
  induction a.
  - reflexivity.
  - simpl.
    rewrite IHa.
    reflexivity.
Qed.

Theorem mult_n_0 : forall n : nat, n * 0 = 0.
Proof.
  intros n.
  induction n.
  - reflexivity.
  - simpl.
    rewrite IHn.
    reflexivity.
Qed.

Lemma mult_n_1 : forall n : nat, n * 1 = n.
Proof.
  intros.
  induction n.
  - reflexivity.
  - simpl.
    rewrite IHn.
    reflexivity.
Qed.

Theorem mult_n_Sm : forall (n m : nat), n * S m = n + n * m.
Proof.
  intros.
  induction n.
  - reflexivity.
  - simpl.
    rewrite IHn.
    rewrite plus_assoc.
    rewrite plus_assoc.
    rewrite (plus_comm m n).
    reflexivity.
Qed.


(*
plus_n_0 : forall n : nat, n + 0 = n
plus_n_Sm : forall (n m : nat), n + S m = S (n + m)
plus_comm : forall (n m : nat), n + m = m + n
plus_assoc : forall (a b c : nat), a + (b + c) = (a + b) + c
mult_n_0 : forall n : nat, n * 0 = 0
mult_n_1 : forall n : nat, n * 1 = n
mult_n_Sm : forall (n m : nat), n * S m = n + n * m
mult_Sm_n : forall (n m : nat), (S m) * n = n + m * n
 *)

Theorem mult_comm : forall (n m : nat), n * m = m * n.
Proof.
  intros.
  induction n.
  - rewrite mult_n_0.  (* Basis for induction *)
    reflexivity.
  - simpl.             (* Inudction hypothesis *)
    rewrite mult_n_Sm.
    rewrite IHn.
    reflexivity.
Qed.

Lemma mult_abSc : forall (a b c : nat), a * b * S c = a * b * c + a * b.
Proof.
  intros.
  induction a.
  - reflexivity.
  - simpl.
Qed.

Theorem mult_distr : forall (a b c : nat), a * (b * c) = (a * b) + (a * c).
Proof.
  intros.
  induction a.
  - reflexivity.
  - simpl.
    rewrite IHa.
    induction b.
    + rewrite mult_n_0.
      simpl.

Qed.

Theorem mult_assoc : forall (a b c : nat), a * (b * c) = (a * b) * c.
Proof.
  intros.
  induction a.
  - reflexivity.
  - simpl.
    rewrite IHa.


    induction b.
    + simpl.
      rewrite mult_n_0.
      reflexivity.
    + simpl.


  induction c.
  - repeat rewrite mult_n_0.
    reflexivity.
  - 
Qed.
