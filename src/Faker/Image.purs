module Faker.Image
  ( avatar
  , avatarGitHub
  , url
  , urlOpts
  , UrlOpts
  , urlPicsumPhotos
  , urlPicsumPhotosOpts
  , UrlPicsumPhotosOpts
  , dataUri
  , dataUriOpts
  , DataUriOpts
  , personPortrait
  , personPortraitOpts
  , PersonPortraitOpts
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

type UrlOpts = { width :: Int, height :: Int }
type UrlPicsumPhotosOpts =
  { width :: Int
  , height :: Int
  , grayscale :: Boolean
  , blur :: Int
  }
type DataUriOpts =
  { width :: Int
  , height :: Int
  , color :: String
  , format :: String
  }
type PersonPortraitOpts = { sex :: String, size :: Int }

foreign import avatarImpl :: Effect String
foreign import avatarGitHubImpl :: Effect String
foreign import urlImpl :: Effect String
foreign import urlOptsImpl :: UrlOpts -> Effect String
foreign import urlPicsumPhotosImpl :: Effect String
foreign import urlPicsumPhotosOptsImpl :: UrlPicsumPhotosOpts -> Effect String
foreign import dataUriImpl :: Effect String
foreign import dataUriOptsImpl :: DataUriOpts -> Effect String
foreign import personPortraitImpl :: Effect String
foreign import personPortraitOptsImpl :: PersonPortraitOpts -> Effect String

-- | Generate a random avatar URL.
avatar :: Gen String
avatar = Gen avatarImpl

-- | Generate a random GitHub avatar URL.
avatarGitHub :: Gen String
avatarGitHub = Gen avatarGitHubImpl

-- | Generate a random image URL with default dimensions.
url :: Gen String
url = Gen urlImpl

-- | Generate a random image URL with specified dimensions.
urlOpts :: UrlOpts -> Gen String
urlOpts opts = Gen (urlOptsImpl opts)

-- | Generate a random Picsum Photos URL with default options.
urlPicsumPhotos :: Gen String
urlPicsumPhotos = Gen urlPicsumPhotosImpl

-- | Generate a random Picsum Photos URL with options.
urlPicsumPhotosOpts :: UrlPicsumPhotosOpts -> Gen String
urlPicsumPhotosOpts opts = Gen (urlPicsumPhotosOptsImpl opts)

-- | Generate a random data URI with default options.
dataUri :: Gen String
dataUri = Gen dataUriImpl

-- | Generate a random data URI with options.
dataUriOpts :: DataUriOpts -> Gen String
dataUriOpts opts = Gen (dataUriOptsImpl opts)

-- | Generate a random person portrait URL with default options.
personPortrait :: Gen String
personPortrait = Gen personPortraitImpl

-- | Generate a random person portrait URL with options.
personPortraitOpts :: PersonPortraitOpts -> Gen String
personPortraitOpts opts = Gen (personPortraitOptsImpl opts)
