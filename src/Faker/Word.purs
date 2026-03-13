module Faker.Word
  ( adjective
  , adjectiveN
  , adverb
  , adverbN
  , conjunction
  , conjunctionN
  , interjection
  , interjectionN
  , noun
  , nounN
  , preposition
  , prepositionN
  , verb
  , verbN
  , sample
  , sampleN
  , words
  , wordsN
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

foreign import adjectiveImpl :: Effect String
foreign import adjectiveNImpl :: Int -> Effect String
foreign import adverbImpl :: Effect String
foreign import adverbNImpl :: Int -> Effect String
foreign import conjunctionImpl :: Effect String
foreign import conjunctionNImpl :: Int -> Effect String
foreign import interjectionImpl :: Effect String
foreign import interjectionNImpl :: Int -> Effect String
foreign import nounImpl :: Effect String
foreign import nounNImpl :: Int -> Effect String
foreign import prepositionImpl :: Effect String
foreign import prepositionNImpl :: Int -> Effect String
foreign import verbImpl :: Effect String
foreign import verbNImpl :: Int -> Effect String
foreign import sampleImpl :: Effect String
foreign import sampleNImpl :: Int -> Effect String
foreign import wordsImpl :: Effect String
foreign import wordsNImpl :: Int -> Effect String

-- | Generate a random adjective.
adjective :: Gen String
adjective = Gen adjectiveImpl

-- | Generate a random adjective of specified length.
adjectiveN :: Int -> Gen String
adjectiveN n = Gen (adjectiveNImpl n)

-- | Generate a random adverb.
adverb :: Gen String
adverb = Gen adverbImpl

-- | Generate a random adverb of specified length.
adverbN :: Int -> Gen String
adverbN n = Gen (adverbNImpl n)

-- | Generate a random conjunction.
conjunction :: Gen String
conjunction = Gen conjunctionImpl

-- | Generate a random conjunction of specified length.
conjunctionN :: Int -> Gen String
conjunctionN n = Gen (conjunctionNImpl n)

-- | Generate a random interjection.
interjection :: Gen String
interjection = Gen interjectionImpl

-- | Generate a random interjection of specified length.
interjectionN :: Int -> Gen String
interjectionN n = Gen (interjectionNImpl n)

-- | Generate a random noun.
noun :: Gen String
noun = Gen nounImpl

-- | Generate a random noun of specified length.
nounN :: Int -> Gen String
nounN n = Gen (nounNImpl n)

-- | Generate a random preposition.
preposition :: Gen String
preposition = Gen prepositionImpl

-- | Generate a random preposition of specified length.
prepositionN :: Int -> Gen String
prepositionN n = Gen (prepositionNImpl n)

-- | Generate a random verb.
verb :: Gen String
verb = Gen verbImpl

-- | Generate a random verb of specified length.
verbN :: Int -> Gen String
verbN n = Gen (verbNImpl n)

-- | Generate a random word (any part of speech).
sample :: Gen String
sample = Gen sampleImpl

-- | Generate a random word of specified length.
sampleN :: Int -> Gen String
sampleN n = Gen (sampleNImpl n)

-- | Generate random words (default count).
words :: Gen String
words = Gen wordsImpl

-- | Generate a specific number of random words.
wordsN :: Int -> Gen String
wordsN n = Gen (wordsNImpl n)
