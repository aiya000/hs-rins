module Rins.Setter
  ( ASetter
  , set
  , (.~)
  , _Identity
  , _Const
  ) where

import Data.Functor.Const (Const(..))
import Data.Functor.Identity (Identity(..))

type ASetter s t a b = (a -> Identity b) -> s -> Identity t


set :: ASetter s t a b -> b -> s -> t
set = undefined

infixr 0 .~
(.~) :: ASetter s t a b -> b -> s -> t
(.~) = set

-- | An example of `ASetter`
_Identity :: ASetter (Identity a) (Identity b) a b
_Identity = undefined

-- | An example of `ASetter`
_Const :: ASetter (Const r a) (Const r b) a b
_Const = undefined
