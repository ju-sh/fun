(*
Γ = {a = b, P a}
Γ ⊢ (P b)

ie,

 (a = b)      (P a)
====================
        P b
 *)
Lemma foo : forall (a b : nat) (P : nat -> Set), (a = b) -> P a -> P b.
Proof.
  intros.
  rewrite <- H.
  exact H0.
Qed.

(* Change rewrite direction. Rewrite rightwards. *)
Lemma foo' : forall (a b : nat) (P : nat -> Set), (b = a) -> P a -> P b.
Proof.
  intros.
  rewrite H.
  exact H0.
Qed.

(* rewrite to left

   H : a = b

   P b becomes P a

   RHS of H becomes its LHS.

   'Comes from right to left. Leftwards.'


   Rewrite to right

   H : b = a
   P b becomes P a. 

   a replaces b.

   'Comes from left and towards right.'
 *)
