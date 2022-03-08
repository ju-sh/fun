{-
https://agda.readthedocs.io/en/latest/getting-started/a-taste-of-agda.html#programming-with-dependent-types-vectors

Do:

 - `C-c C-l`: saves, loads and type checks the file
 -}
 
-- file name has to be same as that of top-level module
module vectors where
-- This module can afterwards be imported like (in same directory)
-- `open import vectors using (Vector; _::_)`

-- Import type `ℕ` and its constructors `zero` and `suc` from `Data.Nat`
open import Data.Nat using (ℕ; zero; suc)

-- Define `Vector` type
-- 'a typed list'
-- the `A` argument means dependent typing. So `Vector` is actually a _family_ of types.
-- the `ℕ` in the type is an 'index' (indexed type). Here, `Vector` has only one index.
-- Here, the index represents the length of the vector.
data Vector (A : Set) : ℕ → Set where
  []   : Vector A zero
  _::_ : ∀ {n : ℕ} (x : A) (xs : Vector A n) → Vector A (suc n)

-- define precedence level of `_::_`
infixr 5 _::_



open import Data.Fin using (Fin; zero; suc)
-- > Agda allows overloading of constructor names, and disambiguates
-- > between them based on the expected type where they are used.'
-- So, `Fin.zero` vs `Nat.zero` conflict is minimized.

-- Function to get i-th element in a vector

-- generalizable variables
-- https://agda.readthedocs.io/en/latest/language/generalization-of-declared-variables.html#generalization-of-declared-variables
variable
  A : Set
  n : ℕ

--lookup (A : Set) (n : ℕ) : Vector A n → Fin n → ℕ
--lookup : Vector A n → A
--lookup (x :: xs) zero = x
--lookup (x :: xs) (suc i) = lookup xs i

lookup : Vector A n → Fin n → A
lookup (x :: xs) zero = x
lookup (x :: xs) (suc i) = lookup xs i



{- More 
https://agda.readthedocs.io/en/latest/language/mixfix-operators.html#mixfix-operators

** Find type of an expression
C-c C-d RET <expression>

Eg:

```
1 :: []
```
(space around the `::` is needed as `1::[]` is an agda identifier)

gives

```
Vector ℕ 1
```
 -}
