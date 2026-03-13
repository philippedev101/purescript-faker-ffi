module Faker.Food
  ( adjective
  , description
  , dish
  , ethnicCategory
  , fruit
  , ingredient
  , meat
  , spice
  , vegetable
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

foreign import adjectiveImpl :: Effect String
foreign import descriptionImpl :: Effect String
foreign import dishImpl :: Effect String
foreign import ethnicCategoryImpl :: Effect String
foreign import fruitImpl :: Effect String
foreign import ingredientImpl :: Effect String
foreign import meatImpl :: Effect String
foreign import spiceImpl :: Effect String
foreign import vegetableImpl :: Effect String

adjective :: Gen String
adjective = Gen adjectiveImpl

description :: Gen String
description = Gen descriptionImpl

dish :: Gen String
dish = Gen dishImpl

ethnicCategory :: Gen String
ethnicCategory = Gen ethnicCategoryImpl

fruit :: Gen String
fruit = Gen fruitImpl

ingredient :: Gen String
ingredient = Gen ingredientImpl

meat :: Gen String
meat = Gen meatImpl

spice :: Gen String
spice = Gen spiceImpl

vegetable :: Gen String
vegetable = Gen vegetableImpl
