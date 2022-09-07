(* Value of type [False -> False] via an identity function *)
Definition idty (A:Type) (x:A) : A := x.   
Check idty False : False -> False.         

(* Value of type [False -> False] *)
Check (fun x:False => x): False -> False.

Check 1<2.


Lemma lt_1_2 : 1<2.
Proof.
  constructor.
  Show Proof.
Qed.
Print le_n.
