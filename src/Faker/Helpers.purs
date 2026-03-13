module Faker.Helpers
  ( elements
  , oneOf
  , weighted
  , shuffle
  , uniqueArray
  , uniqueArrayGen
  , sample
  , sampleRange
  , choose
  , chooseFloat
  , chance
  , perhaps
  , listOf
  , listOfRange
  , frequency
  , joinWith
  , slugify
  , mustache
  , replaceSymbols
  , replaceCreditCardSymbols
  , fromRegExp
  , fakePattern
  , multiple
  , multipleRange
  ) where

import Prelude

import Data.Array (replicate, intercalate)
import Data.Maybe (Maybe(..))
import Data.Traversable (sequence)
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Faker.Gen (Gen(..))

-- FFI imports

foreign import arrayElementImpl :: forall a. Array a -> Effect a
foreign import weightedArrayElementImpl :: forall a. Array { value :: a, weight :: Number } -> Effect a
foreign import arrayElementsCountImpl :: forall a. Array a -> Int -> Effect (Array a)
foreign import arrayElementsRangeImpl :: forall a. Array a -> { min :: Int, max :: Int } -> Effect (Array a)
foreign import shuffleImpl :: forall a. Array a -> Effect (Array a)
foreign import uniqueArrayImpl :: forall a. Array a -> Int -> Effect (Array a)
foreign import uniqueArrayGenImpl :: forall a. Effect a -> Int -> Effect (Array a)
foreign import chooseIntImpl :: Int -> Int -> Effect Int
foreign import chooseFloatImpl :: Number -> Number -> Effect Number
foreign import chanceImpl :: Number -> Effect Boolean
foreign import slugifyImpl :: String -> String
foreign import mustacheImpl :: forall r. String -> Record r -> String
foreign import replaceSymbolsImpl :: String -> Effect String
foreign import replaceCreditCardSymbolsImpl :: String -> String -> Effect String
foreign import fromRegExpImpl :: String -> Effect String
foreign import fakeImpl :: String -> Effect String
foreign import multipleImpl :: forall a. Effect a -> Int -> Effect (Array a)
foreign import multipleRangeImpl :: forall a. Effect a -> { min :: Int, max :: Int } -> Effect (Array a)

-- Combinators

-- | Pick a random element from an array.
elements :: forall a. Array a -> Gen a
elements arr = Gen (arrayElementImpl arr)

-- | Pick a random generator from an array and run it.
oneOf :: forall a. Array (Gen a) -> Gen a
oneOf gens = join (elements gens)

-- | Pick a random element with relative weights.
-- | `weighted [{ value: "a", weight: 5.0 }, { value: "b", weight: 1.0 }]`
-- | gives "a" 5x more often than "b".
weighted :: forall a. Array { value :: a, weight :: Number } -> Gen a
weighted arr = Gen (weightedArrayElementImpl arr)

-- | Randomly reorder an array.
shuffle :: forall a. Array a -> Gen (Array a)
shuffle arr = Gen (shuffleImpl arr)

-- | Pick N distinct elements from an array (source must have enough elements).
uniqueArray :: forall a. Array a -> Int -> Gen (Array a)
uniqueArray source n = Gen (uniqueArrayImpl source n)

-- | Generate N unique values from a generator.
uniqueArrayGen :: forall a. Gen a -> Int -> Gen (Array a)
uniqueArrayGen (Gen eff) n = Gen (uniqueArrayGenImpl eff n)

-- | Pick a random subset of N elements from an array.
sample :: forall a. Int -> Array a -> Gen (Array a)
sample n arr = Gen (arrayElementsCountImpl arr n)

-- | Pick a random number of elements (between min and max) from an array.
sampleRange :: forall a. { min :: Int, max :: Int } -> Array a -> Gen (Array a)
sampleRange opts arr = Gen (arrayElementsRangeImpl arr opts)

-- | Random int in range [min, max].
choose :: Int -> Int -> Gen Int
choose min max = Gen (chooseIntImpl min max)

-- | Random float in range [min, max].
chooseFloat :: Number -> Number -> Gen Number
chooseFloat min max = Gen (chooseFloatImpl min max)

-- | Boolean with given probability of being true.
-- | `chance 0.3` = 30% true.
chance :: Number -> Gen Boolean
chance p = Gen (chanceImpl p)

-- | Generate a value with given probability, Nothing otherwise.
-- | `perhaps 0.7 gen` = 70% Just, 30% Nothing.
perhaps :: forall a. Number -> Gen a -> Gen (Maybe a)
perhaps p gen = do
  b <- chance p
  if b then Just <$> gen else pure Nothing

-- | Generate an array of N values.
listOf :: forall a. Int -> Gen a -> Gen (Array a)
listOf n gen = sequence (replicate n gen)

-- | Generate an array with random length between min and max.
listOfRange :: forall a. Int -> Int -> Gen a -> Gen (Array a)
listOfRange min max gen = do
  n <- choose min max
  listOf n gen

-- | Weighted choice over generators. Each pair is (weight, generator).
frequency :: forall a. Array (Tuple Number (Gen a)) -> Gen a
frequency pairs = join $ weighted $ map (\(Tuple w g) -> { value: g, weight: w }) pairs

-- | Generate strings and join them with a separator.
joinWith :: String -> Array (Gen String) -> Gen String
joinWith sep gens = intercalate sep <$> sequence gens

-- | Use fakerjs `helpers.multiple` to call a generator N times.
multiple :: forall a. Gen a -> Int -> Gen (Array a)
multiple (Gen eff) n = Gen (multipleImpl eff n)

-- | Use fakerjs `helpers.multiple` with a random count in {min, max}.
multipleRange :: forall a. Gen a -> { min :: Int, max :: Int } -> Gen (Array a)
multipleRange (Gen eff) opts = Gen (multipleRangeImpl eff opts)

-- Pure utilities

-- | Replace spaces with hyphens, strip non-word characters. Pure function.
slugify :: String -> String
slugify = slugifyImpl

-- | Mustache-style template substitution. Pure function.
-- | `mustache "Hello {{name}}" { name: "World" }` = "Hello World"
mustache :: forall r. String -> Record r -> String
mustache = mustacheImpl

-- Effectful string utilities

-- | Replace `#` with digit, `?` with letter, `*` with either.
replaceSymbols :: String -> Gen String
replaceSymbols str = Gen (replaceSymbolsImpl str)

-- | Replace symbols and compute Luhn check digit for `L`.
replaceCreditCardSymbols :: String -> String -> Gen String
replaceCreditCardSymbols str symbol = Gen (replaceCreditCardSymbolsImpl str symbol)

-- | Generate a string matching a regex-like pattern.
fromRegExp :: String -> Gen String
fromRegExp pattern = Gen (fromRegExpImpl pattern)

-- | Interpolate `{{module.method}}` placeholders using faker methods.
fakePattern :: String -> Gen String
fakePattern pattern = Gen (fakeImpl pattern)
