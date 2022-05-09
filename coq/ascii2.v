Require Import Ascii String List.
Import ListNotations.
(*
Check Ascii.
Print ascii.
(*
Inductive ascii : Set :=
    Ascii : bool ->
            bool -> bool -> bool -> bool -> bool -> bool -> bool -> ascii

Arguments Ascii (_ _ _ _ _ _ _ _)%bool_scope
  *)

(* Ascii binary encoding has LSB at beginning *)
Compute Ascii true false true true true true true true.
Compute Ascii true true true false true true false false.

Check byte_of_ascii.
Compute byte_of_ascii (Ascii true true true false true true false false).

Require Import String.
Search (ascii -> nat).
Compute nat_of_ascii (Ascii true true true false true true false false).
Search (nat -> string).
Search (list ascii -> string).
Search (string -> string).
*)

Definition strgreen := String.String
              (Ascii.Ascii true true true false
                 false true true false)
              (String.String
                 (Ascii.Ascii false true false
                    false true true true false)
                 (String.String
                    (Ascii.Ascii true false true
                     false false true true false)
                    (String.String
                     (Ascii.Ascii true false true
                     false false true true false)
                     (String.String
                     (Ascii.Ascii false true true
                     true false true true false)
                     String.EmptyString)))).
Definition strred := (String.String
               (Ascii.Ascii false true false
                  false true true true false)
               (String.String
                  (Ascii.Ascii true false true
                     false false true true false)
                  (String.String
                     (Ascii.Ascii false false
                     true false false true true
                     false) String.EmptyString))).
Definition strcolor := 
String.String
 (Ascii.Ascii true true false false
    false false true false)
 (String.String
    (Ascii.Ascii true true true true
       false true true false)
    (String.String
       (Ascii.Ascii false false true
          true false true true false)
       (String.String
          (Ascii.Ascii true true true
           true false true true false)
          (String.String
           (Ascii.Ascii false true
           false false true true true
           false) String.EmptyString)))).

Definition strunk1 := 
[String.String
 (Ascii.Ascii true true true true false true
    true false)
 (String.String
    (Ascii.Ascii false true true true false
       true true false)
    (String.String
       (Ascii.Ascii true false true false
          false true true false)
       String.EmptyString))]
(*
Definition foo1 := [Ascii.Ascii false true false
                      false true true true false;
                    Ascii.Ascii true false true
                      false false true true false;
                    Ascii.Ascii false false true
                     false false true true false].
Check foo1.
Compute string_of_list_ascii foo1.
*)

Fixpoint strToAsciiList (str : string) : list ascii :=
  match str with
  | String.EmptyString => []
  | String.String asc xs => asc :: strToAsciiList xs
  end.
(*
Compute strToAsciiList foo.
Compute string_of_list_ascii (strToAsciiList foo).
*)

Definition asciiStringToString (str: string) : string :=
  string_of_list_ascii (strToAsciiList str).
Compute asciiStringToString strred.
Compute asciiStringToString strcolor.
Compute asciiStringToString strgreen.





