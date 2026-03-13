module Faker.Company
  ( name
  , catchPhrase
  , buzzPhrase
  , catchPhraseAdjective
  , catchPhraseDescriptor
  , catchPhraseNoun
  , buzzAdjective
  , buzzVerb
  , buzzNoun
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

foreign import nameImpl :: Effect String
foreign import catchPhraseImpl :: Effect String
foreign import buzzPhraseImpl :: Effect String
foreign import catchPhraseAdjectiveImpl :: Effect String
foreign import catchPhraseDescriptorImpl :: Effect String
foreign import catchPhraseNounImpl :: Effect String
foreign import buzzAdjectiveImpl :: Effect String
foreign import buzzVerbImpl :: Effect String
foreign import buzzNounImpl :: Effect String

name :: Gen String
name = Gen nameImpl

catchPhrase :: Gen String
catchPhrase = Gen catchPhraseImpl

buzzPhrase :: Gen String
buzzPhrase = Gen buzzPhraseImpl

catchPhraseAdjective :: Gen String
catchPhraseAdjective = Gen catchPhraseAdjectiveImpl

catchPhraseDescriptor :: Gen String
catchPhraseDescriptor = Gen catchPhraseDescriptorImpl

catchPhraseNoun :: Gen String
catchPhraseNoun = Gen catchPhraseNounImpl

buzzAdjective :: Gen String
buzzAdjective = Gen buzzAdjectiveImpl

buzzVerb :: Gen String
buzzVerb = Gen buzzVerbImpl

buzzNoun :: Gen String
buzzNoun = Gen buzzNounImpl
