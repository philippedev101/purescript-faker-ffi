module Faker.Commerce
  ( department
  , productName
  , price
  , priceOpts
  , PriceOpts
  , productAdjective
  , productMaterial
  , product
  , productDescription
  , isbn
  , isbnOpts
  , IsbnOpts
  , upc
  , upcOpts
  , UpcOpts
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

type PriceOpts =
  { min :: Number
  , max :: Number
  , dec :: Int
  , symbol :: String
  }

type IsbnOpts =
  { variant :: Int
  , separator :: String
  }

type UpcOpts =
  { prefix :: String
  }

foreign import departmentImpl :: Effect String
foreign import productNameImpl :: Effect String
foreign import priceImpl :: Effect String
foreign import priceOptsImpl :: PriceOpts -> Effect String
foreign import productAdjectiveImpl :: Effect String
foreign import productMaterialImpl :: Effect String
foreign import productImpl :: Effect String
foreign import productDescriptionImpl :: Effect String
foreign import isbnImpl :: Effect String
foreign import isbnOptsImpl :: IsbnOpts -> Effect String
foreign import upcImpl :: Effect String
foreign import upcOptsImpl :: UpcOpts -> Effect String

department :: Gen String
department = Gen departmentImpl

productName :: Gen String
productName = Gen productNameImpl

price :: Gen String
price = Gen priceImpl

priceOpts :: PriceOpts -> Gen String
priceOpts opts = Gen (priceOptsImpl opts)

productAdjective :: Gen String
productAdjective = Gen productAdjectiveImpl

productMaterial :: Gen String
productMaterial = Gen productMaterialImpl

product :: Gen String
product = Gen productImpl

productDescription :: Gen String
productDescription = Gen productDescriptionImpl

isbn :: Gen String
isbn = Gen isbnImpl

isbnOpts :: IsbnOpts -> Gen String
isbnOpts opts = Gen (isbnOptsImpl opts)

upc :: Gen String
upc = Gen upcImpl

upcOpts :: UpcOpts -> Gen String
upcOpts opts = Gen (upcOptsImpl opts)
