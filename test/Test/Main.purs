module Test.Main where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Console (log)
import Faker.Gen (runGen)
import Faker.Seed (runGenSeeded)
import Faker.Helpers as H
import Faker.Lorem as Lorem
import Faker.Person as Person
import Faker.Number as Number
import Faker.Commerce as Commerce
import Faker.Date as Date
import Faker.Animal as Animal
import Faker.Internet as Internet
import Faker.Location as Location
import Faker.Finance as Finance
import Faker.Airline as Airline
import Faker.Science as Science
import Faker.String as FString
import Faker.Color as Color
import Faker.Word as Word
import Faker.Company as Company
import Faker.Datatype as Datatype
import Faker.System as System
import Faker.Book as Book
import Faker.Database as Database
import Faker.Food as Food
import Faker.Git as Git
import Faker.Hacker as Hacker
import Faker.Image as Image
import Faker.Music as Music
import Faker.Phone as Phone
import Faker.Vehicle as Vehicle

main :: Effect Unit
main = do
  log "=== purescript-fakerjs smoke test ==="

  -- Seeded generation
  log "\n--- Seed ---"
  name1 <- runGenSeeded 42 Person.firstName
  name2 <- runGenSeeded 42 Person.firstName
  log $ "Reproducible: " <> name1 <> " == " <> name2

  -- Core combinators
  log "\n--- Helpers ---"
  picked <- runGen $ H.elements ["red", "green", "blue"]
  log $ "elements: " <> picked
  w <- runGen $ H.weighted
    [ { value: "common", weight: 9.0 }
    , { value: "rare", weight: 1.0 }
    ]
  log $ "weighted: " <> w
  coin <- runGen $ H.chance 0.5
  log $ "chance: " <> show coin
  names <- runGen $ H.listOf 3 Person.firstName
  log $ "listOf: " <> show names
  ranged <- runGen $ H.listOfRange 2 5 Lorem.word
  log $ "listOfRange: " <> show ranged
  mbVal <- runGen $ H.perhaps 0.99 Lorem.word
  case mbVal of
    Just v -> log $ "perhaps: Just " <> v
    Nothing -> log "perhaps: Nothing"
  joined <- runGen $ H.joinWith ", " [Person.firstName, Person.lastName]
  log $ "joinWith: " <> joined
  shuffled <- runGen $ H.shuffle [1, 2, 3, 4, 5]
  log $ "shuffle: " <> show shuffled
  sampled <- runGen $ H.sample 2 ["a", "b", "c", "d"]
  log $ "sample: " <> show sampled
  void $ runGen $ H.sampleRange { min: 1, max: 3 } ["a", "b", "c", "d"]
  void $ runGen $ H.uniqueArray ["a", "b", "c", "d", "e"] 3
  void $ runGen $ H.uniqueArrayGen Lorem.word 3
  void $ runGen $ H.choose 1 100
  void $ runGen $ H.chooseFloat 0.0 1.0
  void $ runGen $ H.oneOf [Lorem.word, Lorem.sentence]
  void $ runGen $ H.frequency [Tuple 5.0 Lorem.word, Tuple 1.0 Lorem.sentence]
  multi <- runGen $ H.multiple Lorem.word 4
  log $ "multiple: " <> show multi
  rng <- runGen $ H.multipleRange Lorem.word { min: 2, max: 5 }
  log $ "multipleRange: " <> show rng
  sym <- runGen $ H.replaceSymbols "###-???-***"
  log $ "replaceSymbols: " <> sym
  void $ runGen $ H.replaceCreditCardSymbols "####-####-####-###L" "#"
  rx <- runGen $ H.fromRegExp "[A-Z]{3}[0-9]{4}"
  log $ "fromRegExp: " <> rx
  void $ runGen $ H.fakePattern "{{person.firstName}} {{person.lastName}}"
  log $ "slugify: " <> H.slugify "Hello World"
  log $ "mustache: " <> H.mustache "Hello {{name}}" { name: "PureScript" }

  -- Lorem
  log "\n--- Lorem ---"
  void $ runGen Lorem.word
  void $ runGen $ Lorem.wordN 5
  void $ runGen $ Lorem.wordRange { min: 3, max: 8 }
  void $ runGen Lorem.words
  void $ runGen $ Lorem.wordsN 5
  void $ runGen $ Lorem.wordsRange { min: 2, max: 6 }
  s <- runGen Lorem.sentence
  log $ "sentence: " <> s
  void $ runGen $ Lorem.sentenceN 10
  void $ runGen $ Lorem.sentenceRange { min: 3, max: 7 }
  void $ runGen Lorem.sentences
  void $ runGen $ Lorem.sentencesN 3
  void $ runGen $ Lorem.sentencesOpts { count: 2, separator: " | " }
  void $ runGen Lorem.paragraph
  void $ runGen $ Lorem.paragraphN 2
  void $ runGen $ Lorem.paragraphRange { min: 2, max: 4 }
  void $ runGen Lorem.paragraphs
  void $ runGen $ Lorem.paragraphsN 2
  void $ runGen $ Lorem.paragraphsOpts { count: 2, separator: "\n---\n" }
  void $ runGen Lorem.slug
  void $ runGen $ Lorem.slugN 3
  void $ runGen $ Lorem.slugRange { min: 2, max: 5 }
  void $ runGen Lorem.lines
  void $ runGen $ Lorem.linesN 3
  void $ runGen $ Lorem.linesRange { min: 1, max: 4 }
  void $ runGen Lorem.text
  log "all Lorem methods OK"

  -- Person
  log "\n--- Person ---"
  void $ runGen Person.firstName
  void $ runGen $ Person.firstNameWithSex "female"
  void $ runGen Person.lastName
  void $ runGen $ Person.lastNameWithSex "male"
  void $ runGen Person.middleName
  void $ runGen $ Person.middleNameWithSex "female"
  void $ runGen Person.fullName
  void $ runGen $ Person.fullNameOpts { firstName: "Ada", lastName: "Lovelace", sex: "female" }
  void $ runGen Person.gender
  void $ runGen Person.sex
  void $ runGen Person.sexType
  void $ runGen Person.bio
  void $ runGen Person.prefix
  void $ runGen $ Person.prefixWithSex "male"
  void $ runGen Person.suffix
  void $ runGen Person.jobTitle
  void $ runGen Person.jobDescriptor
  void $ runGen Person.jobArea
  void $ runGen Person.jobType
  void $ runGen Person.zodiacSign
  log "all Person methods OK"

  -- Number
  log "\n--- Number ---"
  n <- runGen Number.int
  log $ "int: " <> show n
  void $ runGen $ Number.intRange { min: 1, max: 100 }
  void $ runGen $ Number.intOpts { min: 0, max: 100, multipleOf: 5 }
  void $ runGen Number.float
  void $ runGen $ Number.floatRange { min: 0.0, max: 10.0 }
  void $ runGen $ Number.floatOpts { min: 0.0, max: 10.0, fractionDigits: 2 }
  void $ runGen Number.binary
  void $ runGen $ Number.binaryRange { min: 0, max: 255 }
  void $ runGen Number.octal
  void $ runGen $ Number.octalRange { min: 0, max: 255 }
  void $ runGen Number.hex
  void $ runGen $ Number.hexRange { min: 0, max: 255 }
  void $ runGen Number.romanNumeral
  void $ runGen $ Number.romanNumeralRange { min: 1, max: 100 }
  log "all Number methods OK"

  -- String
  log "\n--- String ---"
  void $ runGen FString.uuid
  void $ runGen FString.ulid
  void $ runGen FString.nanoid
  void $ runGen $ FString.nanoidN 10
  void $ runGen FString.alpha
  void $ runGen $ FString.alphaOpts { length: 10, casing: "upper" }
  void $ runGen FString.alphanumeric
  void $ runGen $ FString.alphanumericOpts { length: 8, casing: "lower" }
  void $ runGen FString.numeric
  void $ runGen $ FString.numericOpts { length: 5, allowLeadingZeros: false }
  void $ runGen FString.hexadecimal
  void $ runGen $ FString.hexadecimalOpts { length: 8, casing: "lower", prefix: "0x" }
  void $ runGen FString.binary
  void $ runGen $ FString.binaryOpts { length: 8, prefix: "0b" }
  void $ runGen FString.octal
  void $ runGen $ FString.octalOpts { length: 8, prefix: "0o" }
  void $ runGen FString.sample
  void $ runGen $ FString.sampleN 20
  void $ runGen $ FString.fromCharacters "abc"
  void $ runGen $ FString.fromCharactersN "xyz" 5
  void $ runGen FString.symbol
  void $ runGen $ FString.symbolN 5
  log "all String methods OK"

  -- Datatype
  log "\n--- Datatype ---"
  void $ runGen Datatype.boolean
  void $ runGen $ Datatype.booleanWithProbability 0.8
  log "all Datatype methods OK"

  -- Date
  log "\n--- Date ---"
  void $ runGen Date.anytime
  void $ runGen Date.past
  void $ runGen $ Date.pastOpts { years: 5 }
  void $ runGen Date.future
  void $ runGen $ Date.futureOpts { years: 3 }
  void $ runGen $ Date.between { from: "2020-01-01", to: "2025-01-01" }
  void $ runGen $ Date.betweens { from: "2020-01-01", to: "2025-01-01", count: 3 }
  void $ runGen Date.recent
  void $ runGen $ Date.recentOpts { days: 7 }
  void $ runGen Date.soon
  void $ runGen $ Date.soonOpts { days: 3 }
  void $ runGen Date.birthdate
  void $ runGen $ Date.birthdateByAge { min: 18, max: 65 }
  void $ runGen $ Date.birthdateByYear { min: 1960, max: 2000 }
  void $ runGen Date.month
  void $ runGen Date.monthAbbreviated
  void $ runGen Date.weekday
  void $ runGen Date.weekdayAbbreviated
  void $ runGen Date.timeZone
  log "all Date methods OK"

  -- Commerce
  log "\n--- Commerce ---"
  void $ runGen Commerce.department
  void $ runGen Commerce.productName
  void $ runGen Commerce.price
  void $ runGen $ Commerce.priceOpts { min: 10.0, max: 50.0, dec: 2, symbol: "$" }
  void $ runGen Commerce.productAdjective
  void $ runGen Commerce.productMaterial
  void $ runGen Commerce.product
  void $ runGen Commerce.productDescription
  void $ runGen Commerce.isbn
  void $ runGen $ Commerce.isbnOpts { variant: 10, separator: "-" }
  void $ runGen Commerce.upc
  void $ runGen $ Commerce.upcOpts { prefix: "123" }
  log "all Commerce methods OK"

  -- Company
  log "\n--- Company ---"
  void $ runGen Company.name
  void $ runGen Company.catchPhrase
  void $ runGen Company.buzzPhrase
  void $ runGen Company.catchPhraseAdjective
  void $ runGen Company.catchPhraseDescriptor
  void $ runGen Company.catchPhraseNoun
  void $ runGen Company.buzzAdjective
  void $ runGen Company.buzzVerb
  void $ runGen Company.buzzNoun
  log "all Company methods OK"

  -- Internet
  log "\n--- Internet ---"
  void $ runGen Internet.email
  void $ runGen $ Internet.emailOpts { firstName: "Ada", lastName: "Lovelace", provider: "example.com", allowSpecialCharacters: false }
  void $ runGen Internet.exampleEmail
  void $ runGen $ Internet.exampleEmailOpts { firstName: "Ada", lastName: "Lovelace", allowSpecialCharacters: false }
  void $ runGen Internet.username
  void $ runGen $ Internet.usernameOpts { firstName: "Ada", lastName: "Lovelace" }
  void $ runGen Internet.displayName
  void $ runGen $ Internet.displayNameOpts { firstName: "Ada", lastName: "Lovelace" }
  void $ runGen Internet.protocol
  void $ runGen Internet.httpMethod
  void $ runGen Internet.httpStatusCode
  void $ runGen Internet.url
  void $ runGen $ Internet.urlOpts { appendSlash: true, protocol: "https" }
  void $ runGen Internet.domainName
  void $ runGen Internet.domainSuffix
  void $ runGen Internet.domainWord
  void $ runGen Internet.ip
  void $ runGen Internet.ipv4
  void $ runGen $ Internet.ipv4Opts { cidrBlock: "192.168.0.0/16" }
  void $ runGen Internet.ipv6
  void $ runGen Internet.port
  void $ runGen Internet.userAgent
  void $ runGen Internet.mac
  void $ runGen $ Internet.macWithSeparator "-"
  void $ runGen Internet.password
  void $ runGen $ Internet.passwordOpts { length: 20, memorable: true, prefix: "pw_" }
  void $ runGen Internet.emoji
  void $ runGen Internet.jwt
  void $ runGen Internet.jwtAlgorithm
  log "all Internet methods OK"

  -- Location
  log "\n--- Location ---"
  void $ runGen Location.city
  void $ runGen Location.street
  void $ runGen Location.streetAddress
  void $ runGen $ Location.streetAddressOpts { useFullAddress: true }
  void $ runGen Location.buildingNumber
  void $ runGen Location.secondaryAddress
  void $ runGen Location.county
  void $ runGen Location.country
  void $ runGen Location.continent
  void $ runGen Location.countryCode
  void $ runGen $ Location.countryCodeOpts { variant: "alpha-3" }
  void $ runGen Location.state
  void $ runGen $ Location.stateOpts { abbreviated: true }
  void $ runGen Location.zipCode
  void $ runGen Location.direction
  void $ runGen $ Location.directionOpts { abbreviated: false }
  void $ runGen Location.directionAbbr
  void $ runGen Location.cardinalDirection
  void $ runGen $ Location.cardinalDirectionOpts { abbreviated: true }
  void $ runGen Location.cardinalDirectionAbbr
  void $ runGen Location.ordinalDirection
  void $ runGen $ Location.ordinalDirectionOpts { abbreviated: true }
  void $ runGen Location.ordinalDirectionAbbr
  void $ runGen Location.timeZone
  void $ runGen Location.latitude
  void $ runGen $ Location.latitudeOpts { max: 50.0, min: 40.0, precision: 6 }
  void $ runGen Location.longitude
  void $ runGen $ Location.longitudeOpts { max: 10.0, min: -10.0, precision: 4 }
  void $ runGen Location.nearbyGPSCoordinate
  void $ runGen $ Location.nearbyGPSCoordinateOpts { origin: [48.8566, 2.3522], radius: 5.0, isMetric: true }
  lang <- runGen Location.language
  log $ "language: " <> lang.name <> " (" <> lang.alpha2 <> "/" <> lang.alpha3 <> ")"
  log "all Location methods OK"

  -- Finance
  log "\n--- Finance ---"
  void $ runGen Finance.accountNumber
  void $ runGen $ Finance.accountNumberOpts { length: 12 }
  void $ runGen Finance.accountName
  void $ runGen Finance.routingNumber
  void $ runGen Finance.amount
  void $ runGen $ Finance.amountOpts { min: 100.0, max: 500.0, dec: 2, symbol: "$" }
  void $ runGen Finance.transactionType
  cur <- runGen Finance.currency
  log $ "currency: " <> cur.name <> " " <> cur.code <> " " <> cur.symbol <> " #" <> cur.numericCode
  void $ runGen Finance.currencyCode
  void $ runGen Finance.currencyName
  void $ runGen Finance.currencySymbol
  cnc <- runGen Finance.currencyNumericCode
  log $ "currencyNumericCode: " <> cnc
  void $ runGen Finance.bitcoinAddress
  void $ runGen Finance.litecoinAddress
  void $ runGen Finance.creditCardNumber
  void $ runGen $ Finance.creditCardNumberOpts { issuer: "visa" }
  void $ runGen Finance.creditCardCVV
  void $ runGen Finance.creditCardIssuer
  void $ runGen Finance.pin
  void $ runGen $ Finance.pinN 6
  void $ runGen Finance.ethereumAddress
  void $ runGen Finance.iban
  void $ runGen $ Finance.ibanOpts { formatted: true, countryCode: "DE" }
  void $ runGen Finance.bic
  void $ runGen $ Finance.bicOpts { includeBranchCode: true }
  void $ runGen Finance.transactionDescription
  log "all Finance methods OK"

  -- Airline
  log "\n--- Airline ---"
  ap <- runGen Airline.airport
  log $ "airport: " <> ap.name <> " (" <> ap.iataCode <> ")"
  al <- runGen Airline.airline
  log $ "airline: " <> al.name <> " (" <> al.iataCode <> ")"
  plane <- runGen Airline.airplane
  log $ "airplane: " <> plane.name <> " (" <> plane.iataTypeCode <> ")"
  void $ runGen Airline.recordLocator
  void $ runGen $ Airline.recordLocatorOpts { allowNumerics: true, allowVisuallySimilarCharacters: false }
  void $ runGen Airline.seat
  void $ runGen $ Airline.seatOpts { aircraftType: "widebody" }
  void $ runGen Airline.aircraftType
  void $ runGen Airline.flightNumber
  void $ runGen $ Airline.flightNumberOpts { length: 4, addLeadingZeros: true }
  log "all Airline methods OK"

  -- Science
  log "\n--- Science ---"
  el <- runGen Science.chemicalElement
  log $ "element: " <> el.name <> " (" <> el.symbol <> ") Z=" <> show el.atomicNumber
  u <- runGen Science.unit
  log $ "unit: " <> u.name <> " (" <> u.symbol <> ")"
  log "all Science methods OK"

  -- Color
  log "\n--- Color ---"
  void $ runGen Color.human
  void $ runGen Color.space
  void $ runGen Color.rgb
  void $ runGen Color.rgbCss
  void $ runGen Color.cmyk
  void $ runGen Color.hsl
  void $ runGen Color.hwb
  void $ runGen Color.lab
  void $ runGen Color.lch
  void $ runGen Color.cssSupportedFunction
  void $ runGen Color.cssSupportedSpace
  void $ runGen Color.colorByCSSColorSpace
  void $ runGen $ Color.colorByCSSColorSpaceOpts { space: "sRGB" }
  log "all Color methods OK"

  -- Image
  log "\n--- Image ---"
  void $ runGen Image.avatar
  void $ runGen Image.avatarGitHub
  void $ runGen Image.url
  void $ runGen $ Image.urlOpts { width: 640, height: 480 }
  void $ runGen Image.urlPicsumPhotos
  void $ runGen $ Image.urlPicsumPhotosOpts { width: 320, height: 240, grayscale: true, blur: 2 }
  void $ runGen Image.dataUri
  void $ runGen $ Image.dataUriOpts { width: 100, height: 100, color: "blue", format: "svg-base64" }
  void $ runGen Image.personPortrait
  void $ runGen $ Image.personPortraitOpts { sex: "female", size: 512 }
  log "all Image methods OK"

  -- System
  log "\n--- System ---"
  void $ runGen System.fileName
  void $ runGen System.commonFileName
  void $ runGen $ System.commonFileNameExt "pdf"
  void $ runGen System.mimeType
  void $ runGen System.commonFileType
  void $ runGen System.commonFileExt
  void $ runGen System.fileType
  void $ runGen System.fileExt
  void $ runGen $ System.fileExtMime "image/jpeg"
  void $ runGen System.directoryPath
  void $ runGen System.filePath
  void $ runGen System.semver
  void $ runGen System.networkInterface
  void $ runGen $ System.networkInterfaceOpts { interfaceType: "en", interfaceSchema: "index" }
  void $ runGen System.cron
  void $ runGen $ System.cronOpts { includeYear: true, includeNonStandard: false }
  log "all System methods OK"

  -- Simple modules (smoke test each)
  log "\n--- Simple modules ---"
  void $ runGen Animal.dog
  void $ runGen Animal.cat
  void $ runGen Animal.snake
  void $ runGen Animal.bear
  void $ runGen Animal.lion
  void $ runGen Animal.cetacean
  void $ runGen Animal.horse
  void $ runGen Animal.bird
  void $ runGen Animal.cow
  void $ runGen Animal.fish
  void $ runGen Animal.crocodilia
  void $ runGen Animal.insect
  void $ runGen Animal.rabbit
  void $ runGen Animal.rodent
  void $ runGen Animal.type_
  void $ runGen Animal.petName
  log "Animal OK"

  void $ runGen Book.author
  void $ runGen Book.format
  void $ runGen Book.genre
  void $ runGen Book.publisher
  void $ runGen Book.series
  void $ runGen Book.title
  log "Book OK"

  void $ runGen Database.column
  void $ runGen Database.type_
  void $ runGen Database.collation
  void $ runGen Database.engine
  void $ runGen Database.mongodbObjectId
  log "Database OK"

  void $ runGen Food.adjective
  void $ runGen Food.description
  void $ runGen Food.dish
  void $ runGen Food.ethnicCategory
  void $ runGen Food.fruit
  void $ runGen Food.ingredient
  void $ runGen Food.meat
  void $ runGen Food.spice
  void $ runGen Food.vegetable
  log "Food OK"

  void $ runGen Git.branch
  void $ runGen Git.commitMessage
  void $ runGen Git.commitSha
  void $ runGen $ Git.commitShaN 7
  void $ runGen Git.commitEntry
  void $ runGen $ Git.commitEntryOpts { merge: true, eol: "LF" }
  void $ runGen Git.commitDate
  log "Git OK"

  void $ runGen Hacker.abbreviation
  void $ runGen Hacker.adjective
  void $ runGen Hacker.noun
  void $ runGen Hacker.verb
  void $ runGen Hacker.ingverb
  void $ runGen Hacker.phrase
  log "Hacker OK"

  void $ runGen Music.album
  void $ runGen Music.artist
  void $ runGen Music.genre
  void $ runGen Music.songName
  log "Music OK"

  void $ runGen Phone.phoneNumber
  void $ runGen $ Phone.phoneNumberWithStyle "international"
  void $ runGen Phone.imei
  log "Phone OK"

  void $ runGen Vehicle.vehicle
  void $ runGen Vehicle.manufacturer
  void $ runGen Vehicle.model
  void $ runGen Vehicle.type_
  void $ runGen Vehicle.fuel
  void $ runGen Vehicle.vin
  void $ runGen Vehicle.color
  void $ runGen Vehicle.vrm
  void $ runGen Vehicle.bicycle
  log "Vehicle OK"

  -- Word module
  void $ runGen Word.adjective
  void $ runGen $ Word.adjectiveN 5
  void $ runGen Word.adverb
  void $ runGen $ Word.adverbN 5
  void $ runGen Word.conjunction
  void $ runGen $ Word.conjunctionN 5
  void $ runGen Word.interjection
  void $ runGen $ Word.interjectionN 5
  void $ runGen Word.noun
  void $ runGen $ Word.nounN 5
  void $ runGen Word.preposition
  void $ runGen $ Word.prepositionN 5
  void $ runGen Word.verb
  void $ runGen $ Word.verbN 5
  void $ runGen Word.sample
  void $ runGen $ Word.sampleN 7
  void $ runGen Word.words
  void $ runGen $ Word.wordsN 5
  log "Word OK"

  log "\n=== ALL 28 MODULES TESTED ==="
