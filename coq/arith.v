Fixpoint plus' (n m : nat) : nat :=
  match n with
  | O => m
  | S n' => S (plus' n' m)
  end.
Compute plus' 3 2.     (* 5 *)
Compute plus' 123 2.   (* 125 *)

Fixpoint mult' (n m : nat) : nat :=
  match n with
  | O => O
  | S n' => m + (mult' n' m)
  end.
Compute mult' 3 2.     (* 6 *)
Compute mult' 12 3.    (* 36 *)

Fixpoint minus' (n m : nat) : nat :=
  match n, m with
  | O, _ => O    (* No negative numbers *)
  | _, O => n
  | S n', S m' => minus' n' m'
  end.
Compute minus' 3 2.    (* 1 *)
Compute minus' 23 12.  (* 11 *)
Compute minus' 1 2.    (* 0 because negative numbers not handled *)

Check plus.
Check Nat.add.
Check Nat.div.
Print Nat.div.
(*
#+BEGIN_OUTPUT (Info)
Nat.div = 
fun x y : nat =>
match y with
| 0 => y
| S y' => fst (Nat.divmod x y' 0 y')
end
     : nat -> nat -> nat

Arguments Nat.div (_ _)%nat_scope
#+END_OUTPUT (Info) *)
Print Nat.divmod.
(*
#+BEGIN_OUTPUT (Info)
Nat.divmod = 
fix divmod (x y q u : nat) {struct x} : nat * nat :=
  match x with
  | 0 => (q, u)
  | S x' =>
      match u with
      | 0 => divmod x' y (S q) y
      | S u' => divmod x' y q u'
      end
  end
     : nat -> nat -> nat -> nat -> nat * nat

Arguments Nat.divmod (_ _ _ _)%nat_scope
#+END_OUTPUT (Info) *)
Print Nat.sub.

Fixpoint div' (n m : nat) : nat :=
  match n, m with
  | O, _ => O
  | _, O => O
  | _, _ => S (div' (minus n m) m)
  end.
