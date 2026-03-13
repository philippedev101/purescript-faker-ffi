module Faker.Science
  ( chemicalElement
  , unit
  , ChemicalElement
  , ScienceUnit
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

type ChemicalElement =
  { symbol :: String
  , name :: String
  , atomicNumber :: Int
  }

type ScienceUnit =
  { name :: String
  , symbol :: String
  }

foreign import chemicalElementImpl :: Effect ChemicalElement
foreign import unitImpl :: Effect ScienceUnit

chemicalElement :: Gen ChemicalElement
chemicalElement = Gen chemicalElementImpl

unit :: Gen ScienceUnit
unit = Gen unitImpl
