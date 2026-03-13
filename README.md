# purescript-faker-ffi

PureScript FFI bindings for [`@faker-js/faker`](https://fakerjs.dev/) v10.

Covers the full fakerjs API surface — 28 modules, 200+ generators — with typed option records and a `Gen` monad for composition.

## Install

```
spago install faker-ffi
bun add @faker-js/faker
```

## Quick start

```purescript
module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Faker.Gen (runGen)
import Faker.Person as Person
import Faker.Lorem as Lorem
import Faker.Helpers (listOf, oneOf, joinWith)

main :: Effect Unit
main = do
  name <- runGen Person.fullName
  log $ "Name: " <> name

  bio <- runGen $ joinWith " " [Person.firstName, Lorem.sentence]
  log $ "Bio: " <> bio

  names <- runGen $ listOf 5 Person.firstName
  log $ "Names: " <> show names

  word <- runGen $ oneOf [Lorem.word, Lorem.sentence]
  log $ "Random: " <> word
```

## Gen monad

All generators return `Gen a`, a thin newtype over `Effect`. Since fakerjs uses `Math.random` internally, generation is inherently effectful — the newtype gives you a distinct type for "data generation" and lets generators compose monadically:

```purescript
newtype Gen a = Gen (Effect a)
-- Derives Functor, Apply, Applicative, Bind, Monad

runGen :: forall a. Gen a -> Effect a
```

```purescript
import Faker.Gen (Gen, runGen)
import Faker.Person as Person
import Faker.Number as Number
import Faker.Date as Date

data User = User String String Int String

genUser :: Gen User
genUser = do
  first <- Person.firstName
  last  <- Person.lastName
  age   <- Number.intRange { min: 18, max: 80 }
  joined <- Date.past
  pure $ User first last age joined

main :: Effect Unit
main = do
  user <- runGen genUser
  -- ...
```

### Fake typeclass

The `Fake` typeclass provides a canonical generator for types where there's one obvious way to generate a value:

```purescript
class Fake a where
  fake :: Gen a
```

Define instances for your own domain types:

```purescript
instance Fake UserId where
  fake = UserId <$> Number.intRange { min: 1, max: 999999 }

instance Fake Role where
  fake = Helpers.elements [Admin, User, Guest]
```

## Seeded generation

For reproducible output, use `runGenSeeded`:

```purescript
import Faker.Seed (runGenSeeded)

main = do
  name1 <- runGenSeeded 42 Person.firstName
  name2 <- runGenSeeded 42 Person.firstName
  -- name1 == name2
```

## Combinators

`Faker.Helpers` provides combinators for building complex generators:

| Combinator | Type | Description |
|---|---|---|
| `elements` | `Array a -> Gen a` | Pick a random element |
| `oneOf` | `Array (Gen a) -> Gen a` | Pick and run a random generator |
| `weighted` | `Array { value :: a, weight :: Number } -> Gen a` | Weighted random selection |
| `frequency` | `Array (Tuple Number (Gen a)) -> Gen a` | Weighted choice over generators |
| `choose` | `Int -> Int -> Gen Int` | Random int in range |
| `chooseFloat` | `Number -> Number -> Gen Number` | Random float in range |
| `chance` | `Number -> Gen Boolean` | Boolean with probability (0.3 = 30% true) |
| `perhaps` | `Number -> Gen a -> Gen (Maybe a)` | Maybe with probability |
| `listOf` | `Int -> Gen a -> Gen (Array a)` | Generate N values |
| `listOfRange` | `Int -> Int -> Gen a -> Gen (Array a)` | Generate random-length array |
| `shuffle` | `Array a -> Gen (Array a)` | Randomly reorder |
| `sample` | `Int -> Array a -> Gen (Array a)` | Pick N elements from array |
| `uniqueArray` | `Array a -> Int -> Gen (Array a)` | Pick N distinct elements |
| `uniqueArrayGen` | `Gen a -> Int -> Gen (Array a)` | Generate N unique values |
| `joinWith` | `String -> Array (Gen String) -> Gen String` | Generate and join strings |
| `multiple` | `Gen a -> Int -> Gen (Array a)` | Run generator N times (via fakerjs) |
| `multipleRange` | `Gen a -> { min, max } -> Gen (Array a)` | Run generator random number of times |

Pure utilities (no `Gen` wrapper):

| Function | Type | Description |
|---|---|---|
| `slugify` | `String -> String` | Replace spaces with hyphens, strip non-word chars |
| `mustache` | `String -> Record r -> String` | Mustache template substitution |

Effectful string utilities:

| Function | Description |
|---|---|
| `replaceSymbols` | Replace `#` with digit, `?` with letter, `*` with either |
| `replaceCreditCardSymbols` | Like `replaceSymbols` with Luhn check digit for `L` |
| `fromRegExp` | Generate string matching a regex pattern |
| `fakePattern` | Interpolate `{{module.method}}` placeholders |

## Option variants

Most fakerjs methods accept option objects. We expose these as two function variants — a zero-arg default and an opts variant with a typed record:

```purescript
-- Default
sentence :: Gen String

-- With options
sentenceN :: Int -> Gen String
sentenceRange :: RangeOpts -> Gen String

-- Option record
type RangeOpts = { min :: Int, max :: Int }
```

```purescript
import Faker.Internet as Internet

-- Default email
email <- runGen Internet.email

-- Customized
email <- runGen $ Internet.emailOpts
  { firstName: "Ada"
  , lastName: "Lovelace"
  , provider: "example.com"
  , allowSpecialCharacters: false
  }
```

## Structured returns

Some generators return typed records instead of strings:

```purescript
import Faker.Finance as Finance
import Faker.Airline as Airline
import Faker.Science as Science

-- { name :: String, code :: String, symbol :: String, numericCode :: String }
cur <- runGen Finance.currency

-- { name :: String, iataCode :: String }
airport <- runGen Airline.airport

-- { symbol :: String, name :: String, atomicNumber :: Int }
element <- runGen Science.chemicalElement
```

## Modules

### Core

| Module | Description |
|---|---|
| `Faker.Gen` | `Gen` newtype, `Fake` typeclass, `runGen` |
| `Faker.Helpers` | Combinators and string utilities |
| `Faker.Seed` | `seed`, `runGenSeeded` |

### Generators

| Module | Functions | Notes |
|---|---|---|
| `Faker.Airline` | `airport`, `airline`, `airplane`, `recordLocator`, `seat`, `aircraftType`, `flightNumber` | Structured returns + opts |
| `Faker.Animal` | `dog`, `cat`, `snake`, `bear`, `lion`, `cetacean`, `horse`, `bird`, `cow`, `fish`, `crocodilia`, `insect`, `rabbit`, `rodent`, `type_`, `petName` | |
| `Faker.Book` | `author`, `format`, `genre`, `publisher`, `series`, `title` | |
| `Faker.Color` | `human`, `space`, `rgb`, `rgbCss`, `cmyk`, `hsl`, `hwb`, `lab`, `lch`, `cssSupportedFunction`, `cssSupportedSpace`, `colorByCSSColorSpace` | `colorByCSSColorSpace` returns `Array Number` |
| `Faker.Commerce` | `department`, `productName`, `price`, `productAdjective`, `productMaterial`, `product`, `productDescription`, `isbn`, `upc` | Opts for price, isbn, upc |
| `Faker.Company` | `name`, `catchPhrase`, `buzzPhrase`, `catchPhraseAdjective`, `catchPhraseDescriptor`, `catchPhraseNoun`, `buzzAdjective`, `buzzVerb`, `buzzNoun` | |
| `Faker.Database` | `column`, `type_`, `collation`, `engine`, `mongodbObjectId` | |
| `Faker.Datatype` | `boolean`, `booleanWithProbability` | |
| `Faker.Date` | `anytime`, `past`, `future`, `between`, `betweens`, `recent`, `soon`, `birthdate`, `month`, `weekday`, `timeZone` | ISO strings; opts for most; `betweens` returns `Array String` |
| `Faker.Finance` | `accountNumber`, `accountName`, `routingNumber`, `amount`, `transactionType`, `currency`, `currencyCode`, `currencyName`, `currencySymbol`, `currencyNumericCode`, `bitcoinAddress`, `litecoinAddress`, `creditCardNumber`, `creditCardCVV`, `creditCardIssuer`, `pin`, `ethereumAddress`, `iban`, `bic`, `transactionDescription` | `currency` returns record |
| `Faker.Food` | `adjective`, `description`, `dish`, `ethnicCategory`, `fruit`, `ingredient`, `meat`, `spice`, `vegetable` | |
| `Faker.Git` | `branch`, `commitMessage`, `commitSha`, `commitEntry`, `commitDate` | `commitShaN`, `commitEntryOpts` |
| `Faker.Hacker` | `abbreviation`, `adjective`, `noun`, `verb`, `ingverb`, `phrase` | |
| `Faker.Image` | `avatar`, `avatarGitHub`, `url`, `urlPicsumPhotos`, `dataUri`, `personPortrait` | Opts for url, dataUri, personPortrait |
| `Faker.Internet` | `email`, `exampleEmail`, `username`, `displayName`, `protocol`, `httpMethod`, `httpStatusCode`, `url`, `domainName`, `domainSuffix`, `domainWord`, `ip`, `ipv4`, `ipv6`, `port`, `userAgent`, `mac`, `password`, `emoji`, `jwt`, `jwtAlgorithm` | Opts for email, username, displayName, url, ipv4, password |
| `Faker.Location` | `city`, `street`, `streetAddress`, `buildingNumber`, `secondaryAddress`, `county`, `country`, `continent`, `countryCode`, `state`, `zipCode`, `direction`, `cardinalDirection`, `ordinalDirection`, `timeZone`, `latitude`, `longitude`, `nearbyGPSCoordinate`, `language` | `nearbyGPSCoordinate` and `language` return records |
| `Faker.Lorem` | `word`, `words`, `sentence`, `sentences`, `paragraph`, `paragraphs`, `slug`, `lines`, `text` | N, Range, and Opts variants |
| `Faker.Music` | `album`, `artist`, `genre`, `songName` | |
| `Faker.Number` | `int`, `float`, `binary`, `octal`, `hex`, `romanNumeral` | Range and Opts variants |
| `Faker.Person` | `firstName`, `lastName`, `middleName`, `fullName`, `gender`, `sex`, `sexType`, `bio`, `prefix`, `suffix`, `jobTitle`, `jobDescriptor`, `jobArea`, `jobType`, `zodiacSign` | WithSex and Opts variants |
| `Faker.Phone` | `phoneNumber`, `phoneNumberWithStyle`, `imei` | |
| `Faker.Science` | `chemicalElement`, `unit` | Structured returns |
| `Faker.String` | `uuid`, `ulid`, `nanoid`, `alpha`, `alphanumeric`, `numeric`, `hexadecimal`, `binary`, `octal`, `sample`, `fromCharacters`, `symbol` | N and Opts variants |
| `Faker.System` | `fileName`, `commonFileName`, `mimeType`, `commonFileType`, `commonFileExt`, `fileType`, `fileExt`, `directoryPath`, `filePath`, `semver`, `networkInterface`, `cron` | Opts for networkInterface, cron |
| `Faker.Vehicle` | `vehicle`, `manufacturer`, `model`, `type_`, `fuel`, `vin`, `color`, `vrm`, `bicycle` | |
| `Faker.Word` | `adjective`, `adverb`, `conjunction`, `interjection`, `noun`, `preposition`, `verb`, `sample`, `words` | N variants for all |

## License

MIT
