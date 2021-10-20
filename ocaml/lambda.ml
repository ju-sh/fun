(*
https://www.cis.upenn.edu/~bcpierce/tapl/checkers/untyped/
https://web.archive.org/web/20210423155718/https://www.cis.upenn.edu/~bcpierce/tapl/checkers/
*)

(* ** Compilation 

ocamlc in.sml -o out.out
*)

type info = FI of string * int * int | UNKNOWN
type binding = NameBind
type context = (string * binding) list

let rec isnamebound ctx x =
  match ctx with
      [] -> false
    | (y,_)::rest ->
        if y=x then true
        else isnamebound rest x

let rec pickfreshname ctx x =
  if isnamebound ctx x then pickfreshname ctx (x^"'")
  else ((x,NameBind)::ctx), x



(* Bare bones definition of [term] 

type term = Var of int           (* de-Bruijn index *)
          | Abs of term
          | App of term * term

But we are using some annotations to make debugging easier.

 - info: File position where term was found, so errors can point out where the error occurred.
 - int: For [Var] nodes. Total length of the context in which the variable is occuring. For a consistency check.
 - string: For [Abs] nodes. To replace de-Bruijn index with a variable name similar to what was used by user.
*)

type term = Var of info * int * int
          | Abs of info * term * string
          | App of info * term * term


(* Recursive function to print terms *)
let rec printTerm ctxt t = match t with
    Abs(inf, trm, strng) ->
      let (ctx', trm') = pickfreshname ctx x 
        in
      print_string "(lambda ";
      (* ... *)
  | App(inf, t1, t2) -> 
	 	

(* print_string "Hello world!" *)

