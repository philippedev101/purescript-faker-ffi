module Faker.Date
  ( anytime
  , past
  , pastOpts
  , PastOpts
  , future
  , futureOpts
  , FutureOpts
  , between
  , BetweenOpts
  , betweens
  , BetweensOpts
  , recent
  , recentOpts
  , RecentOpts
  , soon
  , soonOpts
  , SoonOpts
  , birthdate
  , birthdateByAge
  , AgeRangeOpts
  , birthdateByYear
  , YearRangeOpts
  , month
  , monthAbbreviated
  , weekday
  , weekdayAbbreviated
  , timeZone
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

type PastOpts = { years :: Int }
type FutureOpts = { years :: Int }
type BetweenOpts = { from :: String, to :: String }
type BetweensOpts = { from :: String, to :: String, count :: Int }
type RecentOpts = { days :: Int }
type SoonOpts = { days :: Int }
type AgeRangeOpts = { min :: Int, max :: Int }
type YearRangeOpts = { min :: Int, max :: Int }

foreign import anytimeImpl :: Effect String
foreign import pastImpl :: Effect String
foreign import pastOptsImpl :: PastOpts -> Effect String
foreign import futureImpl :: Effect String
foreign import futureOptsImpl :: FutureOpts -> Effect String
foreign import betweenImpl :: BetweenOpts -> Effect String
foreign import betweensImpl :: BetweensOpts -> Effect (Array String)
foreign import recentImpl :: Effect String
foreign import recentOptsImpl :: RecentOpts -> Effect String
foreign import soonImpl :: Effect String
foreign import soonOptsImpl :: SoonOpts -> Effect String
foreign import birthdateImpl :: Effect String
foreign import birthdateByAgeImpl :: AgeRangeOpts -> Effect String
foreign import birthdateByYearImpl :: YearRangeOpts -> Effect String
foreign import monthImpl :: Effect String
foreign import monthAbbreviatedImpl :: Effect String
foreign import weekdayImpl :: Effect String
foreign import weekdayAbbreviatedImpl :: Effect String
foreign import timeZoneImpl :: Effect String

-- | Generate a random date at any time.
anytime :: Gen String
anytime = Gen anytimeImpl

-- | Generate a random date in the past (default: within 1 year).
past :: Gen String
past = Gen pastImpl

-- | Generate a random date in the past within specified years.
pastOpts :: PastOpts -> Gen String
pastOpts opts = Gen (pastOptsImpl opts)

-- | Generate a random date in the future (default: within 1 year).
future :: Gen String
future = Gen futureImpl

-- | Generate a random date in the future within specified years.
futureOpts :: FutureOpts -> Gen String
futureOpts opts = Gen (futureOptsImpl opts)

-- | Generate a random date between two dates (ISO string format).
between :: BetweenOpts -> Gen String
between opts = Gen (betweenImpl opts)

-- | Generate multiple random dates between two dates (ISO string format).
betweens :: BetweensOpts -> Gen (Array String)
betweens opts = Gen (betweensImpl opts)

-- | Generate a random recent date (default: within 1 day).
recent :: Gen String
recent = Gen recentImpl

-- | Generate a random recent date within specified days.
recentOpts :: RecentOpts -> Gen String
recentOpts opts = Gen (recentOptsImpl opts)

-- | Generate a random date in the near future (default: within 1 day).
soon :: Gen String
soon = Gen soonImpl

-- | Generate a random date in the near future within specified days.
soonOpts :: SoonOpts -> Gen String
soonOpts opts = Gen (soonOptsImpl opts)

-- | Generate a random birthdate with default options.
birthdate :: Gen String
birthdate = Gen birthdateImpl

-- | Generate a random birthdate within an age range.
birthdateByAge :: AgeRangeOpts -> Gen String
birthdateByAge opts = Gen (birthdateByAgeImpl opts)

-- | Generate a random birthdate within a year range.
birthdateByYear :: YearRangeOpts -> Gen String
birthdateByYear opts = Gen (birthdateByYearImpl opts)

-- | Generate a random month name.
month :: Gen String
month = Gen monthImpl

-- | Generate an abbreviated month name (e.g. "Jan").
monthAbbreviated :: Gen String
monthAbbreviated = Gen monthAbbreviatedImpl

-- | Generate a random weekday name.
weekday :: Gen String
weekday = Gen weekdayImpl

-- | Generate an abbreviated weekday name (e.g. "Mon").
weekdayAbbreviated :: Gen String
weekdayAbbreviated = Gen weekdayAbbreviatedImpl

-- | Generate a random IANA time zone string.
timeZone :: Gen String
timeZone = Gen timeZoneImpl
