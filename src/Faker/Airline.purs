module Faker.Airline
  ( airport
  , Airport
  , airline
  , Airline
  , airplane
  , Airplane
  , recordLocator
  , recordLocatorOpts
  , RecordLocatorOpts
  , seat
  , seatOpts
  , SeatOpts
  , aircraftType
  , flightNumber
  , flightNumberOpts
  , FlightNumberOpts
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

type Airport = { name :: String, iataCode :: String }
type Airline = { name :: String, iataCode :: String }
type Airplane = { name :: String, iataTypeCode :: String }
type RecordLocatorOpts =
  { allowNumerics :: Boolean
  , allowVisuallySimilarCharacters :: Boolean
  }
type SeatOpts = { aircraftType :: String }
type FlightNumberOpts = { length :: Int, addLeadingZeros :: Boolean }

foreign import airportImpl :: Effect Airport
foreign import airlineImpl :: Effect Airline
foreign import airplaneImpl :: Effect Airplane
foreign import recordLocatorImpl :: Effect String
foreign import recordLocatorOptsImpl :: RecordLocatorOpts -> Effect String
foreign import seatImpl :: Effect String
foreign import seatOptsImpl :: SeatOpts -> Effect String
foreign import aircraftTypeImpl :: Effect String
foreign import flightNumberImpl :: Effect String
foreign import flightNumberOptsImpl :: FlightNumberOpts -> Effect String

-- | Generate a random airport with name and IATA code.
airport :: Gen Airport
airport = Gen airportImpl

-- | Generate a random airline with name and IATA code.
airline :: Gen Airline
airline = Gen airlineImpl

-- | Generate a random airplane with name and IATA type code.
airplane :: Gen Airplane
airplane = Gen airplaneImpl

-- | Generate a random record locator with defaults.
recordLocator :: Gen String
recordLocator = Gen recordLocatorImpl

-- | Generate a random record locator with options.
recordLocatorOpts :: RecordLocatorOpts -> Gen String
recordLocatorOpts opts = Gen (recordLocatorOptsImpl opts)

-- | Generate a random seat number with defaults.
seat :: Gen String
seat = Gen seatImpl

-- | Generate a random seat number with aircraft type option.
seatOpts :: SeatOpts -> Gen String
seatOpts opts = Gen (seatOptsImpl opts)

-- | Generate a random aircraft type.
aircraftType :: Gen String
aircraftType = Gen aircraftTypeImpl

-- | Generate a random flight number with defaults.
flightNumber :: Gen String
flightNumber = Gen flightNumberImpl

-- | Generate a random flight number with options.
flightNumberOpts :: FlightNumberOpts -> Gen String
flightNumberOpts opts = Gen (flightNumberOptsImpl opts)
