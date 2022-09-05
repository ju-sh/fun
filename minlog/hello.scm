; Execute current line (cursor placed after closing parenthesis): C-x C-e
; Execute region: C-c C-r
; undo: (undo) or (undo n)
; End scheme session: (exit)
;
; ----------------------------------------------------
;
; Parenthesis associate to right
;
; (A -> (B -> C)) -> ((A -> B) -> (A -> C))
;
; which is same as
;
; (A -> B -> C) -> (A -> B) -> (A -> C)
;
; ----------------------------------------------------
; ; Writing the formula:
;
; Declare predicate variables A, B, C
(add-pvar-name "A" "B" "C" (make-arity))
; Minlog output:
;> ok, predicate variable A: (arity) added
;ok, predicate variable B: (arity) added
;ok, predicate variable C: (arity) added

(set-goal "(A -> B -> C) -> (A -> B) -> (A -> C)")
; Minlog output:
;----------------------------------
; ?_1:(A -> B -> C) -> (A -> B) -> A -> C

; Assume (A -> B -> C)
(assume 1)
; Minlog output:
;> ok, we now have the new goal 
;
;  1:A -> B -> C
;----------------------------------
;?_2:(A -> B) -> A -> C

; Assume (A -> B)
(assume 2)
; Minlog output:
;> ok, we now have the new goal 
;
;  1:A -> B -> C
;  2:A -> B
;----------------------------------
;?_3:A -> C


; Assume A
(assume 3)
; Minlog output:
;> ok, we now have the new goal 
;
;  1:A -> B -> C
;  2:A -> B
;  3:A
;----------------------------------
;?_4:C
