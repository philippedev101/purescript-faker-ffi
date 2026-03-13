module Faker.Vehicle
  ( vehicle
  , manufacturer
  , model
  , type_
  , fuel
  , vin
  , color
  , vrm
  , bicycle
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

foreign import vehicleImpl :: Effect String
foreign import manufacturerImpl :: Effect String
foreign import modelImpl :: Effect String
foreign import typeImpl :: Effect String
foreign import fuelImpl :: Effect String
foreign import vinImpl :: Effect String
foreign import colorImpl :: Effect String
foreign import vrmImpl :: Effect String
foreign import bicycleImpl :: Effect String

vehicle :: Gen String
vehicle = Gen vehicleImpl

manufacturer :: Gen String
manufacturer = Gen manufacturerImpl

model :: Gen String
model = Gen modelImpl

type_ :: Gen String
type_ = Gen typeImpl

fuel :: Gen String
fuel = Gen fuelImpl

vin :: Gen String
vin = Gen vinImpl

color :: Gen String
color = Gen colorImpl

vrm :: Gen String
vrm = Gen vrmImpl

bicycle :: Gen String
bicycle = Gen bicycleImpl
