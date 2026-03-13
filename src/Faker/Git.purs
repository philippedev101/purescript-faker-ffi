module Faker.Git
  ( branch
  , commitMessage
  , commitSha
  , commitShaN
  , commitEntry
  , commitEntryOpts
  , CommitEntryOpts
  , commitDate
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

type CommitEntryOpts =
  { merge :: Boolean
  , eol :: String
  }

foreign import branchImpl :: Effect String
foreign import commitMessageImpl :: Effect String
foreign import commitShaImpl :: Effect String
foreign import commitShaNImpl :: Int -> Effect String
foreign import commitEntryImpl :: Effect String
foreign import commitEntryOptsImpl :: CommitEntryOpts -> Effect String
foreign import commitDateImpl :: Effect String

branch :: Gen String
branch = Gen branchImpl

commitMessage :: Gen String
commitMessage = Gen commitMessageImpl

commitSha :: Gen String
commitSha = Gen commitShaImpl

commitShaN :: Int -> Gen String
commitShaN n = Gen (commitShaNImpl n)

commitEntry :: Gen String
commitEntry = Gen commitEntryImpl

commitEntryOpts :: CommitEntryOpts -> Gen String
commitEntryOpts opts = Gen (commitEntryOptsImpl opts)

commitDate :: Gen String
commitDate = Gen commitDateImpl
