module Faker.Color
  ( human
  , space
  , rgb
  , rgbCss
  , cmyk
  , hsl
  , hwb
  , lab
  , lch
  , cssSupportedFunction
  , cssSupportedSpace
  , colorByCSSColorSpace
  , colorByCSSColorSpaceOpts
  , ColorByCSSColorSpaceOpts
  ) where

import Effect (Effect)
import Faker.Gen (Gen(..))

type ColorByCSSColorSpaceOpts = { space :: String }

foreign import humanImpl :: Effect String
foreign import spaceImpl :: Effect String
foreign import rgbImpl :: Effect String
foreign import rgbCssImpl :: Effect String
foreign import cmykImpl :: Effect String
foreign import hslImpl :: Effect String
foreign import hwbImpl :: Effect String
foreign import labImpl :: Effect String
foreign import lchImpl :: Effect String
foreign import cssSupportedFunctionImpl :: Effect String
foreign import cssSupportedSpaceImpl :: Effect String
foreign import colorByCSSColorSpaceImpl :: Effect (Array Number)
foreign import colorByCSSColorSpaceOptsImpl :: ColorByCSSColorSpaceOpts -> Effect (Array Number)

-- | Generate a human-readable color name.
human :: Gen String
human = Gen humanImpl

-- | Generate a color space name.
space :: Gen String
space = Gen spaceImpl

-- | Generate a random RGB color in hex format.
rgb :: Gen String
rgb = Gen rgbImpl

-- | Generate a random RGB color in CSS format (e.g. "rgb(r, g, b)").
rgbCss :: Gen String
rgbCss = Gen rgbCssImpl

-- | Generate a random CMYK color in CSS format.
cmyk :: Gen String
cmyk = Gen cmykImpl

-- | Generate a random HSL color in CSS format.
hsl :: Gen String
hsl = Gen hslImpl

-- | Generate a random HWB color in CSS format.
hwb :: Gen String
hwb = Gen hwbImpl

-- | Generate a random LAB color in CSS format.
lab :: Gen String
lab = Gen labImpl

-- | Generate a random LCH color in CSS format.
lch :: Gen String
lch = Gen lchImpl

-- | Generate a random CSS supported color function name.
cssSupportedFunction :: Gen String
cssSupportedFunction = Gen cssSupportedFunctionImpl

-- | Generate a random CSS supported color space name.
cssSupportedSpace :: Gen String
cssSupportedSpace = Gen cssSupportedSpaceImpl

-- | Generate a random color as an array of 3 components in a random CSS color space.
colorByCSSColorSpace :: Gen (Array Number)
colorByCSSColorSpace = Gen colorByCSSColorSpaceImpl

-- | Generate a random color in a specific CSS color space (e.g. "sRGB", "display-p3", "rec2020").
colorByCSSColorSpaceOpts :: ColorByCSSColorSpaceOpts -> Gen (Array Number)
colorByCSSColorSpaceOpts opts = Gen (colorByCSSColorSpaceOptsImpl opts)
