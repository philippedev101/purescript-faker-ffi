module Faker.Lorem
  ( word
  , wordN
  , wordRange
  , words
  , wordsN
  , wordsRange
  , sentence
  , sentenceN
  , sentenceRange
  , sentences
  , sentencesN
  , sentencesOpts
  , SentencesOpts
  , paragraph
  , paragraphN
  , paragraphRange
  , paragraphs
  , paragraphsN
  , paragraphsOpts
  , ParagraphsOpts
  , slug
  , slugN
  , slugRange
  , lines
  , linesN
  , linesRange
  , text
  , RangeOpts
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

type RangeOpts = { min :: Int, max :: Int }
type SentencesOpts = { count :: Int, separator :: String }
type ParagraphsOpts = { count :: Int, separator :: String }

foreign import wordImpl :: Effect String
foreign import wordNImpl :: Int -> Effect String
foreign import wordRangeImpl :: RangeOpts -> Effect String
foreign import wordsImpl :: Effect String
foreign import wordsNImpl :: Int -> Effect String
foreign import wordsRangeImpl :: RangeOpts -> Effect String
foreign import sentenceImpl :: Effect String
foreign import sentenceNImpl :: Int -> Effect String
foreign import sentenceRangeImpl :: RangeOpts -> Effect String
foreign import sentencesImpl :: Effect String
foreign import sentencesNImpl :: Int -> Effect String
foreign import sentencesOptsImpl :: SentencesOpts -> Effect String
foreign import paragraphImpl :: Effect String
foreign import paragraphNImpl :: Int -> Effect String
foreign import paragraphRangeImpl :: RangeOpts -> Effect String
foreign import paragraphsImpl :: Effect String
foreign import paragraphsNImpl :: Int -> Effect String
foreign import paragraphsOptsImpl :: ParagraphsOpts -> Effect String
foreign import slugImpl :: Effect String
foreign import slugNImpl :: Int -> Effect String
foreign import slugRangeImpl :: RangeOpts -> Effect String
foreign import linesImpl :: Effect String
foreign import linesNImpl :: Int -> Effect String
foreign import linesRangeImpl :: RangeOpts -> Effect String
foreign import textImpl :: Effect String

-- | Generate a random lorem word with default options.
word :: Gen String
word = Gen wordImpl

-- | Generate a random lorem word of specified length.
wordN :: Int -> Gen String
wordN n = Gen (wordNImpl n)

-- | Generate a random lorem word with length in a range.
wordRange :: RangeOpts -> Gen String
wordRange opts = Gen (wordRangeImpl opts)

-- | Generate random lorem words (default count).
words :: Gen String
words = Gen wordsImpl

-- | Generate a specific number of lorem words.
wordsN :: Int -> Gen String
wordsN n = Gen (wordsNImpl n)

-- | Generate lorem words with count in a range.
wordsRange :: RangeOpts -> Gen String
wordsRange opts = Gen (wordsRangeImpl opts)

-- | Generate a random lorem sentence with default word count.
sentence :: Gen String
sentence = Gen sentenceImpl

-- | Generate a random lorem sentence with specified word count.
sentenceN :: Int -> Gen String
sentenceN n = Gen (sentenceNImpl n)

-- | Generate a random lorem sentence with word count in a range.
sentenceRange :: RangeOpts -> Gen String
sentenceRange opts = Gen (sentenceRangeImpl opts)

-- | Generate random lorem sentences with default count.
sentences :: Gen String
sentences = Gen sentencesImpl

-- | Generate a specific number of lorem sentences.
sentencesN :: Int -> Gen String
sentencesN n = Gen (sentencesNImpl n)

-- | Generate lorem sentences with count and custom separator.
sentencesOpts :: SentencesOpts -> Gen String
sentencesOpts opts = Gen (sentencesOptsImpl opts)

-- | Generate a random lorem paragraph with default sentence count.
paragraph :: Gen String
paragraph = Gen paragraphImpl

-- | Generate a random lorem paragraph with specified sentence count.
paragraphN :: Int -> Gen String
paragraphN n = Gen (paragraphNImpl n)

-- | Generate a random lorem paragraph with sentence count in a range.
paragraphRange :: RangeOpts -> Gen String
paragraphRange opts = Gen (paragraphRangeImpl opts)

-- | Generate random lorem paragraphs with default count.
paragraphs :: Gen String
paragraphs = Gen paragraphsImpl

-- | Generate a specific number of lorem paragraphs.
paragraphsN :: Int -> Gen String
paragraphsN n = Gen (paragraphsNImpl n)

-- | Generate lorem paragraphs with count and custom separator.
paragraphsOpts :: ParagraphsOpts -> Gen String
paragraphsOpts opts = Gen (paragraphsOptsImpl opts)

-- | Generate a random lorem slug with default word count.
slug :: Gen String
slug = Gen slugImpl

-- | Generate a random lorem slug with specified word count.
slugN :: Int -> Gen String
slugN n = Gen (slugNImpl n)

-- | Generate a random lorem slug with word count in a range.
slugRange :: RangeOpts -> Gen String
slugRange opts = Gen (slugRangeImpl opts)

-- | Generate random lorem lines with default count.
lines :: Gen String
lines = Gen linesImpl

-- | Generate a specific number of lorem lines.
linesN :: Int -> Gen String
linesN n = Gen (linesNImpl n)

-- | Generate lorem lines with count in a range.
linesRange :: RangeOpts -> Gen String
linesRange opts = Gen (linesRangeImpl opts)

-- | Generate random lorem text (may include words, sentences, or paragraphs).
text :: Gen String
text = Gen textImpl
