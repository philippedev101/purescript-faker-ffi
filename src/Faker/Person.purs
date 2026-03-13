module Faker.Person
  ( firstName
  , firstNameWithSex
  , lastName
  , lastNameWithSex
  , middleName
  , middleNameWithSex
  , fullName
  , fullNameOpts
  , FullNameOpts
  , gender
  , sex
  , sexType
  , bio
  , prefix
  , prefixWithSex
  , suffix
  , jobTitle
  , jobDescriptor
  , jobArea
  , jobType
  , zodiacSign
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

type FullNameOpts =
  { firstName :: String
  , lastName :: String
  , sex :: String
  }

foreign import firstNameImpl :: Effect String
foreign import firstNameWithSexImpl :: String -> Effect String
foreign import lastNameImpl :: Effect String
foreign import lastNameWithSexImpl :: String -> Effect String
foreign import middleNameImpl :: Effect String
foreign import middleNameWithSexImpl :: String -> Effect String
foreign import fullNameImpl :: Effect String
foreign import fullNameOptsImpl :: FullNameOpts -> Effect String
foreign import genderImpl :: Effect String
foreign import sexImpl :: Effect String
foreign import sexTypeImpl :: Effect String
foreign import bioImpl :: Effect String
foreign import prefixImpl :: Effect String
foreign import prefixWithSexImpl :: String -> Effect String
foreign import suffixImpl :: Effect String
foreign import jobTitleImpl :: Effect String
foreign import jobDescriptorImpl :: Effect String
foreign import jobAreaImpl :: Effect String
foreign import jobTypeImpl :: Effect String
foreign import zodiacSignImpl :: Effect String

firstName :: Gen String
firstName = Gen firstNameImpl

firstNameWithSex :: String -> Gen String
firstNameWithSex s = Gen (firstNameWithSexImpl s)

lastName :: Gen String
lastName = Gen lastNameImpl

lastNameWithSex :: String -> Gen String
lastNameWithSex s = Gen (lastNameWithSexImpl s)

middleName :: Gen String
middleName = Gen middleNameImpl

middleNameWithSex :: String -> Gen String
middleNameWithSex s = Gen (middleNameWithSexImpl s)

fullName :: Gen String
fullName = Gen fullNameImpl

fullNameOpts :: FullNameOpts -> Gen String
fullNameOpts opts = Gen (fullNameOptsImpl opts)

gender :: Gen String
gender = Gen genderImpl

sex :: Gen String
sex = Gen sexImpl

sexType :: Gen String
sexType = Gen sexTypeImpl

bio :: Gen String
bio = Gen bioImpl

prefix :: Gen String
prefix = Gen prefixImpl

prefixWithSex :: String -> Gen String
prefixWithSex s = Gen (prefixWithSexImpl s)

suffix :: Gen String
suffix = Gen suffixImpl

jobTitle :: Gen String
jobTitle = Gen jobTitleImpl

jobDescriptor :: Gen String
jobDescriptor = Gen jobDescriptorImpl

jobArea :: Gen String
jobArea = Gen jobAreaImpl

jobType :: Gen String
jobType = Gen jobTypeImpl

zodiacSign :: Gen String
zodiacSign = Gen zodiacSignImpl
