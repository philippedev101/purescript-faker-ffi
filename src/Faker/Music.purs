module Faker.Music
  ( album
  , artist
  , genre
  , songName
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

foreign import albumImpl :: Effect String
foreign import artistImpl :: Effect String
foreign import genreImpl :: Effect String
foreign import songNameImpl :: Effect String

album :: Gen String
album = Gen albumImpl

artist :: Gen String
artist = Gen artistImpl

genre :: Gen String
genre = Gen genreImpl

songName :: Gen String
songName = Gen songNameImpl
