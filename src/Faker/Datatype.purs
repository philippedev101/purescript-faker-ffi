module Faker.Datatype
  ( boolean
  , booleanWithProbability
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

foreign import booleanImpl :: Effect Boolean
foreign import booleanWithProbabilityImpl :: Number -> Effect Boolean

-- | Generate a random boolean with 50/50 probability.
boolean :: Gen Boolean
boolean = Gen booleanImpl

-- | Generate a random boolean with given probability of being true.
-- | `booleanWithProbability 0.8` = 80% chance of true.
booleanWithProbability :: Number -> Gen Boolean
booleanWithProbability p = Gen (booleanWithProbabilityImpl p)
