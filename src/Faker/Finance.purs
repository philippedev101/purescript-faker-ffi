module Faker.Finance
  ( accountNumber
  , accountNumberOpts
  , AccountNumberOpts
  , accountName
  , routingNumber
  , amount
  , amountOpts
  , AmountOpts
  , transactionType
  , currency
  , Currency
  , currencyCode
  , currencyName
  , currencySymbol
  , bitcoinAddress
  , litecoinAddress
  , creditCardNumber
  , creditCardNumberOpts
  , CreditCardNumberOpts
  , creditCardCVV
  , creditCardIssuer
  , pin
  , pinN
  , ethereumAddress
  , iban
  , ibanOpts
  , IbanOpts
  , bic
  , bicOpts
  , BicOpts
  , currencyNumericCode
  , transactionDescription
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

type AccountNumberOpts = { length :: Int }
type AmountOpts = { min :: Number, max :: Number, dec :: Int, symbol :: String }
type Currency = { name :: String, code :: String, symbol :: String, numericCode :: String }
type CreditCardNumberOpts = { issuer :: String }
type IbanOpts = { formatted :: Boolean, countryCode :: String }
type BicOpts = { includeBranchCode :: Boolean }

foreign import accountNumberImpl :: Effect String
foreign import accountNumberOptsImpl :: AccountNumberOpts -> Effect String
foreign import accountNameImpl :: Effect String
foreign import routingNumberImpl :: Effect String
foreign import amountImpl :: Effect String
foreign import amountOptsImpl :: AmountOpts -> Effect String
foreign import transactionTypeImpl :: Effect String
foreign import currencyImpl :: Effect Currency
foreign import currencyCodeImpl :: Effect String
foreign import currencyNameImpl :: Effect String
foreign import currencySymbolImpl :: Effect String
foreign import bitcoinAddressImpl :: Effect String
foreign import litecoinAddressImpl :: Effect String
foreign import creditCardNumberImpl :: Effect String
foreign import creditCardNumberOptsImpl :: CreditCardNumberOpts -> Effect String
foreign import creditCardCVVImpl :: Effect String
foreign import creditCardIssuerImpl :: Effect String
foreign import pinImpl :: Effect String
foreign import pinNImpl :: Int -> Effect String
foreign import ethereumAddressImpl :: Effect String
foreign import ibanImpl :: Effect String
foreign import ibanOptsImpl :: IbanOpts -> Effect String
foreign import bicImpl :: Effect String
foreign import bicOptsImpl :: BicOpts -> Effect String
foreign import currencyNumericCodeImpl :: Effect String
foreign import transactionDescriptionImpl :: Effect String

accountNumber :: Gen String
accountNumber = Gen accountNumberImpl

accountNumberOpts :: AccountNumberOpts -> Gen String
accountNumberOpts opts = Gen (accountNumberOptsImpl opts)

accountName :: Gen String
accountName = Gen accountNameImpl

routingNumber :: Gen String
routingNumber = Gen routingNumberImpl

amount :: Gen String
amount = Gen amountImpl

amountOpts :: AmountOpts -> Gen String
amountOpts opts = Gen (amountOptsImpl opts)

transactionType :: Gen String
transactionType = Gen transactionTypeImpl

currency :: Gen Currency
currency = Gen currencyImpl

currencyCode :: Gen String
currencyCode = Gen currencyCodeImpl

currencyName :: Gen String
currencyName = Gen currencyNameImpl

currencySymbol :: Gen String
currencySymbol = Gen currencySymbolImpl

bitcoinAddress :: Gen String
bitcoinAddress = Gen bitcoinAddressImpl

litecoinAddress :: Gen String
litecoinAddress = Gen litecoinAddressImpl

creditCardNumber :: Gen String
creditCardNumber = Gen creditCardNumberImpl

creditCardNumberOpts :: CreditCardNumberOpts -> Gen String
creditCardNumberOpts opts = Gen (creditCardNumberOptsImpl opts)

creditCardCVV :: Gen String
creditCardCVV = Gen creditCardCVVImpl

creditCardIssuer :: Gen String
creditCardIssuer = Gen creditCardIssuerImpl

pin :: Gen String
pin = Gen pinImpl

pinN :: Int -> Gen String
pinN n = Gen (pinNImpl n)

ethereumAddress :: Gen String
ethereumAddress = Gen ethereumAddressImpl

iban :: Gen String
iban = Gen ibanImpl

ibanOpts :: IbanOpts -> Gen String
ibanOpts opts = Gen (ibanOptsImpl opts)

bic :: Gen String
bic = Gen bicImpl

bicOpts :: BicOpts -> Gen String
bicOpts opts = Gen (bicOptsImpl opts)

currencyNumericCode :: Gen String
currencyNumericCode = Gen currencyNumericCodeImpl

transactionDescription :: Gen String
transactionDescription = Gen transactionDescriptionImpl
