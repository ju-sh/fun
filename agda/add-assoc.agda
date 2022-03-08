module add-assoc where

open import Data.Nat using (ℕ;  zero; suc; _+_)
open import Relation.Binary.PropositionalEquality using (_≡_; refl; cong)


-- `+-assoc` is an identifier like `add-assoc`. Nothing special
+-assoc : Set
+-assoc = ∀ (a b c : ℕ) → a + (b + c) ≡ (a + b) + c  -- enunciation

{- DOUBT:
Why is this not type checking?

+-assoc = ∀ (a b c : ℕ) → a + (b + c) → (a + b) + c  -- enunciation

 -}

-- an object of this type is the proof
+-assoc-proof : ∀ (a b c : ℕ) → a + (b + c) ≡ (a + b) + c
+-assoc-proof zero b c = refl
+-assoc-proof (suc a) b c = cong suc (+-assoc-proof a b c)  -- generated from doing case-split on 'a'
-- agda assigns a unique id to each hole
-- C-c C-, (comma) to get info about hole under cursor
-- For the above hole, it shows:
-- 
-- Goal: a + (b + c) ≡ a + b + c
-- ————————————————————————————————————————————————————————————
-- c : ℕ
-- b : ℕ
-- a : ℕ
-- 
-- `(a + b) + c` is shown as `a + b + c` as `+` is left associative.
-- So both are same.

{- Doing case split -}
-- With cursor on the hole, press: C-c C-c
-- It will ask name of variable to do case split on.
-- We say 'a', here.
-- Initial clause will be replaced by two new ones
--
-- > +-assoc-proof zero b c = {!!}       -- a replaced by zero
-- > +-assoc-proof (suc a) b c = {!!}    -- a replaced by (suc a)
--
-- doing refl (by C-c C-r) finishes first case
--
-- Doing C-c C-, on remaining goal says:
-- > 
-- > Goal: suc (a + (b + c)) ≡ suc (a + b + c)
-- > ————————————————————————————————————————————————————————————
-- > c : ℕ
-- > b : ℕ
-- > a : ℕ
-- >
--
-- The cong function handles cases where goal is like
-- f(arg1) ≡ f(arg2)
-- in which case we only have to show that arg1 ≡ arg2
-- congruence of equality
--
-- we _write_ `cong suc` inside the remaining hole and do a `refl` with C-c C-r
-- to get this goal:
--
-- > ?2 : a + (b + c) ≡ a + b + c
--
-- A recursive call to `+-assoc-proof` can finish this off.
-- Write `+-assoc-proof a b c` into the last hole
-- and solve it with C-c C-space
--
-- So the final proof is:
--
--   +-assoc-proof zero b c = refl
--   +-assoc-proof (suc a) b c = cong suc (+-assoc-proof a b c)  -- generated from doing case-split on 'a'
