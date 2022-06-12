From Equations Require Import Equations.

(* Modules
   - Arith for:
     + notation (nat / nat)
     + Nat.div_lt
   - Lia for lia tactic
   - Vector for Vector.t
 *)
Require Import Vector Arith Lia.
Import VectorNotations.

Equations bin (n : nat) : list nat by wf n lt :=
bin O := List.nil;
bin n := Nat.modulo n 2 :: bin (Nat.div n 2).
Next Obligation.
  change (S n0 / 2 < S n0).
  apply Nat.div_lt; lia.
Qed.
Compute Vector.of_list (bin 11).
(* = [1; 1; 0; 1]
     : t nat (length (bin 11)) *)
