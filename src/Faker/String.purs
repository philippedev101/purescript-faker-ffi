module Faker.String
  ( uuid
  , ulid
  , nanoid
  , nanoidN
  , alpha
  , alphaOpts
  , AlphaOpts
  , alphanumeric
  , alphanumericOpts
  , AlphanumericOpts
  , numeric
  , numericOpts
  , NumericOpts
  , hexadecimal
  , hexadecimalOpts
  , HexadecimalOpts
  , binary
  , binaryOpts
  , BinaryOpts
  , octal
  , octalOpts
  , OctalOpts
  , sample
  , sampleN
  , fromCharacters
  , fromCharactersN
  , symbol
  , symbolN
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

type AlphaOpts = { length :: Int, casing :: String }
type AlphanumericOpts = { length :: Int, casing :: String }
type NumericOpts = { length :: Int, allowLeadingZeros :: Boolean }
type HexadecimalOpts = { length :: Int, casing :: String, prefix :: String }
type BinaryOpts = { length :: Int, prefix :: String }
type OctalOpts = { length :: Int, prefix :: String }

foreign import uuidImpl :: Effect String
foreign import ulidImpl :: Effect String
foreign import nanoidImpl :: Effect String
foreign import nanoidNImpl :: Int -> Effect String
foreign import alphaImpl :: Effect String
foreign import alphaOptsImpl :: AlphaOpts -> Effect String
foreign import alphanumericImpl :: Effect String
foreign import alphanumericOptsImpl :: AlphanumericOpts -> Effect String
foreign import numericImpl :: Effect String
foreign import numericOptsImpl :: NumericOpts -> Effect String
foreign import hexadecimalImpl :: Effect String
foreign import hexadecimalOptsImpl :: HexadecimalOpts -> Effect String
foreign import binaryImpl :: Effect String
foreign import binaryOptsImpl :: BinaryOpts -> Effect String
foreign import octalImpl :: Effect String
foreign import octalOptsImpl :: OctalOpts -> Effect String
foreign import sampleImpl :: Effect String
foreign import sampleNImpl :: Int -> Effect String
foreign import fromCharactersImpl :: String -> Effect String
foreign import fromCharactersNImpl :: String -> Int -> Effect String
foreign import symbolImpl :: Effect String
foreign import symbolNImpl :: Int -> Effect String

-- | Generate a random UUID v4.
uuid :: Gen String
uuid = Gen uuidImpl

-- | Generate a random ULID.
ulid :: Gen String
ulid = Gen ulidImpl

-- | Generate a random nanoid with default length.
nanoid :: Gen String
nanoid = Gen nanoidImpl

-- | Generate a random nanoid with specified length.
nanoidN :: Int -> Gen String
nanoidN n = Gen (nanoidNImpl n)

-- | Generate a random alphabetic string with default options.
alpha :: Gen String
alpha = Gen alphaImpl

-- | Generate a random alphabetic string with options (length, casing).
alphaOpts :: AlphaOpts -> Gen String
alphaOpts opts = Gen (alphaOptsImpl opts)

-- | Generate a random alphanumeric string with default options.
alphanumeric :: Gen String
alphanumeric = Gen alphanumericImpl

-- | Generate a random alphanumeric string with options (length, casing).
alphanumericOpts :: AlphanumericOpts -> Gen String
alphanumericOpts opts = Gen (alphanumericOptsImpl opts)

-- | Generate a random numeric string with default options.
numeric :: Gen String
numeric = Gen numericImpl

-- | Generate a random numeric string with options (length, allowLeadingZeros).
numericOpts :: NumericOpts -> Gen String
numericOpts opts = Gen (numericOptsImpl opts)

-- | Generate a random hexadecimal string with default options.
hexadecimal :: Gen String
hexadecimal = Gen hexadecimalImpl

-- | Generate a random hexadecimal string with options (length, casing, prefix).
hexadecimalOpts :: HexadecimalOpts -> Gen String
hexadecimalOpts opts = Gen (hexadecimalOptsImpl opts)

-- | Generate a random binary string with default options.
binary :: Gen String
binary = Gen binaryImpl

-- | Generate a random binary string with options (length, prefix).
binaryOpts :: BinaryOpts -> Gen String
binaryOpts opts = Gen (binaryOptsImpl opts)

-- | Generate a random octal string with default options.
octal :: Gen String
octal = Gen octalImpl

-- | Generate a random octal string with options (length, prefix).
octalOpts :: OctalOpts -> Gen String
octalOpts opts = Gen (octalOptsImpl opts)

-- | Generate a random string from a random selection of characters.
sample :: Gen String
sample = Gen sampleImpl

-- | Generate a random string of specified length.
sampleN :: Int -> Gen String
sampleN n = Gen (sampleNImpl n)

-- | Generate a random string from the given characters with default length.
fromCharacters :: String -> Gen String
fromCharacters chars = Gen (fromCharactersImpl chars)

-- | Generate a random string from the given characters with specified length.
fromCharactersN :: String -> Int -> Gen String
fromCharactersN chars n = Gen (fromCharactersNImpl chars n)

-- | Generate a random special symbol character.
symbol :: Gen String
symbol = Gen symbolImpl

-- | Generate random special symbol characters of specified length.
symbolN :: Int -> Gen String
symbolN n = Gen (symbolNImpl n)
