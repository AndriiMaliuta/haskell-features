module Codewars.Kata.Capitals where

import Data.List
import Data.Char

capitals :: String -> [Int]
capitals ls = findIndices isUpper ls