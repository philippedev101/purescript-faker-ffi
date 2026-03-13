module Faker.Database
  ( column
  , type_
  , collation
  , engine
  , mongodbObjectId
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

foreign import columnImpl :: Effect String
foreign import typeImpl :: Effect String
foreign import collationImpl :: Effect String
foreign import engineImpl :: Effect String
foreign import mongodbObjectIdImpl :: Effect String

column :: Gen String
column = Gen columnImpl

type_ :: Gen String
type_ = Gen typeImpl

collation :: Gen String
collation = Gen collationImpl

engine :: Gen String
engine = Gen engineImpl

mongodbObjectId :: Gen String
mongodbObjectId = Gen mongodbObjectIdImpl
