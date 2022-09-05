(* Value of type [False -> False] via an identity function *)
Definition idty (A:Type) (x:A) : A := x.   
Check idty False : False -> False.         

(* Value of type [False -> False] *)
Check (fun x:False => x): False -> False.
