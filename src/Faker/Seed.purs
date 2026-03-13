module Faker.Seed
  ( seed
  , runGenSeeded
  ) where

import Prelude

import Effect (Effect)
import Faker.Gen (Gen(..), runGen)

foreign import seedImpl :: Int -> Effect Unit

-- | Set the fakerjs PRNG seed for reproducible output.
seed :: Int -> Gen Unit
seed n = Gen (seedImpl n)

-- | Run a generator with a specific seed for reproducible output.
runGenSeeded :: forall a. Int -> Gen a -> Effect a
runGenSeeded s gen = do
  runGen (seed s)
  runGen gen
