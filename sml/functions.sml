(*
curry : ('a * 'b * 'c -> 'd) -> ('a -> 'b -> 'c -> 'd)
*)
fun curry f a b c = f (a, b, c)

(*
uncurry : ('a -> 'b -> 'c -> d) -> ('a * 'b * 'c -> 'd)
*)
fun uncurry f (a, b, c) = f a b c


(*
curry : (('a * 'b * 'c) -> 'd) -> ('a * 'b * 'c) -> ('a -> 'b -> 'c -> 'd)
*)
(*fun curry f (a, b, c) = fn a b c => f(a, b, c)*)

(*
fst : ('a * 'b) -> 'a
*)
fun fst a b = a

(*
snd : ('a * 'b) -> 'b
*)
fun snd a b = b


(*
length : 'a list -> int
*)
fun length [] = 0
  | length (x::xs) = 1 + length xs


(*
reverse : 'a list -> 'a list
*)
fun reverse [] = []
  | reverse (x::xs) = (reverse xs)@[x]

(* nth element of Fibonacci sequence

fib : int -> int

Doesn't handle negative numbers.
*)
fun fib 0 = 0
  | fib 1 = 1
  | fib n = fib (n-2) + fib (n-1)
