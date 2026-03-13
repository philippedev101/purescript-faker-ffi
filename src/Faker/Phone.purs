module Faker.Phone
  ( phoneNumber
  , phoneNumberWithStyle
  , imei
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

foreign import phoneNumberImpl :: Effect String
foreign import phoneNumberWithStyleImpl :: String -> Effect String
foreign import imeiImpl :: Effect String

phoneNumber :: Gen String
phoneNumber = Gen phoneNumberImpl

phoneNumberWithStyle :: String -> Gen String
phoneNumberWithStyle style = Gen (phoneNumberWithStyleImpl style)

imei :: Gen String
imei = Gen imeiImpl
