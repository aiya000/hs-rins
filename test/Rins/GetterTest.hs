module Rins.GetterTest where

import Data.Functor.Const (Const(..))
import Data.Functor.Identity (Identity(..))
import Test.Tasty (TestTree)
import Test.Tasty.HUnit (testCase, (@?=))
import qualified Rins.Getter as G


test_getters_can_set_it :: [TestTree]
test_getters_can_set_it =
  [ testCase "simple view" $
      G.view G._Identity (Identity 10) @?= 10
  , testCase "simple (^.)" $
      Identity 10 ^. G._Identity
        @?= 10
  , testCase "(^.) accesses a nested structure" $
      Const 'a' (Identity 10) ^. G._Const . G._Identity
        @?= 10
  ]
