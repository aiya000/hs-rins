module Rins.SetterTest where

import Data.Function ((&))
import Data.Functor.Const (Const(..))
import Data.Functor.Identity (Identity(..))
import Rins.Setter ((.~))
import Test.Tasty (TestTree)
import Test.Tasty.HUnit (testCase, (@?=))
import qualified Rins.Setter as S

test_setters_can_set_it :: [TestTree]
test_setters_can_set_it =
  [ testCase "simple set" $
      S.set S._Identity 20 (Identity 10) @?= Identity 20
  , testCase "simple (.~)" $
      Identity 10 & S._Identity .~ 20
        @?= Identity 20
  , testCase "(.~) changes a type" $
      Identity 10 & S._Identity .~ 'a'
        @?= Identity 'a'
  , testCase "(.~) accesses a nested structure" $
      Const 'a' (Identity 10) & S._Const . S._Identity .~ 'b'
        @?= Const 'a' (Identity 'b')
  ]
