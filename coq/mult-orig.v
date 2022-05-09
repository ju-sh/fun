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

Corollary mult_Sm_n : forall (n m : nat), (S m) * n = n + m * n.
Proof.
  intros.
  induction n.
  - simpl.
    rewrite mult_n_0.
    reflexivity.
  - simpl.
    rewrite mult_n_Sm.
    reflexivity.
Qed.

(*
Example a : forall (n m : nat), (S m) + (n + m) = (S m) + (m + n).
Proof.
  intros.
  f_equal.
(*
#+BEGIN_OUTPUT (Goal)
1 subgoal

n, m : nat

========================= (1 / 1)

S m + (n + m) = S m + (m + n)
#+END_OUTPUT (Goal) *)
Qed.
 *)

Lemma helper2 : forall (n m : nat), m + n * m = m * S n.
Proof.
  intros.
  induction n.
  - simpl.
    rewrite plus_n_0.
    rewrite mult_n_1.
    reflexivity.
  - simpl.
    rewrite IHn.
Abort.


(*
plus_n_0 : forall n : nat, n + 0 = n
plus_n_Sm : forall (n m : nat), n + S m = S (n + m)
plus_comm : forall (n m : nat), n + m = m + n
plus_assoc : forall (a b c : nat), a + (b + c) = (a + b) + c
mult_n_0 : forall n : nat, n * 0 = 0
mult_n_1 : forall n : nat, n * 1 = n
mult_n_Sm : forall (n m : nat), n * S m = n + n * m
mult_Sm_n : forall (n m : nat), (S m) * n = n + m * n

mult_n_0 
mult_n_Sm

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

Lemma helper : forall (n m : nat), 

  - rewrite mult_n_0.
    reflexivity.
  - rewrite mult_n_Sm.
    simpl.
    induction m.
    + simpl.
      rewrite mult_n_0.
      reflexivity.
    + f_equal.
      rewrite mult_Sm_n.
      rewrite mult_n_Sm.




      elim (S m).
      simpl.


  - simpl.
    rewrite mult_n_Sm.
    rewrite IHn.
Qed.
(*
(* a + (b + c) = (a + b) + c. *)
    
(*
#+BEGIN_OUTPUT (Goal)
1 subgoal

n, m : nat
IHn : n * S m = n + n * m

========================= (1 / 1)

S n * S m = S n + S n * m
#+END_OUTPUT (Goal) *)

  - induction m.
    + simpl.
      rewrite mult_n_0.
      rewrite mult_n_1.
      rewrite plus_n_0.
      reflexivity.
    + simpl.


  - rewrite (IHn (S n) m).

  - symmetry.
  (* S n + S n * m = S n * S m *)
  (* S n * S m = S n + S n * m *)
Qed.

Compute S O * 3.

Theorem mult_comm : forall (n m : nat), n * m = m * n.
Proof.
  intros.
  induction n.
  - rewrite mult_n_0.
    reflexivity.
  - induction m. 
    + simpl.
      rewrite IHn.
      reflexivity.
    + simpl.
      rewrite <- IHm.
      simpl.
(*
#+BEGIN_OUTPUT (Goal)
1 subgoal

n, m : nat
IHn : n * m = m * n

========================= (1 / 1)

S n * m = m * S n
#+END_OUTPUT (Goal) *)
Qed.
 *)
