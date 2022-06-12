(* Unless our axioms are flawed, we cannot prove [False] in Coq.

Because it has no constructors to make values out of.

[False] is defined like:

Inductive False : Prop :=.
*)

Goal
  False.
Proof.
  constructor.
