module Faker.System
  ( fileName
  , commonFileName
  , commonFileNameExt
  , mimeType
  , commonFileType
  , commonFileExt
  , fileType
  , fileExt
  , fileExtMime
  , directoryPath
  , filePath
  , semver
  , networkInterface
  , networkInterfaceOpts
  , NetworkInterfaceOpts
  , cron
  , cronOpts
  , CronOpts
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

type NetworkInterfaceOpts =
  { interfaceType :: String
  , interfaceSchema :: String
  }
type CronOpts =
  { includeYear :: Boolean
  , includeNonStandard :: Boolean
  }

foreign import fileNameImpl :: Effect String
foreign import commonFileNameImpl :: Effect String
foreign import commonFileNameExtImpl :: String -> Effect String
foreign import mimeTypeImpl :: Effect String
foreign import commonFileTypeImpl :: Effect String
foreign import commonFileExtImpl :: Effect String
foreign import fileTypeImpl :: Effect String
foreign import fileExtImpl :: Effect String
foreign import fileExtMimeImpl :: String -> Effect String
foreign import directoryPathImpl :: Effect String
foreign import filePathImpl :: Effect String
foreign import semverImpl :: Effect String
foreign import networkInterfaceImpl :: Effect String
foreign import networkInterfaceOptsImpl :: NetworkInterfaceOpts -> Effect String
foreign import cronImpl :: Effect String
foreign import cronOptsImpl :: CronOpts -> Effect String

-- | Generate a random file name.
fileName :: Gen String
fileName = Gen fileNameImpl

-- | Generate a random common file name with a random extension.
commonFileName :: Gen String
commonFileName = Gen commonFileNameImpl

-- | Generate a random common file name with the given extension.
commonFileNameExt :: String -> Gen String
commonFileNameExt ext = Gen (commonFileNameExtImpl ext)

-- | Generate a random MIME type.
mimeType :: Gen String
mimeType = Gen mimeTypeImpl

-- | Generate a random common file type.
commonFileType :: Gen String
commonFileType = Gen commonFileTypeImpl

-- | Generate a random common file extension.
commonFileExt :: Gen String
commonFileExt = Gen commonFileExtImpl

-- | Generate a random file type.
fileType :: Gen String
fileType = Gen fileTypeImpl

-- | Generate a random file extension.
fileExt :: Gen String
fileExt = Gen fileExtImpl

-- | Generate a random file extension for the given MIME type.
fileExtMime :: String -> Gen String
fileExtMime mime = Gen (fileExtMimeImpl mime)

-- | Generate a random directory path.
directoryPath :: Gen String
directoryPath = Gen directoryPathImpl

-- | Generate a random file path.
filePath :: Gen String
filePath = Gen filePathImpl

-- | Generate a random semantic version string.
semver :: Gen String
semver = Gen semverImpl

-- | Generate a random network interface name with defaults.
networkInterface :: Gen String
networkInterface = Gen networkInterfaceImpl

-- | Generate a random network interface name with options.
networkInterfaceOpts :: NetworkInterfaceOpts -> Gen String
networkInterfaceOpts opts = Gen (networkInterfaceOptsImpl opts)

-- | Generate a random cron expression with defaults.
cron :: Gen String
cron = Gen cronImpl

-- | Generate a random cron expression with options.
cronOpts :: CronOpts -> Gen String
cronOpts opts = Gen (cronOptsImpl opts)
