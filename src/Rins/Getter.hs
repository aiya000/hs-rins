module Rins.Getter
  ( Getting
  , view
  , (^.)
  , _Const
  ) where

import Data.Functor.Const (Const(..))
import Data.Functor.Identity (Identity(..))

type Getting r s a = (a -> Const r a) -> s -> Const r s


view :: Getting a s a -> s -> a
view = undefined

(^.) :: s -> Getting a s a -> a
s ^. ax = undefined

-- | An example of `Getting`
_Identity ::Getting a (Identity a) a
_Identity = undefined

-- | An example of `Getting`
_Const :: Getting a (Const r a) a
_Const = undefined
