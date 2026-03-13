module Faker.Gen
  ( Gen(..)
  , class Fake
  , fake
  , runGen
  ) where

import Prelude

import Effect (Effect)

-- | A generator for random fake data. Thin wrapper around `Effect`
-- | since fakerjs uses `Math.random` internally.
newtype Gen a = Gen (Effect a)

derive newtype instance Functor Gen
derive newtype instance Apply Gen
derive newtype instance Applicative Gen
derive newtype instance Bind Gen
derive newtype instance Monad Gen

-- | Typeclass for types with a canonical generator.
-- | Only define instances where there's one obvious way to generate
-- | a value. For context-dependent generation, use plain functions.
class Fake a where
  fake :: Gen a

-- | Unwrap a generator into an Effect.
runGen :: forall a. Gen a -> Effect a
runGen (Gen e) = e
