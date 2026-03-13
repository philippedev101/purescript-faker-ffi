module Faker.Hacker
  ( abbreviation
  , adjective
  , noun
  , verb
  , ingverb
  , phrase
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

foreign import abbreviationImpl :: Effect String
foreign import adjectiveImpl :: Effect String
foreign import nounImpl :: Effect String
foreign import verbImpl :: Effect String
foreign import ingverbImpl :: Effect String
foreign import phraseImpl :: Effect String

abbreviation :: Gen String
abbreviation = Gen abbreviationImpl

adjective :: Gen String
adjective = Gen adjectiveImpl

noun :: Gen String
noun = Gen nounImpl

verb :: Gen String
verb = Gen verbImpl

ingverb :: Gen String
ingverb = Gen ingverbImpl

phrase :: Gen String
phrase = Gen phraseImpl
