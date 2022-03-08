
-- False: a datatype without constructors
data False : Set where

-- True: a record type without fields => has
-- only a single element, which is the empty
-- record
record True : Set where

trivial : True

-- same as 'trivial = _' as agda can
-- figure out what the '_' stands for
trivial = record{}




open import Data.Bool
isTrue : Bool -> Set
isTrue true = True
isTrue false = False

{-
data Nat : Set where
  zero : Nat
  suc : Nat → Nat
  

add : Nat → Nat → Nat
add zero y = y
add (suc x) y = suc (add x y)
-}

 -- _<_ : Nat → Nat → Bool
 -- _ < zero = false

open import Data.Nat
open import Data.Bool
-- infix 40 _<_
_⇐_ : ℕ → ℕ → Bool
_⇐_ zero zero = false
_⇐_ zero _ = true
_⇐_ (suc x) y = _⇐_ x y



{-
** Doubts
*** true
Anologous to Coq's

Inductive True : Prop := I.
Inductive False : Prop := .

??

But then again, those are propositions whereas the agda
version deals with Set.
Or is that how agda deals with propositions as well?
Had heard that there was no separation unlike in the case of Coq,
between the world of propositions and types

*** Check?
Equivalent of Check nat. of coq?
-}

{-
open import Data.String

s : String
s = "hello"
-}


{-
{-
  Here is a comment above a module.
-}
module hello where --this is a comment! --fooo@.. jjwjw
  open import Data.Bool
  open import Data.String
  not-comment : Bool -> Set
{- but this is OK {-
                    and indeed -}
 they can be nested -}
  s : String
  s = "{- This is not a comment {- Notice the bad nesting -}"
  not-comment b = {- another comment -} ? --more end-of-line
-}
-}

{-
data Bool : Set where
  true : Bool
  false : Bool
  
not : Bool -> Bool
not true = false
not false = true
-}
