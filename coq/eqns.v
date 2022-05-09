From Equations Require Import Equations.
Require Import List ZArith Lia.
Import ListNotations.

Equations neg (b : bool) : bool :=
neg true := false;
neg false := true.
Compute neg true.   (* false : bool *)
Compute neg false.  (* true : bool *)

Equations bin (n : nat) : list bool by wf n lt :=
bin O := List.nil;
bin n := (if (Nat.eqb (Nat.modulo n 2) 0) then false else true)  :: bin (Nat.div n 2).
Next Obligation.
  change (S n0 / 2 < S n0).
  apply Nat.div_lt; lia.
Qed.
Compute bin 11.
(*
= [true; true; false; true]
     : list bool
*)

