module Faker.Location
  ( city
  , street
  , streetAddress
  , streetAddressOpts
  , StreetAddressOpts
  , buildingNumber
  , secondaryAddress
  , county
  , country
  , continent
  , countryCode
  , countryCodeOpts
  , CountryCodeOpts
  , state
  , stateOpts
  , StateOpts
  , zipCode
  , direction
  , directionOpts
  , directionAbbr
  , DirectionOpts
  , cardinalDirection
  , cardinalDirectionOpts
  , cardinalDirectionAbbr
  , ordinalDirection
  , ordinalDirectionOpts
  , ordinalDirectionAbbr
  , timeZone
  , latitude
  , latitudeOpts
  , LatitudeOpts
  , longitude
  , longitudeOpts
  , LongitudeOpts
  , nearbyGPSCoordinate
  , nearbyGPSCoordinateOpts
  , NearbyGPSCoordinateOpts
  , GPSCoordinate
  , language
  , Language
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

type StreetAddressOpts = { useFullAddress :: Boolean }
type CountryCodeOpts = { variant :: String }
type StateOpts = { abbreviated :: Boolean }
type DirectionOpts = { abbreviated :: Boolean }
type LatitudeOpts = { max :: Number, min :: Number, precision :: Int }
type LongitudeOpts = { max :: Number, min :: Number, precision :: Int }
type NearbyGPSCoordinateOpts =
  { origin :: Array Number
  , radius :: Number
  , isMetric :: Boolean
  }
type GPSCoordinate = { latitude :: Number, longitude :: Number }
type Language = { name :: String, alpha2 :: String, alpha3 :: String }

foreign import cityImpl :: Effect String
foreign import streetImpl :: Effect String
foreign import streetAddressImpl :: Effect String
foreign import streetAddressOptsImpl :: StreetAddressOpts -> Effect String
foreign import buildingNumberImpl :: Effect String
foreign import secondaryAddressImpl :: Effect String
foreign import countyImpl :: Effect String
foreign import countryImpl :: Effect String
foreign import continentImpl :: Effect String
foreign import countryCodeImpl :: Effect String
foreign import countryCodeOptsImpl :: CountryCodeOpts -> Effect String
foreign import stateImpl :: Effect String
foreign import stateOptsImpl :: StateOpts -> Effect String
foreign import zipCodeImpl :: Effect String
foreign import directionImpl :: Effect String
foreign import directionOptsImpl :: DirectionOpts -> Effect String
foreign import cardinalDirectionImpl :: Effect String
foreign import cardinalDirectionOptsImpl :: DirectionOpts -> Effect String
foreign import ordinalDirectionImpl :: Effect String
foreign import ordinalDirectionOptsImpl :: DirectionOpts -> Effect String
foreign import timeZoneImpl :: Effect String
foreign import latitudeImpl :: Effect Number
foreign import latitudeOptsImpl :: LatitudeOpts -> Effect Number
foreign import longitudeImpl :: Effect Number
foreign import longitudeOptsImpl :: LongitudeOpts -> Effect Number
foreign import nearbyGPSCoordinateImpl :: Effect GPSCoordinate
foreign import nearbyGPSCoordinateOptsImpl :: NearbyGPSCoordinateOpts -> Effect GPSCoordinate
foreign import languageImpl :: Effect Language

city :: Gen String
city = Gen cityImpl

street :: Gen String
street = Gen streetImpl

streetAddress :: Gen String
streetAddress = Gen streetAddressImpl

streetAddressOpts :: StreetAddressOpts -> Gen String
streetAddressOpts opts = Gen (streetAddressOptsImpl opts)

buildingNumber :: Gen String
buildingNumber = Gen buildingNumberImpl

secondaryAddress :: Gen String
secondaryAddress = Gen secondaryAddressImpl

county :: Gen String
county = Gen countyImpl

country :: Gen String
country = Gen countryImpl

continent :: Gen String
continent = Gen continentImpl

countryCode :: Gen String
countryCode = Gen countryCodeImpl

countryCodeOpts :: CountryCodeOpts -> Gen String
countryCodeOpts opts = Gen (countryCodeOptsImpl opts)

state :: Gen String
state = Gen stateImpl

stateOpts :: StateOpts -> Gen String
stateOpts opts = Gen (stateOptsImpl opts)

zipCode :: Gen String
zipCode = Gen zipCodeImpl

direction :: Gen String
direction = Gen directionImpl

directionOpts :: DirectionOpts -> Gen String
directionOpts opts = Gen (directionOptsImpl opts)

directionAbbr :: Gen String
directionAbbr = Gen (directionOptsImpl { abbreviated: true })

cardinalDirection :: Gen String
cardinalDirection = Gen cardinalDirectionImpl

cardinalDirectionOpts :: DirectionOpts -> Gen String
cardinalDirectionOpts opts = Gen (cardinalDirectionOptsImpl opts)

cardinalDirectionAbbr :: Gen String
cardinalDirectionAbbr = Gen (cardinalDirectionOptsImpl { abbreviated: true })

ordinalDirection :: Gen String
ordinalDirection = Gen ordinalDirectionImpl

ordinalDirectionOpts :: DirectionOpts -> Gen String
ordinalDirectionOpts opts = Gen (ordinalDirectionOptsImpl opts)

ordinalDirectionAbbr :: Gen String
ordinalDirectionAbbr = Gen (ordinalDirectionOptsImpl { abbreviated: true })

timeZone :: Gen String
timeZone = Gen timeZoneImpl

latitude :: Gen Number
latitude = Gen latitudeImpl

latitudeOpts :: LatitudeOpts -> Gen Number
latitudeOpts opts = Gen (latitudeOptsImpl opts)

longitude :: Gen Number
longitude = Gen longitudeImpl

longitudeOpts :: LongitudeOpts -> Gen Number
longitudeOpts opts = Gen (longitudeOptsImpl opts)

nearbyGPSCoordinate :: Gen GPSCoordinate
nearbyGPSCoordinate = Gen nearbyGPSCoordinateImpl

nearbyGPSCoordinateOpts :: NearbyGPSCoordinateOpts -> Gen GPSCoordinate
nearbyGPSCoordinateOpts opts = Gen (nearbyGPSCoordinateOptsImpl opts)

language :: Gen Language
language = Gen languageImpl
