module Faker.Number
  ( int
  , intRange
  , IntRangeOpts
  , intOpts
  , IntOpts
  , float
  , floatRange
  , FloatRangeOpts
  , floatOpts
  , FloatOpts
  , binary
  , binaryRange
  , octal
  , octalRange
  , hex
  , hexRange
  , romanNumeral
  , romanNumeralRange
  , RangeOpts
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

type IntRangeOpts = { min :: Int, max :: Int }
type IntOpts = { min :: Int, max :: Int, multipleOf :: Int }
type FloatRangeOpts = { min :: Number, max :: Number }
type FloatOpts = { min :: Number, max :: Number, fractionDigits :: Int }
type RangeOpts = { min :: Int, max :: Int }

foreign import intImpl :: Effect Int
foreign import intRangeImpl :: IntRangeOpts -> Effect Int
foreign import intOptsImpl :: IntOpts -> Effect Int
foreign import floatImpl :: Effect Number
foreign import floatRangeImpl :: FloatRangeOpts -> Effect Number
foreign import floatOptsImpl :: FloatOpts -> Effect Number
foreign import binaryImpl :: Effect String
foreign import binaryRangeImpl :: RangeOpts -> Effect String
foreign import octalImpl :: Effect String
foreign import octalRangeImpl :: RangeOpts -> Effect String
foreign import hexImpl :: Effect String
foreign import hexRangeImpl :: RangeOpts -> Effect String
foreign import romanNumeralImpl :: Effect String
foreign import romanNumeralRangeImpl :: RangeOpts -> Effect String

-- | Generate a random integer with default options.
int :: Gen Int
int = Gen intImpl

-- | Generate a random integer within a range.
intRange :: IntRangeOpts -> Gen Int
intRange opts = Gen (intRangeImpl opts)

-- | Generate a random integer with full options (min, max, multipleOf).
intOpts :: IntOpts -> Gen Int
intOpts opts = Gen (intOptsImpl opts)

-- | Generate a random float with default options (0.0 to 1.0).
float :: Gen Number
float = Gen floatImpl

-- | Generate a random float within a range.
floatRange :: FloatRangeOpts -> Gen Number
floatRange opts = Gen (floatRangeImpl opts)

-- | Generate a random float with full options (min, max, fractionDigits).
floatOpts :: FloatOpts -> Gen Number
floatOpts opts = Gen (floatOptsImpl opts)

-- | Generate a random binary string with default range.
binary :: Gen String
binary = Gen binaryImpl

-- | Generate a random binary string within a range.
binaryRange :: RangeOpts -> Gen String
binaryRange opts = Gen (binaryRangeImpl opts)

-- | Generate a random octal string with default range.
octal :: Gen String
octal = Gen octalImpl

-- | Generate a random octal string within a range.
octalRange :: RangeOpts -> Gen String
octalRange opts = Gen (octalRangeImpl opts)

-- | Generate a random hex string with default range.
hex :: Gen String
hex = Gen hexImpl

-- | Generate a random hex string within a range.
hexRange :: RangeOpts -> Gen String
hexRange opts = Gen (hexRangeImpl opts)

-- | Generate a random Roman numeral with default range.
romanNumeral :: Gen String
romanNumeral = Gen romanNumeralImpl

-- | Generate a random Roman numeral within a range.
romanNumeralRange :: RangeOpts -> Gen String
romanNumeralRange opts = Gen (romanNumeralRangeImpl opts)
