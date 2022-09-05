(* Well, lab 1, actually *)

(******************************************
           Exception sample
 ******************************************)
exception ValueError
              
fun foo n = if n < 0 then
                raise ValueError
            else n
(*
foo;
- val it = fn : int -> int

foo 3;
val it = 3 : int

- foo ~2;

uncaught exception ValueError
  raised at: filename.sml:4.11-4.21
*)
              


(******************************************
         Fibonacci numbers
 ******************************************)

(*
fiboSlow : int -> int

Indexing starts from 0.
First Fibonacci number is 1.
*)
fun fiboSlow 0 = 1
  | fiboSlow 1 = 1
  | fiboSlow n = fiboSlow (n-1) + fiboSlow (n-2)
                                           
(*
fibo : int -> int
 *)                                          
fun fibo num =
  let
    fun helper 0 a b = a
      | helper n a b = helper (n-1) b (a+b)
  in
    helper num 1 1
  end

(*
- fibo 40;
val it = 165580141 : int

- fiboSlow 40;
val it = 165580141 : int
*)

      
(******************************************
           Reversing lists
 ******************************************)
(*
append :: 'a -> 'a list -> 'a list
*)
fun append [] value = [value]
  | append (x::xs) value = x::(append xs value)
(*
- append [1,2] 3;
val it = [1,2,3] : int list
- append [] 2;
val it = [2] : int list
*)
                                  
fun reverseSlow [] = []
  | reverseSlow (x::xs) = reverseSlow xs @ [x]
(*
- reverseSlow [1,2,3];
val it = [3,2,1] : int list

- reverseSlow [];
stdIn:42.1-42.11 Warning: type vars not generalized because of
   value restriction are instantiated to dummy types (X1,X2,...)
val it = [] : ?.X1 list
*)

fun reverse l =
  let
    fun helper [] (x::xs) = helper [x] xs
      | helper result [] = result
      | helper collector (x::xs) = helper (x::collector) xs
  in
    helper [] l
  end
(*
- reverse [1,2,3,4,5,6];
val it = [6,5,4,3,2,1] : int list
- reverse [];

stdIn:63.1-63.11 Warning: type vars not generalized because of
   value restriction are instantiated to dummy types (X1,X2,...)
val it = [] : ?.X1 list
*)


(******************************************
    Exploring value restriction in sml
 ******************************************)
(*
idList :: 'a list -> 'b list
*)
fun idList [] = []
(*
/home/famubu/exception.sml:87.5-87.19 Warning: match nonexhaustive
          nil => ...
*)
(*
idList []
= ;
stdIn:55.1-55.10 Warning: type vars not generalized because of
   value restriction are instantiated to dummy types (X1,X2,...)
val it = [] : ?.X1 list
*)
