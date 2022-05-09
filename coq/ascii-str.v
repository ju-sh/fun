From Coq Require Import Ascii String List.
Search (string -> nat).
Import ListNotations.

Definition mask (b : bool) (m : nat) : nat :=
  match b with
  | true => m
  | _ => 0
  end.

Definition asciiToInt (asc : ascii) : nat :=
  match asc with
  | Ascii.Ascii a b c d e f g h =>
      (mask a 128) + (mask b 64) + (mask c 32) + (mask d 16)
      + (mask e 8) + (mask f 4) + (mask g 2) + (mask h 1)
  end.
Compute asciiToInt (Ascii.Ascii false false true false false false
true false). (* 34:nat *)

Definition natToChar (n : nat) : string :=
  match n with
  |32 => " "
  |33 => "!"
  |34 => """"
  |35 => "#"
  |36 => "$"
  |37 => "%"
  |38 => "&"
  |39 => "'"
  |40 => "("
  |41 => ")"
  |42 => "*"
  |43 => "+"
  |44 => ","
  |45 => "-"
  |46 => "."
  |47 => "/"
  |48 => "0"
  |49 => "1"
  |50 => "2"
  |51 => "3"
  |52 => "4"
  |53 => "5"
  |54 => "6"
  |55 => "7"
  |56 => "8"
  |57 => "9"
  |58 => ":"
  |59 => ";"
  |60 => "<"
  |61 => "="
  |62 => ">"
  |63 => "?"
  |64 => "@"
  |65 => "A"
  |66 => "B"
  |67 => "C"
  |68 => "D"
  |69 => "E"
  |70 => "F"
  |71 => "G"
  |72 => "H"
  |73 => "I"
  |74 => "J"
  |75 => "K"
  |76 => "L"
  |77 => "M"
  |78 => "N"
  |79 => "O"
  |80 => "P"
  |81 => "Q"
  |82 => "R"
  |83 => "S"
  |84 => "T"
  |85 => "U"
  |86 => "V"
  |87 => "W"
  |88 => "X"
  |89 => "Y"
  |90 => "Z"
  |91 => "["
  |92 => "\"
  |93 => "]"
  |94 => "^"
  |95 => "_"
  |96 => "`"
  |97 => "a"
  |98 => "b"
  |99 => "c"
  |100 => "d"
  |101 => "e"
  |102 => "f"
  |103 => "g"
  |104 => "h"
  |105 => "i"
  |106 => "j"
  |107 => "k"
  |108 => "l"
  |109 => "m"
  |110 => "n"
  |111 => "o"
  |112 => "p"
  |113 => "q"
  |114 => "r"
  |115 => "s"
  |116 => "t"
  |117 => "u"
  |118 => "v"
  |119 => "w"
  |120 => "x"
  |121 => "y"
  |122 => "z"
  |123 => "{"
  |124 => "|"
  |125 => "}"
  |126 => "~"
  |_ => "∓"
  end.
Compute natToChar 34.

Fixpoint asciistrToString' (str : string) : string :=
  match str with
  | EmptyString => ""
  | String.String x xs => ((natToChar (asciiToInt x)) ++ (asciistrToString' xs))%string
  end.

Fixpoint asciistrToString (str : string) : string :=
  match str with
  | EmptyString => ""
  | String.String x xs => ( (asciistrToString xs) ++ (natToChar (asciiToInt x)))%string
  end.
Example foo2 := String.String
   (Ascii.Ascii false false true false false false
      true false)
   (String.String
      (Ascii.Ascii true false false false false true
         true false)
      (String.String
         (Ascii.Ascii false false true false true
            true true false)
         (String.String
            (Ascii.Ascii true false false false false
               true true false)
            (String.String
               (Ascii.Ascii false false true false
                  true true true false)
               (String.String
                  (Ascii.Ascii true false false true
                     true true true false)
                  (String.String
                     (Ascii.Ascii false false false
                        false true true true false)
                     (String.String
                        (Ascii.Ascii true false true
                         false false true true false)
                        (String.String
                         (Ascii.Ascii true true false
                         false true true true false)
                         String.EmptyString)))))))).
Compute asciistrToString foo2.

Fixpoint asclstToStr (ls : list string) : list string :=
  match ls with
  | x::xs => (asciistrToString x) :: (asclstToStr xs)
  | [] => []
  end.
Example foo := [String.String
   (Ascii.Ascii false false true false false false
      true false)
   (String.String
      (Ascii.Ascii true false false false false true
         true false)
      (String.String
         (Ascii.Ascii false false true false true
            true true false)
         (String.String
            (Ascii.Ascii true false false false false
               true true false)
            (String.String
               (Ascii.Ascii false false true false
                  true true true false)
               (String.String
                  (Ascii.Ascii true false false true
                     true true true false)
                  (String.String
                     (Ascii.Ascii false false false
                        false true true true false)
                     (String.String
                        (Ascii.Ascii true false true
                         false false true true false)
                        (String.String
                         (Ascii.Ascii true true false
                         false true true true false)
                         String.EmptyString))))))));
String.String
  (Ascii.Ascii true false false true false false true
     false)
  (String.String
     (Ascii.Ascii false true true true false true
        true false)
     (String.String
        (Ascii.Ascii true false false true false true
           true false)
        (String.String
           (Ascii.Ascii false false true false true
              true true false) String.EmptyString)));
String.String
  (Ascii.Ascii true true false false false false true
     false)
  (String.String
     (Ascii.Ascii true true true true false true true
        false)
     (String.String
        (Ascii.Ascii true false false false true true
           true false) String.EmptyString))].
Compute asclstToStr foo.
