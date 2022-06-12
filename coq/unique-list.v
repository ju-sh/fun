(* List with unique elements. Sort of a set, basically. *)
Inductive ulist {A:Type} : list A -> Prop :=
| unil : ulist nil
| ucons : forall (a:A) (l:list A),
    ~(In a l) ->
    ulist l -> ulist (a::l).

Theorem egulist : ulist [1;2].
Proof.
  constructor.
  - simpl.
    intro H.
    destruct H; congruence.
  - constructor.
    + simpl.
      intro H.
      assumption.
    + constructor.
Qed.
