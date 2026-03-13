module Faker.Animal
  ( dog
  , cat
  , snake
  , bear
  , lion
  , cetacean
  , horse
  , bird
  , cow
  , fish
  , crocodilia
  , insect
  , rabbit
  , rodent
  , type_
  , petName
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

foreign import dogImpl :: Effect String
foreign import catImpl :: Effect String
foreign import snakeImpl :: Effect String
foreign import bearImpl :: Effect String
foreign import lionImpl :: Effect String
foreign import cetaceanImpl :: Effect String
foreign import horseImpl :: Effect String
foreign import birdImpl :: Effect String
foreign import cowImpl :: Effect String
foreign import fishImpl :: Effect String
foreign import crocodiliaImpl :: Effect String
foreign import insectImpl :: Effect String
foreign import rabbitImpl :: Effect String
foreign import rodentImpl :: Effect String
foreign import typeImpl :: Effect String
foreign import petNameImpl :: Effect String

dog :: Gen String
dog = Gen dogImpl

cat :: Gen String
cat = Gen catImpl

snake :: Gen String
snake = Gen snakeImpl

bear :: Gen String
bear = Gen bearImpl

lion :: Gen String
lion = Gen lionImpl

cetacean :: Gen String
cetacean = Gen cetaceanImpl

horse :: Gen String
horse = Gen horseImpl

bird :: Gen String
bird = Gen birdImpl

cow :: Gen String
cow = Gen cowImpl

fish :: Gen String
fish = Gen fishImpl

crocodilia :: Gen String
crocodilia = Gen crocodiliaImpl

insect :: Gen String
insect = Gen insectImpl

rabbit :: Gen String
rabbit = Gen rabbitImpl

rodent :: Gen String
rodent = Gen rodentImpl

type_ :: Gen String
type_ = Gen typeImpl

petName :: Gen String
petName = Gen petNameImpl
