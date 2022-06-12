Fixpoint zero (n:nat) : nat :=
  match n with
  | S (S n') => two n'
  | S n' => one n'
  | O => 0
  end
with one (n:nat) : nat :=
  match n with
  | S (S n') => zero n'
  | S n' => two n'
  | O => 1
  end
with two (n:nat) : nat :=
  match n with
  | S (S n') => one n'
  | S n' => zero n'
  | O => 2
  end.
