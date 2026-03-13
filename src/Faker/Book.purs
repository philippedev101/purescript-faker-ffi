module Faker.Book
  ( author
  , format
  , genre
  , publisher
  , series
  , title
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

foreign import authorImpl :: Effect String
foreign import formatImpl :: Effect String
foreign import genreImpl :: Effect String
foreign import publisherImpl :: Effect String
foreign import seriesImpl :: Effect String
foreign import titleImpl :: Effect String

author :: Gen String
author = Gen authorImpl

format :: Gen String
format = Gen formatImpl

genre :: Gen String
genre = Gen genreImpl

publisher :: Gen String
publisher = Gen publisherImpl

series :: Gen String
series = Gen seriesImpl

title :: Gen String
title = Gen titleImpl
