module Faker.Internet
  ( email
  , emailOpts
  , EmailOpts
  , exampleEmail
  , exampleEmailOpts
  , ExampleEmailOpts
  , username
  , usernameOpts
  , UsernameOpts
  , displayName
  , displayNameOpts
  , DisplayNameOpts
  , protocol
  , httpMethod
  , httpStatusCode
  , url
  , urlOpts
  , UrlOpts
  , domainName
  , domainSuffix
  , domainWord
  , ip
  , ipv4
  , ipv4Opts
  , Ipv4Opts
  , ipv6
  , port
  , userAgent
  , mac
  , macWithSeparator
  , password
  , passwordOpts
  , PasswordOpts
  , emoji
  , jwt
  , jwtAlgorithm
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

type EmailOpts =
  { firstName :: String
  , lastName :: String
  , provider :: String
  , allowSpecialCharacters :: Boolean
  }

type ExampleEmailOpts =
  { firstName :: String
  , lastName :: String
  , allowSpecialCharacters :: Boolean
  }

type UsernameOpts =
  { firstName :: String
  , lastName :: String
  }

type DisplayNameOpts =
  { firstName :: String
  , lastName :: String
  }

type UrlOpts =
  { appendSlash :: Boolean
  , protocol :: String
  }

type Ipv4Opts =
  { cidrBlock :: String
  }

type PasswordOpts =
  { length :: Int
  , memorable :: Boolean
  , prefix :: String
  }

foreign import emailImpl :: Effect String
foreign import emailOptsImpl :: EmailOpts -> Effect String
foreign import exampleEmailImpl :: Effect String
foreign import exampleEmailOptsImpl :: ExampleEmailOpts -> Effect String
foreign import usernameImpl :: Effect String
foreign import usernameOptsImpl :: UsernameOpts -> Effect String
foreign import displayNameImpl :: Effect String
foreign import displayNameOptsImpl :: DisplayNameOpts -> Effect String
foreign import protocolImpl :: Effect String
foreign import httpMethodImpl :: Effect String
foreign import httpStatusCodeImpl :: Effect Int
foreign import urlImpl :: Effect String
foreign import urlOptsImpl :: UrlOpts -> Effect String
foreign import domainNameImpl :: Effect String
foreign import domainSuffixImpl :: Effect String
foreign import domainWordImpl :: Effect String
foreign import ipImpl :: Effect String
foreign import ipv4Impl :: Effect String
foreign import ipv4OptsImpl :: Ipv4Opts -> Effect String
foreign import ipv6Impl :: Effect String
foreign import portImpl :: Effect Int
foreign import userAgentImpl :: Effect String
foreign import macImpl :: Effect String
foreign import macWithSeparatorImpl :: String -> Effect String
foreign import passwordImpl :: Effect String
foreign import passwordOptsImpl :: PasswordOpts -> Effect String
foreign import emojiImpl :: Effect String
foreign import jwtImpl :: Effect String
foreign import jwtAlgorithmImpl :: Effect String

email :: Gen String
email = Gen emailImpl

emailOpts :: EmailOpts -> Gen String
emailOpts opts = Gen (emailOptsImpl opts)

exampleEmail :: Gen String
exampleEmail = Gen exampleEmailImpl

exampleEmailOpts :: ExampleEmailOpts -> Gen String
exampleEmailOpts opts = Gen (exampleEmailOptsImpl opts)

username :: Gen String
username = Gen usernameImpl

usernameOpts :: UsernameOpts -> Gen String
usernameOpts opts = Gen (usernameOptsImpl opts)

displayName :: Gen String
displayName = Gen displayNameImpl

displayNameOpts :: DisplayNameOpts -> Gen String
displayNameOpts opts = Gen (displayNameOptsImpl opts)

protocol :: Gen String
protocol = Gen protocolImpl

httpMethod :: Gen String
httpMethod = Gen httpMethodImpl

httpStatusCode :: Gen Int
httpStatusCode = Gen httpStatusCodeImpl

url :: Gen String
url = Gen urlImpl

urlOpts :: UrlOpts -> Gen String
urlOpts opts = Gen (urlOptsImpl opts)

domainName :: Gen String
domainName = Gen domainNameImpl

domainSuffix :: Gen String
domainSuffix = Gen domainSuffixImpl

domainWord :: Gen String
domainWord = Gen domainWordImpl

ip :: Gen String
ip = Gen ipImpl

ipv4 :: Gen String
ipv4 = Gen ipv4Impl

ipv4Opts :: Ipv4Opts -> Gen String
ipv4Opts opts = Gen (ipv4OptsImpl opts)

ipv6 :: Gen String
ipv6 = Gen ipv6Impl

port :: Gen Int
port = Gen portImpl

userAgent :: Gen String
userAgent = Gen userAgentImpl

mac :: Gen String
mac = Gen macImpl

macWithSeparator :: String -> Gen String
macWithSeparator sep = Gen (macWithSeparatorImpl sep)

password :: Gen String
password = Gen passwordImpl

passwordOpts :: PasswordOpts -> Gen String
passwordOpts opts = Gen (passwordOptsImpl opts)

emoji :: Gen String
emoji = Gen emojiImpl

jwt :: Gen String
jwt = Gen jwtImpl

jwtAlgorithm :: Gen String
jwtAlgorithm = Gen jwtAlgorithmImpl
