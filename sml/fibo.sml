(* Fibonacci series:

Val: 1  1  2  3  5  8 13 21 34 55 89
Idx: 0  1  2  3  4  5  6  7  8  9 10
*)

fun fibo n =
  let
    fun aux a b 0 = a
      | aux a b n = aux b (a+b) (n-1)
  in
    aux 1 1 n
  end

(*
sml> fibo 10;
val it = 89 : int
*)

