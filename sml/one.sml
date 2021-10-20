exception Bad;

datatype term = Var of int              (* Variable using de Bruijn index *)
              | Abs of term             (* Abstraction *)
              | App of term * term      (* Application *)


(* ** Parameters
    - d: shift amount
    - t: term
*)
fun termShift (d: int, t: term) =
  let
    (* ** Parameters
        - c: 'limit constraint'
        - t: term
    *)
    fun walk (c, Var idx) = if idx >= c then Var (idx+d)
                              else (Var idx)
      | walk (c, Abs t1) = Abs (walk (c+1, t1))
      | walk (c, App (t1, t2)) = App (walk (c, t1), walk (c, t2))
  in
    walk (0, t)
  end

(*
val x = Abs (Abs (App (Var 1, App (Var 0, Var 2))));
(*
val it = Abs (Abs (App (Var 1,App (Var 0,Var 2)))) : term
≡
λ. λ. 1 (0 2)
*)

val y = termShift (2, x);
(*
val y = Abs (Abs (App (Var 1,App (Var 0,Var 4)))) : term
≡
λ. λ. 1 (0 4)
*)

val x = Abs (App (App (Var 0, Var 1), (Abs (App (App (Var 0, Var 1), Var 2)))));
(*
val x = Abs (App (App (Var 0,Var 1),Abs (App (App (Var 0,Var 1),Var 2)))) : term
≡
λ. 0 1 (λ. 0 1 2)
*)

val y = termShift (2, x);
(*
val y = Abs (App (App (Var 0,Var 3),Abs (App (App (Var 0,Var 1),Var 4)))) : term
≡
λ. 0 3 λ. 0 1 4
*)
*)

(* ** Parameters
    - o: original variable: int
    - s: replacement variable: Var ss
    - t: term
*)
fun termSubst (j: int, s, t: term) : term =
  let
    (* ** Parameters
        - c: 'limit constraint'
        - t: term
    *)
    fun walk (c: int, Var idx) = if idx=j+c then termShift (c, s) else Var idx
      | walk (c, Abs t1) = Abs (walk (c+1, t1))
      | walk (c, App (t1, t2)) = App (walk (c, t1), walk (c, t2))
  in
    walk (0, t)
  end



(*
val x = App (Var 0, Abs(Abs (Var 2)));
(*
0 (λ.λ.2)
*)

val y = termSubst (0, Var 1, x);
(*
[0 ↦ 1] (0 (λ.λ.2))

val y = App (Var 1,Abs (Abs (Var 3))) : term
1 (λ.λ.3)
*)

val j = 0;
val s = App (Var 1, Abs (Var 2));
val t = App (Var 0, Abs (Var 1));

val y = termSubst (j, s, t);
(*
[0 ↦ 1 (λ.2)] (0 (λ.1))
*)
(*
val y = App (App (Var 1,Abs (Var 2)),Abs (App (Var 2,Abs (Var 3)))) : term
(1 (λ.2)) (λ.(2 (λ.3)))
*)



val j = 0;
val s = Var 1;
val t = Abs (App (Var 0, Var 2));

val y = termSubst (j, s, t);
(*
[0 ↦ 1](λ. 0 2)

val y = Abs (App (Var 0,Var 2)) : term
λ.(0 2)
*)



val j = 0;
val s = Var 1;
val t = Abs (App (Var 1, Var 0));

val y = termSubst (j, s, t);
(*
[0 ↦ 1](λ. 1 0)

val y = Abs (App (Var 2,Var 0)) : term
λ.(2 0)
*)
*)

fun termSubstTop (s, t) = termShift (~1, termSubst (0, termShift (1, s), t))


(* * Evaluation *)
fun isval (Abs _) = true
  | isval _ = false

fun eval_helper (App ((Abs t1), v1)) =  termSubstTop (v1, t1) 
  | eval_helper (App (v1, t1)) =
      let
          val t1' = eval_helper t1
      in
          App (v1, t1')
      end 
  | eval_helper (App (t1, t2)) =
      let
          val t1' = eval_helper t1
      in
          App (t1', t2)
      end 
  | eval_helper _ = raise Bad


fun eval t = 
    let
        val t' = eval_helper t
    in
        eval t'
    end

(*
    handle Bad = t
*)
    
    


(*
fun eval_helper (ctxt, (App ((Abs t1), v1))) =  termSubstTop (v1, t1) 
  | eval_helper (ctxt, (App (v1, t1))) =
      let
          val t1' = eval_helper (ctxt, t1)
      in
          App (v1, t1')
      end 
  | eval_helper (ctxt, (App (t1, t2))) =
      let
          val t1' = eval_helper (ctxt, t1)
      in
          App (t1', t2)
      end 
  | eval_helper _ = raise Bad


fun eval (ctxt, t) = 
    let
        val t' = eval_helper (ctxt, t)
    in
        eval (ctxt, t')
    end
*)


(*
fun eval_helper ctxt (App ((Abs t1), v1) = if (isval v1) then (termSubstTop (v1, t1)) else ()
*)

(*
fun termShift (d: int, t: term) =
  let
    fun walk (c, (Var idx)) = if idx >= c then Var (idx+d)
                              else (Var idx)
      | walk (c, (Abs t1)) = Abs (walk (c+1, t1))
      | walk (c, (App (t1, t2))) = App(walk (c, t1), walk (c, t2))
  in
    walk (0, t)
  end
*)



(*
    fun walk (c: int, idx: Var) = if idx>=c then Var (idx+d)
                              else (Var idx)
      | walk (c: int, t1: Abs) = Abs (walk (c+1) t1)
      | walk (c, (t1 t2)) = App((walk c t1) (walk c t2))
*)
